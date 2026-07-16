#!/usr/bin/env python3
"""Safe interface between the GTK frontend and the privileged backend."""

from __future__ import annotations

import json
import os
import platform
import re
import shlex
import signal
import shutil
import socket
import subprocess
import tempfile
from pathlib import Path

from utils.translation import _


EFI_PARTTYPE_GUID = "c12a7328-f81f-11d2-ba4b-00a0c93ec93b"
BIOS_BOOT_PARTTYPE_GUID = "21686148-6449-6e6f-744e-656564454649"
SUPPORTED_DISTROS = {"arch", "biglinux", "bigcommunity", "manjaro"}


class SystemInterface:
    """Discover installations and execute validated restore operations."""

    LSBLK_COLUMNS = (
        "PATH,NAME,KNAME,TYPE,FSTYPE,UUID,PARTUUID,PARTTYPE,PARTLABEL,"
        "LABEL,PKNAME,MODEL,SIZE,PTTYPE,RM,MOUNTPOINTS"
    )

    def __init__(self, *, command_runner=None, runtime_dir=None):
        self.backend_path = Path(__file__).parent
        self._run = command_runner or subprocess.run
        self.runtime_dir = Path(runtime_dir) if runtime_dir else self._create_runtime_dir()
        self.runtime_dir.mkdir(mode=0o700, parents=True, exist_ok=True)
        self.runtime_dir.chmod(0o700)
        self.mount_point = self.runtime_dir / "mnt"
        self.probe_point = self.runtime_dir / "probe"
        self.mount_point.mkdir(mode=0o700, parents=True, exist_ok=True)
        self.probe_point.mkdir(mode=0o700, parents=True, exist_ok=True)

        self.detected_systems = []
        self.efi_partitions = []
        self.grub_disks = []
        self.block_devices = []
        self._devices_by_path = {}
        self.boot_mode = None
        self.secure_boot = False
        self.effective_boot_mode = None
        self.selected_system = None
        self.selected_efi = None
        self.selected_disk = None
        self.boot_diagnostics = None
        self.current_process = None
        self.prepare_process = None

    @staticmethod
    def _create_runtime_dir():
        base = Path("/run/biglinux-grub-restore")
        try:
            base.mkdir(mode=0o700, parents=True, exist_ok=True)
            path = Path(tempfile.mkdtemp(prefix="session-", dir=base))
        except OSError:
            path = Path(tempfile.mkdtemp(prefix="biglinux-grub-restore-"))
        path.chmod(0o700)
        return path

    def _run_command(self, args, **kwargs):
        defaults = {"capture_output": True, "text": True}
        defaults.update(kwargs)
        return self._run(args, **defaults)

    @staticmethod
    def _flatten_devices(devices, parent_path=None):
        flattened = []
        for raw in devices:
            device = dict(raw)
            children = device.pop("children", []) or []
            device["parent_path"] = parent_path
            device["path"] = device.get("path") or f"/dev/{device.get('name', '')}"
            flattened.append(device)
            flattened.extend(SystemInterface._flatten_devices(children, device["path"]))
        return flattened

    def _load_block_inventory(self):
        result = self._run_command(
            ["lsblk", "--json", "--bytes", "--output", self.LSBLK_COLUMNS],
            check=True,
        )
        payload = json.loads(result.stdout)
        self.block_devices = self._flatten_devices(payload.get("blockdevices", []))
        self._devices_by_path = {
            os.path.realpath(device["path"]): device for device in self.block_devices
        }

    def _device(self, path):
        if not path:
            return None
        return self._devices_by_path.get(os.path.realpath(path))

    def _top_disk(self, path):
        device = self._device(path)
        seen = set()
        while device and device.get("type") != "disk":
            current = device.get("path")
            if current in seen:
                return None
            seen.add(current)
            device = self._device(device.get("parent_path"))
        return device

    @staticmethod
    def _mountpoints(device):
        value = device.get("mountpoints") or []
        if isinstance(value, str):
            return [value] if value else []
        return [item for item in value if item]

    def _live_disks(self):
        markers = ("/run/miso", "/run/archiso", "/run/live", "/cdrom")
        live = set()
        for device in self.block_devices:
            if any(point.startswith(markers) for point in self._mountpoints(device)):
                disk = self._top_disk(device["path"])
                if disk:
                    live.add(os.path.realpath(disk["path"]))
        return live

    def _parse_os_prober(self, output):
        systems = []
        seen = set()
        for raw_line in output.splitlines():
            line = raw_line.strip()
            if not line:
                continue
            parts = line.split(":", 3)
            if len(parts) != 4 or parts[3].lower() != "linux":
                continue
            partition, name, description, system_type = parts
            canonical = os.path.realpath(partition)
            identity = (canonical, name.casefold())
            if identity in seen or "timeshift" in line.lower():
                continue
            device = self._device(partition)
            if not device:
                continue
            seen.add(identity)
            systems.append(
                {
                    "partition": device["path"],
                    "name": name or description or _("Linux system"),
                    "description": description,
                    "type": system_type,
                    "filesystem": (device.get("fstype") or "").lower(),
                    "uuid": device.get("uuid") or "",
                    "root_subvol": "",
                    "fstab_root_spec": "",
                    "fstab_root_path": "",
                    "fstab_root_subvol": "",
                    "boot_partition": "",
                    "boot_subvol": "",
                    "efi_partition": "",
                    "efi_mountpoint": "/boot/efi",
                    "distro_id": "",
                    "supported": False,
                }
            )
        return systems

    @staticmethod
    def _parse_os_release(path):
        values = {}
        try:
            for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
                if "=" not in line or line.lstrip().startswith("#"):
                    continue
                key, value = line.split("=", 1)
                values[key] = value.strip().strip('"').strip("'")
        except OSError:
            return values
        return values

    def _resolve_fstab_spec(self, spec):
        if spec.startswith("UUID="):
            wanted = spec[5:]
            return next(
                (item["path"] for item in self.block_devices if item.get("uuid") == wanted),
                "",
            )
        if spec.startswith("PARTUUID="):
            wanted = spec[9:]
            return next(
                (item["path"] for item in self.block_devices if item.get("partuuid") == wanted),
                "",
            )
        if spec.startswith("LABEL="):
            wanted = spec[6:]
            return next(
                (item["path"] for item in self.block_devices if item.get("label") == wanted),
                "",
            )
        if spec.startswith("PARTLABEL="):
            wanted = spec[10:]
            return next(
                (item["path"] for item in self.block_devices if item.get("partlabel") == wanted),
                "",
            )
        if spec.startswith("/dev/"):
            device = self._device(spec)
            return device["path"] if device else ""
        return ""

    def _read_installation_metadata(self, root, system):
        os_release = self._parse_os_release(root / "etc/os-release")
        distro_id = os_release.get("ID", "").lower()
        if os_release.get("PRETTY_NAME"):
            system["name"] = os_release["PRETTY_NAME"]
        system["distro_id"] = distro_id
        system["supported"] = distro_id in SUPPORTED_DISTROS

        fstab = root / "etc/fstab"
        try:
            lines = fstab.read_text(encoding="utf-8", errors="replace").splitlines()
        except OSError:
            return
        for raw in lines:
            line = raw.split("#", 1)[0].strip()
            fields = re.split(r"\s+", line) if line else []
            if len(fields) < 4:
                continue
            spec, mountpoint, _fstype, options = fields[:4]
            path = self._resolve_fstab_spec(spec)
            if mountpoint == "/":
                system["fstab_root_spec"] = spec
                system["fstab_root_path"] = path
                match = re.search(r"(?:^|,)subvol=([^,]+)", options)
                if match:
                    system["fstab_root_subvol"] = match.group(1).lstrip("/")
                    if system["filesystem"] == "btrfs" and not system["root_subvol"]:
                        system["root_subvol"] = system["fstab_root_subvol"]
            elif mountpoint == "/boot":
                system["boot_partition"] = path
                match = re.search(r"(?:^|,)subvol=([^,]+)", options)
                if match:
                    system["boot_subvol"] = match.group(1).lstrip("/")
            elif mountpoint in {"/boot/efi", "/efi"}:
                system["efi_partition"] = path
                system["efi_mountpoint"] = mountpoint

    def _inspect_system(self, system):
        device = system["partition"]
        filesystem = system["filesystem"]
        candidates = [""]
        mount_options = "ro"
        if filesystem == "btrfs":
            mount_options = "ro,subvolid=5"

        try:
            result = self._run_command(
                ["mount", "-o", mount_options, device, str(self.probe_point)],
                timeout=15,
            )
            if result.returncode != 0:
                return
            if filesystem == "btrfs":
                result = self._run_command(
                    ["btrfs", "subvolume", "list", str(self.probe_point)],
                    timeout=15,
                )
                if result.returncode == 0:
                    candidates.extend(
                        match.group(1)
                        for line in result.stdout.splitlines()
                        if (match := re.search(r"\spath\s(.+)$", line))
                    )

            roots = []
            for subvol in dict.fromkeys(candidates):
                root = self.probe_point / subvol
                if (root / "etc/os-release").is_file():
                    release = self._parse_os_release(root / "etc/os-release")
                    detected_name = system["name"].casefold()
                    release_name = release.get("PRETTY_NAME", "").casefold()
                    name_match = bool(
                        detected_name
                        and release_name
                        and (detected_name in release_name or release_name in detected_name)
                    )
                    preferred_name = subvol in {"@", "root", "@root"}
                    roots.append((not name_match, not preferred_name, len(subvol), subvol, root))
            if not roots:
                return
            roots.sort()
            _name_rank, _preferred_rank, _length, subvol, root = roots[0]
            system["root_subvol"] = subvol
            self._read_installation_metadata(root, system)
        except (OSError, subprocess.SubprocessError):
            return
        finally:
            self._unmount_probe(
                self.probe_point,
                _("Could not unmount the temporary system inspection point."),
            )

    def _unmount_probe(self, probe, error_message):
        status = self._run_command(["findmnt", "-n", "--mountpoint", str(probe)])
        if status.returncode != 0 or not status.stdout.strip():
            return
        result = self._run_command(["umount", str(probe)])
        if result.returncode != 0:
            raise RuntimeError(error_message)

    def _detect_efi_partitions(self):
        live_disks = self._live_disks()
        candidates = []
        seen_devices = set()
        for device in self.block_devices:
            fstype = (device.get("fstype") or "").lower()
            parttype = (device.get("parttype") or "").lower()
            if device.get("type") != "part":
                continue
            if fstype not in {"vfat", "fat", "fat12", "fat16", "fat32"}:
                continue
            if parttype not in {EFI_PARTTYPE_GUID, "0xef", "ef"}:
                continue
            canonical = os.path.realpath(device["path"])
            if canonical in seen_devices:
                continue
            disk = self._top_disk(device["path"])
            if not disk or os.path.realpath(disk["path"]) in live_disks:
                continue
            has_efi_directory = self._efi_has_boot_structure(device["path"])
            candidates.append(
                {
                    "device": device["path"],
                    "uuid": device.get("uuid") or "",
                    "partuuid": device.get("partuuid") or "",
                    "label": device.get("label") or device.get("partlabel") or "",
                    "size": device.get("size") or 0,
                    "disk": disk["path"],
                    "disk_model": disk.get("model") or disk.get("name") or "",
                    "has_efi_directory": has_efi_directory,
                    "score": 0,
                    "recommended": False,
                    "reason": "",
                }
            )
            seen_devices.add(canonical)
        return candidates

    def _efi_has_boot_structure(self, device):
        probe = self.runtime_dir / "efi-probe"
        probe.mkdir(mode=0o700, exist_ok=True)
        try:
            result = self._run_command(
                ["mount", "-o", "ro", device, str(probe)],
                timeout=15,
            )
            if result.returncode != 0:
                return False
            return (probe / "EFI").is_dir()
        except (OSError, subprocess.SubprocessError):
            return False
        finally:
            self._unmount_probe(
                probe,
                _("Could not unmount the temporary EFI inspection point."),
            )

    def _detect_grub_disks(self):
        live_disks = self._live_disks()
        disks = []
        for device in self.block_devices:
            if device.get("type") != "disk":
                continue
            if os.path.realpath(device["path"]) in live_disks:
                continue
            has_bios_boot = any(
                child.get("parent_path") == device["path"]
                and (child.get("parttype") or "").lower() == BIOS_BOOT_PARTTYPE_GUID
                for child in self.block_devices
            )
            disks.append(
                {
                    "device": device["path"],
                    "size": device.get("size") or 0,
                    "name": device.get("model") or device.get("name") or _("Unknown disk"),
                    "table": (device.get("pttype") or "unknown").lower(),
                    "has_bios_boot": has_bios_boot,
                }
            )
        return disks

    def detect_systems(self):
        """Discover devices without unmounting anything owned by the user."""
        try:
            self._load_block_inventory()
            result = self._run_command(
                ["os-prober"],
                env={**os.environ, "GRUB_DISABLE_OS_PROBER": "false"},
                timeout=60,
            )
            self.detected_systems = self._parse_os_prober(result.stdout)
            for system in self.detected_systems:
                self._inspect_system(system)
                disk = self._top_disk(system["partition"])
                system["disk"] = disk["path"] if disk else ""
            self.efi_partitions = self._detect_efi_partitions()
            self.grub_disks = self._detect_grub_disks()
            self.determine_boot_config()
            return True
        except (OSError, ValueError, json.JSONDecodeError, subprocess.SubprocessError) as error:
            raise RuntimeError(_("System detection failed: %s") % error) from error

    def determine_boot_config(self):
        self.boot_mode = "EFI" if Path("/sys/firmware/efi").exists() else "LEGACY"
        self.secure_boot = False
        for variable in Path("/sys/firmware/efi/efivars").glob("SecureBoot-*"):
            try:
                payload = variable.read_bytes()
                self.secure_boot = len(payload) > 4 and payload[4] == 1
            except OSError:
                continue
            break

    def recommend_efi_partitions(self, system):
        root_disk = system.get("disk") or ""
        fstab_efi = os.path.realpath(system.get("efi_partition") or "")
        ranked = []
        for original in self.efi_partitions:
            candidate = dict(original)
            score = 20
            reasons = []
            if fstab_efi and os.path.realpath(candidate["device"]) == fstab_efi:
                score += 100
                reasons.append(_("Configured as /boot/efi in the selected system"))
            if root_disk and os.path.realpath(candidate["disk"]) == os.path.realpath(root_disk):
                score += 40
                reasons.append(_("Same physical disk as the selected system"))
            if candidate.get("has_efi_directory"):
                score += 10
                reasons.append(_("Contains an existing EFI boot directory"))
            candidate["score"] = score
            candidate["reason"] = "; ".join(reasons) or _("Valid EFI System Partition")
            ranked.append(candidate)

        ranked.sort(key=lambda item: (-item["score"], item["device"]))
        if ranked and ranked[0]["score"] >= 60:
            tied = len(ranked) > 1 and ranked[1]["score"] == ranked[0]["score"]
            if not tied:
                ranked[0]["recommended"] = True
        return ranked

    @staticmethod
    def format_size(value):
        try:
            size = float(value)
        except (TypeError, ValueError):
            return _("Unknown size")
        units = ["B", "KiB", "MiB", "GiB", "TiB"]
        for unit in units:
            if size < 1024 or unit == units[-1]:
                return f"{size:.0f} {unit}" if unit == "B" else f"{size:.1f} {unit}"
            size /= 1024
        return _("Unknown size")

    def check_network_connection(self):
        try:
            with socket.create_connection(("geo.mirror.pkgbuild.com", 443), timeout=4):
                return True
        except OSError:
            return False

    @staticmethod
    def _fstab_root_entry(path):
        try:
            lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        except OSError:
            return None
        for raw in lines:
            line = raw.split("#", 1)[0].strip()
            fields = re.split(r"\s+", line) if line else []
            if len(fields) >= 4 and fields[1] == "/":
                match = re.search(r"(?:^|,)subvol=([^,]+)", fields[3])
                return {
                    "spec": fields[0],
                    "filesystem": fields[2],
                    "options": fields[3],
                    "subvol": match.group(1).lstrip("/") if match else "",
                }
        return None

    @staticmethod
    def _grub_root_arguments(text):
        uuids = set(re.findall(r"(?:^|\s)root=UUID=([^\s\"']+)", text))
        subvolumes = set()
        for rootflags in re.findall(r"(?:^|\s)rootflags=([^\s\"']+)", text):
            match = re.search(r"(?:^|,)subvol=([^,]+)", rootflags)
            if match:
                subvolumes.add(match.group(1).lstrip("/"))
        return sorted(uuids), sorted(subvolumes)

    @staticmethod
    def _mkinitcpio_hooks(path):
        try:
            text = path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            return []
        match = re.search(r"^\s*HOOKS=\((.*?)\)", text, flags=re.MULTILINE | re.DOTALL)
        if not match:
            return []
        try:
            return shlex.split(re.sub(r"#.*", "", match.group(1)))
        except ValueError:
            return []

    def diagnose_mounted_system(self):
        """Inspect the mounted installation without modifying it."""
        if not self.selected_system:
            raise ValueError(_("No system was selected."))

        root = self.mount_point
        system = self.selected_system
        device = self._device(system["partition"]) or {}
        actual_uuid = device.get("uuid") or system.get("uuid") or ""
        actual_subvol = (system.get("root_subvol") or "").lstrip("/")
        issues = []

        def add_issue(code, severity, message, *, repairable=False, confirmation=False):
            issues.append(
                {
                    "code": code,
                    "severity": severity,
                    "message": message,
                    "repairable": repairable,
                    "confirmation": confirmation,
                }
            )

        if not (root / "etc/os-release").is_file():
            add_issue(
                "invalid_root",
                "error",
                _("The selected root does not contain a recognizable Linux installation."),
            )
        if not actual_uuid:
            add_issue(
                "missing_root_uuid",
                "error",
                _("The selected root filesystem has no UUID."),
            )

        fstab_entry = self._fstab_root_entry(root / "etc/fstab")
        if not fstab_entry:
            add_issue(
                "missing_fstab_root",
                "error",
                _("No root filesystem entry was found in /etc/fstab."),
            )
        else:
            resolved = self._resolve_fstab_spec(fstab_entry["spec"])
            if not resolved or os.path.realpath(resolved) != os.path.realpath(system["partition"]):
                add_issue(
                    "fstab_root_mismatch",
                    "error",
                    _("The root entry in /etc/fstab points to a different or missing device."),
                    repairable=True,
                    confirmation=True,
                )
            if fstab_entry["filesystem"].lower() != system.get("filesystem", "").lower():
                add_issue(
                    "fstab_filesystem_mismatch",
                    "error",
                    _("The root filesystem type in /etc/fstab does not match the detected system."),
                    repairable=True,
                    confirmation=True,
                )
            if (
                system.get("filesystem") == "btrfs"
                and actual_subvol
                and fstab_entry["subvol"] != actual_subvol
            ):
                add_issue(
                    "fstab_subvol_mismatch",
                    "error",
                    _("The root subvolume in /etc/fstab does not match the detected system."),
                    repairable=True,
                    confirmation=True,
                )

        kernels = sorted(
            path.name
            for pattern in ("vmlinuz-*", "vmlinuz-linux*")
            for path in (root / "boot").glob(pattern)
            if path.is_file() or path.is_symlink()
        )
        unified_images = sorted(
            path.name for path in (root / "boot/EFI/Linux").glob("*.efi") if path.is_file()
        )
        initramfs_images = sorted(
            path.name
            for pattern in ("initramfs-*.img", "initrd.img-*")
            for path in (root / "boot").glob(pattern)
            if path.is_file() or path.is_symlink()
        )
        if not kernels and not unified_images:
            add_issue(
                "missing_kernel",
                "error",
                _("No bootable kernel image was found in /boot."),
            )
        if kernels and not initramfs_images:
            add_issue(
                "missing_initramfs",
                "warning",
                _("No initramfs image was found; the repair must regenerate it."),
            )

        generators = [
            name
            for name in ("mkinitcpio", "dracut", "update-initramfs")
            if (root / "usr/bin" / name).exists() or (root / "usr/sbin" / name).exists()
        ]
        if not generators:
            add_issue(
                "missing_initramfs_generator",
                "error",
                _("No supported initramfs generator was found in the installed system."),
            )

        mkinitcpio_hooks = []
        mkinitcpio_presets = []
        missing_mkinitcpio_hooks = []
        if "mkinitcpio" in generators:
            mkinitcpio_hooks = self._mkinitcpio_hooks(root / "etc/mkinitcpio.conf")
            mkinitcpio_presets = sorted(
                path.name for path in (root / "etc/mkinitcpio.d").glob("*.preset")
            )
            if not mkinitcpio_presets:
                add_issue(
                    "missing_mkinitcpio_presets",
                    "error",
                    _("No mkinitcpio preset was found; no initramfs can be regenerated safely."),
                )
            if not mkinitcpio_hooks:
                add_issue(
                    "invalid_mkinitcpio_config",
                    "error",
                    _("The HOOKS array in /etc/mkinitcpio.conf could not be read."),
                )
            else:
                missing_mkinitcpio_hooks = [
                    hook for hook in ("block", "filesystems") if hook not in mkinitcpio_hooks
                ]
                if missing_mkinitcpio_hooks:
                    add_issue(
                        "mkinitcpio_missing_hooks",
                        "error",
                        _(
                            "The initramfs configuration is missing hooks required to find and mount the root filesystem."
                        ),
                        repairable=True,
                        confirmation=True,
                    )

        grub_path = next(
            (
                path
                for path in (root / "boot/grub/grub.cfg", root / "boot/grub2/grub.cfg")
                if path.is_file()
            ),
            None,
        )
        grub_uuids = []
        grub_subvolumes = []
        if grub_path:
            try:
                grub_text = grub_path.read_text(encoding="utf-8", errors="replace")
            except OSError:
                grub_text = ""
            grub_uuids, grub_subvolumes = self._grub_root_arguments(grub_text)
            if actual_uuid and grub_uuids and actual_uuid not in grub_uuids:
                add_issue(
                    "grub_root_mismatch",
                    "warning",
                    _("The current GRUB configuration references a different root UUID."),
                )
            if actual_subvol and grub_subvolumes and actual_subvol not in grub_subvolumes:
                add_issue(
                    "grub_subvol_mismatch",
                    "warning",
                    _("The current GRUB configuration references a different Btrfs subvolume."),
                )
        else:
            add_issue(
                "missing_grub_config",
                "warning",
                _("No GRUB configuration file was found; the repair must create it."),
            )

        if system.get("filesystem") == "btrfs":
            try:
                stats = self._run_command(
                    ["btrfs", "device", "stats", "--check", str(root)], timeout=15
                )
            except (OSError, subprocess.SubprocessError):
                stats = None
            if stats is not None and stats.returncode != 0:
                add_issue(
                    "btrfs_device_errors",
                    "warning",
                    _("Btrfs reports device errors. Back up important data before writing."),
                    confirmation=True,
                )

        blocking = any(issue["severity"] == "error" and not issue["repairable"] for issue in issues)
        repairable = any(issue["repairable"] for issue in issues)
        repair_fstab = any(issue["code"].startswith("fstab_") for issue in issues)
        repair_mkinitcpio = any(issue["code"] == "mkinitcpio_missing_hooks" for issue in issues)
        confirmation = any(issue["confirmation"] for issue in issues)
        status = (
            "blocked" if blocking else "repair" if repairable else "warning" if issues else "ok"
        )
        report = {
            "status": status,
            "blocking": blocking,
            "repairable": repairable,
            "repair_fstab": repair_fstab,
            "repair_mkinitcpio": repair_mkinitcpio,
            "requires_confirmation": confirmation,
            "issues": issues,
            "root_uuid": actual_uuid,
            "root_subvol": actual_subvol,
            "fstab_root_spec": fstab_entry["spec"] if fstab_entry else "",
            "fstab_root_subvol": fstab_entry["subvol"] if fstab_entry else "",
            "grub_root_uuids": grub_uuids,
            "grub_root_subvolumes": grub_subvolumes,
            "kernels": sorted(set(kernels)),
            "initramfs_images": sorted(set(initramfs_images)),
            "unified_images": unified_images,
            "initramfs_generators": generators,
            "mkinitcpio_hooks": mkinitcpio_hooks,
            "mkinitcpio_presets": mkinitcpio_presets,
            "missing_mkinitcpio_hooks": missing_mkinitcpio_hooks,
        }
        self.boot_diagnostics = report
        return report

    def _validate_device(self, path, *, expected_types):
        device = self._device(path)
        if not device or device.get("type") not in expected_types:
            raise ValueError(_("Invalid block device selected: %s") % path)
        if not Path(device["path"]).exists():
            raise ValueError(_("Selected block device no longer exists: %s") % path)
        return device["path"]

    def save_selection(
        self,
        selected_system,
        selected_efi=None,
        selected_disk=None,
        effective_boot_mode=None,
    ):
        self.selected_system = selected_system
        self.selected_efi = selected_efi
        self.selected_disk = selected_disk
        self.effective_boot_mode = effective_boot_mode or self.boot_mode

    def _backend_arguments(self, *, include_target=True):
        if not self.selected_system:
            raise ValueError(_("No system was selected."))
        root = self._validate_device(
            self.selected_system["partition"], expected_types={"part", "crypt", "lvm"}
        )
        args = [
            "--root",
            root,
            "--filesystem",
            self.selected_system.get("filesystem") or "auto",
            "--mount-point",
            str(self.mount_point),
        ]
        if self.selected_system.get("uuid"):
            args.extend(["--root-uuid", self.selected_system["uuid"]])
        if self.selected_system.get("root_subvol"):
            args.extend(["--root-subvol", self.selected_system["root_subvol"]])
        if self.selected_system.get("boot_partition"):
            boot = self._validate_device(
                self.selected_system["boot_partition"], expected_types={"part", "crypt", "lvm"}
            )
            args.extend(["--boot", boot])
            if self.selected_system.get("boot_subvol"):
                args.extend(["--boot-subvol", self.selected_system["boot_subvol"]])
        args.extend(["--efi-mount", self.selected_system.get("efi_mountpoint") or "/boot/efi"])
        if include_target and self.effective_boot_mode == "EFI":
            efi = self._validate_device(self.selected_efi, expected_types={"part"})
            valid = {item["device"] for item in self.efi_partitions}
            if efi not in valid:
                raise ValueError(
                    _("The selected partition is not a validated EFI System Partition.")
                )
            args.extend(["--efi", efi])
        elif include_target and self.effective_boot_mode == "LEGACY":
            disk = self._validate_device(self.selected_disk, expected_types={"disk"})
            disk_info = next(item for item in self.grub_disks if item["device"] == disk)
            if disk_info["table"] == "gpt" and not disk_info["has_bios_boot"]:
                raise ValueError(_("The selected GPT disk has no BIOS boot partition."))
            args.extend(["--disk", disk])
        return args

    def execute_restore(self, mode, *, repair_fstab=False, repair_mkinitcpio=False):
        if mode not in {1, 2, 3}:
            raise ValueError(_("Invalid restore mode."))
        if platform.machine() not in {"x86_64", "amd64"}:
            raise RuntimeError(_("This GRUB restore backend currently supports x86-64 only."))
        if mode in {2, 3} and not self.selected_system.get("supported"):
            raise RuntimeError(
                _("Package repair is supported only for BigLinux, Arch Linux, and Manjaro systems.")
            )
        script_name = "grub-apply-efi" if self.effective_boot_mode == "EFI" else "grub-apply-legacy"
        args = [str(self.backend_path / script_name), "--mode", str(mode)]
        args.extend(self._backend_arguments())
        if repair_fstab:
            args.append("--repair-fstab")
        if repair_mkinitcpio:
            args.append("--repair-mkinitcpio")
        args.extend(["--bootloader-id", self.selected_system.get("distro_id") or "biglinux"])
        try:
            self.current_process = subprocess.Popen(
                args,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                encoding="utf-8",
                errors="replace",
                bufsize=1,
                start_new_session=True,
            )
            return self.current_process
        except OSError as error:
            raise RuntimeError(_("Failed to execute restore: %s") % error) from error

    def prepare_chroot(self, *, read_only=False, include_efi=True):
        args = [str(self.backend_path / "prepare-chroot.sh")]
        args.extend(self._backend_arguments(include_target=False))
        if read_only:
            args.append("--read-only")
        if include_efi and self.selected_efi:
            args.extend(
                ["--efi", self._validate_device(self.selected_efi, expected_types={"part"})]
            )
        try:
            self.prepare_process = subprocess.Popen(
                args,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                encoding="utf-8",
                errors="replace",
                start_new_session=True,
            )
            stdout, stderr = self.prepare_process.communicate(timeout=30)
            return subprocess.CompletedProcess(
                args, self.prepare_process.returncode, stdout, stderr
            )
        except subprocess.TimeoutExpired:
            if self.prepare_process:
                os.killpg(self.prepare_process.pid, signal.SIGTERM)
                try:
                    stdout, stderr = self.prepare_process.communicate(timeout=5)
                except subprocess.TimeoutExpired:
                    os.killpg(self.prepare_process.pid, signal.SIGKILL)
                    stdout, stderr = self.prepare_process.communicate()
            else:
                stdout, stderr = "", ""
            return subprocess.CompletedProcess(args, 124, stdout, stderr)
        finally:
            self.prepare_process = None

    def cleanup_chroot(self):
        args = [
            str(self.backend_path / "cleanup-chroot.sh"),
            "--mount-point",
            str(self.mount_point),
        ]
        try:
            return self._run_command(args, timeout=30)
        except (OSError, subprocess.SubprocessError) as error:
            return subprocess.CompletedProcess(args, 127, "", str(error))

    def cancel_restore(self):
        for process in (self.current_process, self.prepare_process):
            if process and process.poll() is None:
                try:
                    os.killpg(process.pid, signal.SIGTERM)
                except ProcessLookupError:
                    pass

    def cleanup_runtime(self):
        cleanup_succeeded = False
        try:
            result = self.cleanup_chroot()
            cleanup_succeeded = result.returncode == 0
        except (OSError, subprocess.SubprocessError):
            cleanup_succeeded = False
        if not cleanup_succeeded:
            return
        try:
            mounted = self._run_command(["findmnt", "-Rno", "TARGET", str(self.mount_point)])
        except OSError:
            return
        if mounted.returncode != 0 or not mounted.stdout.strip():
            shutil.rmtree(self.runtime_dir, ignore_errors=True)

    def shutdown(self):
        processes = (self.current_process, self.prepare_process)
        self.cancel_restore()
        for process in processes:
            if not process or process.poll() is not None:
                continue
            try:
                process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                # Preserve the runtime directory if a child refuses to stop.
                return
        self.cleanup_runtime()

    def get_system_summary(self, selected_system, selected_efi=None, selected_disk=None):
        summary = {
            "boot_mode": self.boot_mode,
            "secure_boot": self.secure_boot,
            "system": selected_system,
        }
        if selected_efi:
            summary["efi_partition"] = selected_efi
        if selected_disk:
            summary["disk"] = next(
                (item for item in self.grub_disks if item["device"] == selected_disk),
                None,
            )
        return summary
