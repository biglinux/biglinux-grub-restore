# BigLinux GRUB Restore

GTK4/Libadwaita recovery utility for reinstalling GRUB from a Linux live system.

## Safety model

- Detects Linux installations without unmounting user volumes.
- Accepts only validated EFI System Partitions, not arbitrary FAT partitions.
- Ranks EFI targets using the installed system's `fstab` and physical disk.
- Excludes the active live medium and de-duplicates device-mapper paths.
- Uses a private `0700` runtime directory and private mount point.
- Detects the real Btrfs root subvolume and separate `/boot` partition.
- Compares the detected root with `/etc/fstab`, GRUB kernel arguments, and initramfs files.
- Checks Btrfs device error counters before offering write operations.
- Backs up and repairs stale root UUID, subvolume, and essential mkinitcpio hooks only after confirmation.
- Requires successful initramfs generation and validates the resulting GRUB configuration.
- Cleans mounts on success, failure, cancellation, and application shutdown.
- Validates BIOS-on-GPT targets for a BIOS boot partition.

Boot repair uses the GRUB and initramfs tools already installed in the selected system and can work with multiple Linux distributions. Package repair and complete update are intentionally limited to BigLinux, Arch Linux, and Manjaro because those modes use `pacman` and `manjaro-chroot`.

## Restore modes

- **Diagnose and Repair Boot:** verifies the root UUID and subvolume, repairs confirmed configuration mismatches, regenerates initramfs, reinstalls GRUB, and validates the result.
- **Intermediate:** reinstalls the GRUB package, then performs the validated boot repair.
- **Complete:** updates the installed Arch-based system, preserves its installed kernel packages, and restores GRUB.
- **Interactive tools:** opens a terminal or available BigLinux maintenance applications inside the selected system.

## Usage

1. Boot a BigLinux live image in the same firmware mode normally used by the installed system.
2. Start **Restore the installed system**.
3. Select the installed Linux system.
4. Confirm the EFI partition marked **Recommended**, or verify the target disk in Legacy mode.
5. Start with **Diagnose and Repair Boot**.
6. Review the integrated log, then reboot after a successful result.

Do not interrupt package repair. Keep portable computers connected to power.

## Development checks

```bash
pytest -q
ruff check usr/share/biglinux/grub-restore tests
shellcheck -x -P usr/share/biglinux/grub-restore/backend \
  usr/bin/biglinux-grub-restore \
  usr/share/biglinux/grub-restore/backend/*.sh \
  usr/share/biglinux/grub-restore/backend/grub-*
for catalog in locale/*.po; do msgfmt --check --check-format -o /dev/null "$catalog"; done
```

The tests use simulated block-device inventories. They do not mount or modify real disks.

## Runtime dependencies

Python 3, GTK4, Libadwaita, VTE4, GRUB, os-prober, util-linux, btrfs-progs, pacman, and manjaro-tools-base.

Licensed under GPL-2.0-or-later.
