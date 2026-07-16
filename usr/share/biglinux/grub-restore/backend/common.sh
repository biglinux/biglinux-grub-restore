#!/bin/bash
# shellcheck disable=SC2034
set -Eeuo pipefail

ROOT_PARTITION=""
ROOT_UUID=""
ROOT_FILESYSTEM="auto"
ROOT_SUBVOL=""
BOOT_PARTITION=""
BOOT_SUBVOL=""
EFI_PARTITION=""
EFI_MOUNT_PATH="/boot/efi"
DISK_SELECTED=""
MOUNT_POINT=""
RESTORE_MODE="1"
BOOTLOADER_ID="biglinux"
GRUB_INSTALL_COMMAND="grub-install"
GRUB_CONFIG_COMMAND="grub-mkconfig"
GRUB_SCRIPT_CHECK_COMMAND=""
GRUB_CONFIG_PATH="/boot/grub/grub.cfg"
READ_ONLY=0
REPAIR_FSTAB=0
REPAIR_MKINITCPIO=0

log_message() {
    printf '%s: %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*" >&2
}

show_progress() {
    printf 'EVENT:STEP:%s\n' "$1"
}

fail() {
    printf 'EVENT:ERROR:%s\n' "$1" >&2
    log_message "ERROR: $1"
    exit "${2:-1}"
}

parse_arguments() {
    while (( $# )); do
        case "$1" in
            --root) ROOT_PARTITION=${2:?}; shift 2 ;;
            --root-uuid) ROOT_UUID=${2:?}; shift 2 ;;
            --filesystem) ROOT_FILESYSTEM=${2:?}; shift 2 ;;
            --root-subvol) ROOT_SUBVOL=${2:?}; shift 2 ;;
            --boot) BOOT_PARTITION=${2:?}; shift 2 ;;
            --boot-subvol) BOOT_SUBVOL=${2:?}; shift 2 ;;
            --efi) EFI_PARTITION=${2:?}; shift 2 ;;
            --efi-mount) EFI_MOUNT_PATH=${2:?}; shift 2 ;;
            --disk) DISK_SELECTED=${2:?}; shift 2 ;;
            --mount-point) MOUNT_POINT=${2:?}; shift 2 ;;
            --mode) RESTORE_MODE=${2:?}; shift 2 ;;
            --bootloader-id) BOOTLOADER_ID=${2:?}; shift 2 ;;
            --read-only) READ_ONLY=1; shift ;;
            --repair-fstab) REPAIR_FSTAB=1; shift ;;
            --repair-mkinitcpio) REPAIR_MKINITCPIO=1; shift ;;
            *) fail "Unknown backend argument: $1" 2 ;;
        esac
    done

    [[ -n "$MOUNT_POINT" ]] || fail "Mount point was not provided."
    case "$MOUNT_POINT" in
        /run/biglinux-grub-restore/session-*/mnt|/tmp/biglinux-grub-restore-*/mnt) ;;
        *) fail "Unsafe mount point: $MOUNT_POINT" ;;
    esac
    BOOTLOADER_ID=${BOOTLOADER_ID//[^[:alnum:]_-]/}
    [[ -n "$BOOTLOADER_ID" ]] || BOOTLOADER_ID=biglinux
    [[ "$EFI_MOUNT_PATH" == /boot/efi || "$EFI_MOUNT_PATH" == /efi ]] \
        || fail "Unsafe EFI mount path: $EFI_MOUNT_PATH"
    [[ -z "$ROOT_UUID" || "$ROOT_UUID" =~ ^[[:alnum:].:_-]+$ ]] \
        || fail "Unsafe root UUID."
    validate_subvolume "$ROOT_SUBVOL"
    validate_subvolume "$BOOT_SUBVOL"
}

validate_subvolume() {
    local subvolume=$1
    [[ -z "$subvolume" ]] && return 0
    [[ "$subvolume" =~ ^[[:alnum:]_@+./-]+$ ]] || fail "Unsafe subvolume path."
    [[ "/$subvolume/" != *"/../"* ]] || fail "Unsafe subvolume path."
}

require_block_device() {
    [[ -b "$1" ]] || fail "Not a block device: $1"
}

cleanup_mount_tree() {
    local target
    local failed=0
    [[ -n "$MOUNT_POINT" ]] || return 0
    while IFS= read -r target; do
        [[ -n "$target" ]] || continue
        if ! umount "$target" 2>/dev/null; then
            log_message "Warning: could not unmount $target"
            failed=1
        fi
    done < <(findmnt -Rno TARGET "$MOUNT_POINT" 2>/dev/null | sort -r)
    return "$failed"
}

mount_filesystems() {
    local root_options=defaults
    require_block_device "$ROOT_PARTITION"
    [[ -n "$BOOT_PARTITION" ]] && require_block_device "$BOOT_PARTITION"
    [[ -n "$EFI_PARTITION" ]] && require_block_device "$EFI_PARTITION"

    mkdir -p "$MOUNT_POINT"
    if mountpoint -q "$MOUNT_POINT"; then
        fail "Private mount point is already in use: $MOUNT_POINT"
    fi

    if [[ "$ROOT_FILESYSTEM" == btrfs && -n "$ROOT_SUBVOL" ]]; then
        root_options="defaults,subvol=$ROOT_SUBVOL"
    fi
    if [[ "$READ_ONLY" == 1 ]]; then
        root_options="ro,${root_options#defaults,}"
        [[ "$root_options" == ro,defaults ]] && root_options=ro
    fi
    log_message "Mounting $ROOT_PARTITION at $MOUNT_POINT ($root_options)"
    mount -o "$root_options" "$ROOT_PARTITION" "$MOUNT_POINT"

    if [[ -n "$BOOT_PARTITION" && ( "$BOOT_PARTITION" != "$ROOT_PARTITION" || -n "$BOOT_SUBVOL" ) ]]; then
        local boot_options=defaults
        [[ -n "$BOOT_SUBVOL" ]] && boot_options="defaults,subvol=$BOOT_SUBVOL"
        if [[ "$READ_ONLY" == 1 ]]; then
            boot_options="ro,${boot_options#defaults,}"
            [[ "$boot_options" == ro,defaults ]] && boot_options=ro
        fi
        mkdir -p "$MOUNT_POINT/boot"
        log_message "Mounting $BOOT_PARTITION at $MOUNT_POINT/boot ($boot_options)"
        mount -o "$boot_options" "$BOOT_PARTITION" "$MOUNT_POINT/boot"
    fi

    if [[ -n "$EFI_PARTITION" ]]; then
        mkdir -p "$MOUNT_POINT$EFI_MOUNT_PATH"
        log_message "Mounting $EFI_PARTITION at $MOUNT_POINT$EFI_MOUNT_PATH"
        local efi_options=defaults
        [[ "$READ_ONLY" == 1 ]] && efi_options=ro
        mount -o "$efi_options" "$EFI_PARTITION" "$MOUNT_POINT$EFI_MOUNT_PATH"
    fi
}

verify_selected_root() {
    local actual_uuid
    [[ -f "$MOUNT_POINT/etc/os-release" ]] \
        || fail "The selected root does not contain a recognizable Linux installation."
    actual_uuid=$(blkid -s UUID -o value "$ROOT_PARTITION" 2>/dev/null || true)
    [[ -n "$actual_uuid" ]] || fail "The selected root filesystem has no UUID."
    if [[ -n "$ROOT_UUID" && "$actual_uuid" != "$ROOT_UUID" ]]; then
        fail "The selected root UUID changed after detection. Run detection again."
    fi
    ROOT_UUID=$actual_uuid
}

repair_root_fstab() {
    [[ "$REPAIR_FSTAB" == 1 ]] || return 0
    [[ "$READ_ONLY" == 0 ]] || fail "Cannot repair /etc/fstab in read-only mode."
    local fstab="$MOUNT_POINT/etc/fstab"
    [[ -f "$fstab" ]] || fail "Cannot repair /etc/fstab because it does not exist."
    show_progress "Repairing root filesystem configuration"
    python3 - "$fstab" "$ROOT_UUID" "$ROOT_FILESYSTEM" "$ROOT_SUBVOL" <<'PY'
import os
import re
import shutil
import sys
import tempfile
from pathlib import Path

path = Path(sys.argv[1])
root_uuid = sys.argv[2]
filesystem = sys.argv[3]
root_subvol = sys.argv[4].lstrip("/")
original = path.read_text(encoding="utf-8", errors="strict")
lines = original.splitlines(keepends=True)
root_lines = 0
updated = []

for line in lines:
    body, marker, comment = line.partition("#")
    match = re.match(r"^(\s*)(\S+)(\s+)/(\s+)(\S+)(\s+)(\S+)(.*)$", body)
    if not match:
        updated.append(line)
        continue
    root_lines += 1
    prefix, _spec, gap1, gap2, fstype, gap3, options, suffix = match.groups()
    if filesystem and filesystem != "auto":
        fstype = filesystem
    if filesystem == "btrfs" and root_subvol:
        option_list = [
            item
            for item in options.split(",")
            if not item.startswith("subvol=") and not item.startswith("subvolid=")
        ]
        option_list.append(f"subvol={root_subvol}")
        options = ",".join(option_list)
    newline = "\n" if line.endswith("\n") else ""
    suffix = suffix.removesuffix("\n")
    rebuilt = f"{prefix}UUID={root_uuid}{gap1}/{gap2}{fstype}{gap3}{options}{suffix}"
    if marker:
        rebuilt += f"#{comment.removesuffix(chr(10))}"
    updated.append(rebuilt + newline)

if root_lines != 1:
    raise SystemExit(f"expected one root entry in {path}, found {root_lines}")

backup = path.with_name(f"{path.name}.biglinux-grub-restore.bak")
if not backup.exists():
    shutil.copy2(path, backup)
stat = path.stat()
fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
try:
    with os.fdopen(fd, "w", encoding="utf-8") as handle:
        handle.writelines(updated)
        handle.flush()
        os.fsync(handle.fileno())
    os.chmod(temporary, stat.st_mode)
    os.chown(temporary, stat.st_uid, stat.st_gid)
    os.replace(temporary, path)
finally:
    if os.path.exists(temporary):
        os.unlink(temporary)
PY
}

repair_mkinitcpio_config() {
    [[ "$REPAIR_MKINITCPIO" == 1 ]] || return 0
    [[ "$READ_ONLY" == 0 ]] || fail "Cannot repair mkinitcpio configuration in read-only mode."
    local config="$MOUNT_POINT/etc/mkinitcpio.conf"
    [[ -f "$config" ]] || fail "Cannot repair mkinitcpio configuration because it does not exist."
    show_progress "Repairing initramfs configuration"
    python3 - "$config" <<'PY'
import os
import re
import shlex
import shutil
import sys
import tempfile
from pathlib import Path

path = Path(sys.argv[1])
original = path.read_text(encoding="utf-8", errors="strict")
match = re.search(r"^(\s*HOOKS=\()(.*?)(\))", original, flags=re.MULTILINE | re.DOTALL)
if not match:
    raise SystemExit(f"HOOKS array not found in {path}")

uncommented = re.sub(r"#.*", "", match.group(2))
try:
    hooks = shlex.split(uncommented)
except ValueError as error:
    raise SystemExit(f"invalid HOOKS array in {path}: {error}") from error
if not hooks:
    raise SystemExit(f"empty HOOKS array in {path}")

for hook in ("block", "filesystems"):
    if hook in hooks:
        continue
    if hook == "block" and "filesystems" in hooks:
        hooks.insert(hooks.index("filesystems"), hook)
    elif "fsck" in hooks:
        hooks.insert(hooks.index("fsck"), hook)
    else:
        hooks.append(hook)

replacement = f"{match.group(1)}{' '.join(hooks)}{match.group(3)}"
updated = original[: match.start()] + replacement + original[match.end() :]
backup = path.with_name(f"{path.name}.biglinux-grub-restore.bak")
if not backup.exists():
    shutil.copy2(path, backup)
stat = path.stat()
fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
try:
    with os.fdopen(fd, "w", encoding="utf-8") as handle:
        handle.write(updated)
        handle.flush()
        os.fsync(handle.fileno())
    os.chmod(temporary, stat.st_mode)
    os.chown(temporary, stat.st_uid, stat.st_gid)
    os.replace(temporary, path)
finally:
    if os.path.exists(temporary):
        os.unlink(temporary)
PY
}

chroot_run() {
    local description=$1
    shift
    log_message "Chroot executing: $description ($*)"
    show_progress "$description"
    manjaro-chroot "$MOUNT_POINT" "$@" || fail "Failed during: $description"
}

chroot_has() {
    manjaro-chroot "$MOUNT_POINT" test -x "/usr/bin/$1" >/dev/null 2>&1 \
        || manjaro-chroot "$MOUNT_POINT" command -v "$1" >/dev/null 2>&1
}

refresh_boot_files() {
    regenerate_initramfs
    if manjaro-chroot "$MOUNT_POINT" test -d /boot/grub2; then
        GRUB_CONFIG_PATH=/boot/grub2/grub.cfg
    fi
    chroot_run "Generating GRUB configuration" "$GRUB_CONFIG_COMMAND" -o "$GRUB_CONFIG_PATH"
}

regenerate_initramfs() {
    if chroot_has mkinitcpio; then
        find "$MOUNT_POINT/etc/mkinitcpio.d" -maxdepth 1 -type f -name '*.preset' \
            -print -quit | grep -q . \
            || fail "No mkinitcpio preset was found; no initramfs can be regenerated safely."
        chroot_run "Regenerating initramfs" mkinitcpio -P
    elif chroot_has update-initramfs; then
        chroot_run "Regenerating initramfs" update-initramfs -u -k all
    elif chroot_has dracut; then
        chroot_run "Regenerating initramfs" dracut --regenerate-all --force
    else
        fail "No supported initramfs generator was found in the installed system."
    fi
}

detect_grub_commands() {
    if ! chroot_has grub-install && chroot_has grub2-install; then
        GRUB_INSTALL_COMMAND=grub2-install
    fi
    if ! chroot_has grub-mkconfig && chroot_has grub2-mkconfig; then
        GRUB_CONFIG_COMMAND=grub2-mkconfig
    fi
    if chroot_has grub-script-check; then
        GRUB_SCRIPT_CHECK_COMMAND=grub-script-check
    elif chroot_has grub2-script-check; then
        GRUB_SCRIPT_CHECK_COMMAND=grub2-script-check
    fi
    chroot_has "$GRUB_INSTALL_COMMAND" || fail "No GRUB installation command was found."
    chroot_has "$GRUB_CONFIG_COMMAND" || fail "No GRUB configuration command was found."
}

validate_boot_files() {
    local config="$MOUNT_POINT$GRUB_CONFIG_PATH"
    local default_output=""
    show_progress "Validating repaired boot files"
    [[ -s "$config" ]] || fail "The generated GRUB configuration is missing or empty."

    if [[ -n "$GRUB_SCRIPT_CHECK_COMMAND" ]]; then
        chroot_run "Checking GRUB configuration" "$GRUB_SCRIPT_CHECK_COMMAND" "$GRUB_CONFIG_PATH"
    fi

    if ! find "$MOUNT_POINT/boot" -maxdepth 1 \( -type f -o -type l \) \
        \( -name 'vmlinuz-*' -o -name 'vmlinuz-linux*' \) -print -quit | grep -q . \
        && ! find "$MOUNT_POINT/boot/EFI/Linux" -maxdepth 1 -type f -name '*.efi' \
            -print -quit 2>/dev/null | grep -q .; then
        fail "No bootable kernel image was found after the repair."
    fi

    if grep -Eq '^[[:space:]]*(linux|linuxefi)[[:space:]]' "$config"; then
        find "$MOUNT_POINT/boot" -maxdepth 1 \( -type f -o -type l \) \
            \( -name 'initramfs-*.img' -o -name 'initrd.img-*' \) -print -quit | grep -q . \
            || fail "No initramfs image was found after regeneration."
        grep -Fq "root=UUID=$ROOT_UUID" "$config" \
            || fail "The generated GRUB configuration does not reference the selected root UUID."

        if [[ "$ROOT_FILESYSTEM" == btrfs && -n "$ROOT_SUBVOL" ]] \
            && ! grep -E '^[[:space:]]*(linux|linuxefi)[[:space:]]' "$config" \
                | grep -Fq "subvol=$ROOT_SUBVOL" \
            && ! grep -E '^[[:space:]]*(linux|linuxefi)[[:space:]]' "$config" \
                | grep -Fq "subvol=/$ROOT_SUBVOL"; then
            default_output=$(btrfs subvolume get-default "$MOUNT_POINT" 2>/dev/null || true)
            [[ "$default_output" == *" path $ROOT_SUBVOL" ]] \
                || fail "The generated GRUB configuration does not reference the detected Btrfs root subvolume."
        fi
    fi
}

repair_arch_packages() {
    local complete=$1
    local keyring
    chroot_run "Removing stale package lock" rm -f /var/lib/pacman/db.lck
    if [[ "$complete" == 1 ]]; then
        for keyring in archlinux manjaro biglinux; do
            if manjaro-chroot "$MOUNT_POINT" test -e "/usr/share/pacman/keyrings/$keyring.gpg"; then
                chroot_run "Refreshing package signing keys" pacman-key --populate "$keyring"
            fi
        done
        chroot_run "Updating the installed system" pacman --noconfirm -Syu
    fi
    chroot_run "Reinstalling GRUB package" pacman --noconfirm -S grub
    if manjaro-chroot "$MOUNT_POINT" pacman -Q grub-theme-biglinux >/dev/null 2>&1; then
        if ! manjaro-chroot "$MOUNT_POINT" pacman --noconfirm -S grub-theme-biglinux; then
            log_message "Warning: optional BigLinux GRUB theme could not be reinstalled"
        fi
    fi
}
