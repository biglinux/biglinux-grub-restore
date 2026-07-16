import json
import os
import stat
import subprocess
import sys
from pathlib import Path


PROJECT_APP = Path(__file__).parents[1] / "usr/share/biglinux/grub-restore"
sys.path.insert(0, str(PROJECT_APP))

from backend.system_interface import EFI_PARTTYPE_GUID, SystemInterface  # noqa: E402


def device(
    path,
    device_type,
    *,
    fstype=None,
    uuid=None,
    partuuid=None,
    parttype=None,
    model=None,
    size=0,
    pttype=None,
    rm=False,
    mountpoints=None,
    children=None,
):
    name = path.removeprefix("/dev/")
    return {
        "path": path,
        "name": name,
        "kname": name,
        "type": device_type,
        "fstype": fstype,
        "uuid": uuid,
        "partuuid": partuuid,
        "parttype": parttype,
        "partlabel": None,
        "label": None,
        "pkname": None,
        "model": model,
        "size": size,
        "pttype": pttype,
        "rm": rm,
        "mountpoints": mountpoints or [],
        "children": children or [],
    }


def inventory():
    return {
        "blockdevices": [
            device(
                "/dev/sda",
                "disk",
                model="Live USB",
                size=16_000_000_000,
                pttype="gpt",
                rm=True,
                children=[
                    device(
                        "/dev/sda1",
                        "part",
                        fstype="vfat",
                        uuid="LIVE-EFI",
                        parttype=EFI_PARTTYPE_GUID,
                        mountpoints=["/run/miso/bootmnt"],
                    )
                ],
            ),
            device(
                "/dev/nvme0n1",
                "disk",
                model="Fast NVMe",
                size=1_000_000_000_000,
                pttype="gpt",
                children=[
                    device(
                        "/dev/nvme0n1p1",
                        "part",
                        fstype="vfat",
                        uuid="SYSTEM-EFI",
                        partuuid="esp-partuuid",
                        parttype=EFI_PARTTYPE_GUID,
                        size=536_870_912,
                    ),
                    device(
                        "/dev/nvme0n1p2",
                        "part",
                        fstype="btrfs",
                        uuid="ROOT-UUID",
                        size=999_000_000_000,
                    ),
                    device(
                        "/dev/nvme0n1p3",
                        "part",
                        fstype="ext4",
                        uuid="BOOT-UUID",
                        size=1_073_741_824,
                    ),
                ],
            ),
            device(
                "/dev/sdb",
                "disk",
                model="Data Disk",
                size=2_000_000_000_000,
                pttype="gpt",
                children=[
                    device(
                        "/dev/sdb1",
                        "part",
                        fstype="vfat",
                        uuid="FAT-DATA",
                        size=10_000_000_000,
                    )
                ],
            ),
        ]
    }


class FakeRunner:
    def __init__(self, block_inventory):
        self.block_inventory = block_inventory
        self.calls = []

    def __call__(self, args, **kwargs):
        self.calls.append(args)
        if args[0] == "lsblk":
            return subprocess.CompletedProcess(args, 0, json.dumps(self.block_inventory), "")
        if args[0] == "os-prober":
            output = "/dev/nvme0n1p2:BigCommunity:BigLinux:linux\n"
            return subprocess.CompletedProcess(args, 0, output, "")
        if args[0] == "mount":
            return subprocess.CompletedProcess(args, 32, "", "fixture does not mount")
        return subprocess.CompletedProcess(args, 0, "", "")


def build_interface(tmp_path):
    runner = FakeRunner(inventory())
    interface = SystemInterface(command_runner=runner, runtime_dir=tmp_path / "session")
    return interface, runner


def test_detection_excludes_live_and_regular_fat_partitions(tmp_path):
    interface, _runner = build_interface(tmp_path)

    interface.detect_systems()

    assert [item["device"] for item in interface.efi_partitions] == ["/dev/nvme0n1p1"]
    assert [item["partition"] for item in interface.detected_systems] == ["/dev/nvme0n1p2"]
    assert interface.detected_systems[0]["disk"] == "/dev/nvme0n1"
    assert "/dev/sda" not in [item["device"] for item in interface.grub_disks]


def test_recommends_esp_on_same_physical_disk(tmp_path):
    interface, _runner = build_interface(tmp_path)
    interface.detect_systems()

    ranked = interface.recommend_efi_partitions(interface.detected_systems[0])

    assert ranked[0]["device"] == "/dev/nvme0n1p1"
    assert ranked[0]["recommended"] is True
    assert ranked[0]["score"] == 60


def test_fstab_match_has_strongest_recommendation(tmp_path):
    interface, _runner = build_interface(tmp_path)
    interface.detect_systems()
    system = interface.detected_systems[0]
    system["efi_partition"] = "/dev/nvme0n1p1"

    ranked = interface.recommend_efi_partitions(system)

    assert ranked[0]["score"] == 160
    assert "boot/efi" in ranked[0]["reason"]


def test_parser_rejects_duplicate_and_non_linux_results(tmp_path):
    interface, _runner = build_interface(tmp_path)
    interface._load_block_inventory()
    output = "\n".join(
        [
            "/dev/nvme0n1p2:BigLinux:BigLinux:linux",
            "/dev/nvme0n1p2:BigLinux:BigLinux:linux",
            "/dev/nvme0n1p1:Windows:Windows:chain",
        ]
    )

    systems = interface._parse_os_prober(output)

    assert len(systems) == 1
    assert systems[0]["filesystem"] == "btrfs"
    assert systems[0]["uuid"] == "ROOT-UUID"


def test_runtime_directory_is_private(tmp_path):
    runtime = tmp_path / "session"
    interface = SystemInterface(command_runner=FakeRunner(inventory()), runtime_dir=runtime)

    assert stat.S_IMODE(os.stat(runtime).st_mode) == 0o700
    assert interface.mount_point.parent == runtime


def test_fstab_resolves_subvolume_boot_and_efi(tmp_path):
    interface, _runner = build_interface(tmp_path)
    interface._load_block_inventory()
    root = tmp_path / "mounted-root"
    (root / "etc").mkdir(parents=True)
    (root / "etc/os-release").write_text(
        'ID=biglinux\nPRETTY_NAME="BigLinux Test"\n', encoding="utf-8"
    )
    (root / "etc/fstab").write_text(
        "UUID=ROOT-UUID / btrfs defaults,subvol=@system 0 0\n"
        "UUID=BOOT-UUID /boot ext4 defaults 0 2\n"
        "UUID=SYSTEM-EFI /boot/efi vfat umask=0077 0 2\n",
        encoding="utf-8",
    )
    system = {
        "filesystem": "btrfs",
        "name": "Detected",
        "root_subvol": "",
        "boot_partition": "",
        "boot_subvol": "",
        "efi_partition": "",
        "efi_mountpoint": "/boot/efi",
    }

    interface._read_installation_metadata(root, system)

    assert system["root_subvol"] == "@system"
    assert system["boot_partition"] == "/dev/nvme0n1p3"
    assert system["efi_partition"] == "/dev/nvme0n1p1"
    assert system["efi_mountpoint"] == "/boot/efi"
    assert system["name"] == "BigLinux Test"
    assert system["supported"] is True


def test_human_readable_sizes():
    assert SystemInterface.format_size(536_870_912) == "512.0 MiB"
    assert SystemInterface.format_size(1_073_741_824) == "1.0 GiB"


def test_cancel_restore_terminates_the_process_group(tmp_path):
    interface, _runner = build_interface(tmp_path)
    interface.current_process = subprocess.Popen(["bash", "-c", "sleep 30"], start_new_session=True)

    interface.cancel_restore()
    return_code = interface.current_process.wait(timeout=2)

    assert return_code < 0


def test_runtime_is_not_removed_when_mount_cleanup_fails(tmp_path):
    interface, _runner = build_interface(tmp_path)
    interface.cleanup_chroot = lambda: subprocess.CompletedProcess([], 1, "", "busy")

    interface.cleanup_runtime()

    assert interface.runtime_dir.exists()
