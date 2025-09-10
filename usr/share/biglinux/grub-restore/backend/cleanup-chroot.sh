#!/bin/bash
# Cleans up the chroot environment by unmounting partitions.

set -e

log_message() { echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >&2; }

log_message "Starting chroot cleanup..."
sync

# Unmount EFI first, then root
umount -l /mnt/boot/efi 2>/dev/null || true
umount -l /mnt 2>/dev/null || true

log_message "Chroot cleanup finished."
exit 0
