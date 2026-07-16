#!/bin/bash
# shellcheck disable=SC2034
set -Eeuo pipefail

ROOT_PARTITION=""
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
READ_ONLY=0

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
    local grub_config=/boot/grub/grub.cfg
    if chroot_has mkinitcpio; then
        chroot_run "Regenerating initramfs" mkinitcpio -P
    fi
    if manjaro-chroot "$MOUNT_POINT" test -d /boot/grub2; then
        grub_config=/boot/grub2/grub.cfg
    fi
    chroot_run "Generating GRUB configuration" "$GRUB_CONFIG_COMMAND" -o "$grub_config"
}

detect_grub_commands() {
    if ! chroot_has grub-install && chroot_has grub2-install; then
        GRUB_INSTALL_COMMAND=grub2-install
    fi
    if ! chroot_has grub-mkconfig && chroot_has grub2-mkconfig; then
        GRUB_CONFIG_COMMAND=grub2-mkconfig
    fi
    chroot_has "$GRUB_INSTALL_COMMAND" || fail "No GRUB installation command was found."
    chroot_has "$GRUB_CONFIG_COMMAND" || fail "No GRUB configuration command was found."
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
