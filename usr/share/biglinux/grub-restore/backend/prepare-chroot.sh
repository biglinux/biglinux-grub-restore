#!/bin/bash
# Prepares the chroot environment by mounting necessary partitions.
# Exits with 0 on success, 1 on failure.

set -e # Exit immediately if a command exits with a non-zero status.

log_message() { echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >&2; }

# Read from temp files
SELECTED_PARTITION=$(awk -F: '{ print $1}' /tmp/os-prober-selected)
PARTITION_FORMAT=$(awk -F: '{ print $5 }' /tmp/os-prober-selected)
EFI_PARTITION=$(cat /tmp/efi-selected 2>/dev/null || true)

# Unmount just in case
umount -l /mnt/boot/efi 2>/dev/null || true
umount -l /mnt 2>/dev/null || true

# Mount root partition
log_message "Mounting root partition $SELECTED_PARTITION to /mnt"
mount_opts=""
[ "$PARTITION_FORMAT" = "btrfs" ] && mount_opts="-o subvol=@"
mount $mount_opts "$SELECTED_PARTITION" /mnt

# Mount EFI partition if it exists
if [ -n "$EFI_PARTITION" ] && [ -b "$EFI_PARTITION" ]; then
    log_message "Mounting EFI partition $EFI_PARTITION to /mnt/boot/efi"
    mkdir -p /mnt/boot/efi
    mount "$EFI_PARTITION" /mnt/boot/efi
fi

log_message "Chroot environment prepared successfully."
exit 0
