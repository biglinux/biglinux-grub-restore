import subprocess
from pathlib import Path


BACKEND = Path(__file__).parents[1] / "usr/share/biglinux/grub-restore/backend"


def test_backend_scripts_have_valid_bash_syntax():
    scripts = [
        BACKEND / "common.sh",
        BACKEND / "prepare-chroot.sh",
        BACKEND / "cleanup-chroot.sh",
        BACKEND / "grub-restore",
        BACKEND / "grub-apply-efi",
        BACKEND / "grub-apply-legacy",
    ]
    for script in scripts:
        subprocess.run(["bash", "-n", script], check=True)


def test_package_repair_runs_before_grub_command_detection():
    for script_name in ("grub-apply-efi", "grub-apply-legacy"):
        script = (BACKEND / script_name).read_text(encoding="utf-8")

        assert script.index('case "$RESTORE_MODE"') < script.index("detect_grub_commands")


def test_cleanup_rejects_global_mount_point():
    result = subprocess.run(
        [BACKEND / "cleanup-chroot.sh", "--mount-point", "/mnt"],
        text=True,
        capture_output=True,
        check=False,
    )

    assert result.returncode != 0
    assert "Unsafe mount point" in result.stderr


def test_fstab_root_repair_creates_backup(tmp_path):
    mount_point = tmp_path / "mnt"
    fstab = mount_point / "etc/fstab"
    fstab.parent.mkdir(parents=True)
    original = "UUID=OLD / ext4 defaults,subvol=@old 0 0\n"
    fstab.write_text(original, encoding="utf-8")
    script = """
source "$1"
MOUNT_POINT=$2
ROOT_UUID=ROOT-UUID
ROOT_FILESYSTEM=btrfs
ROOT_SUBVOL=@system
REPAIR_FSTAB=1
READ_ONLY=0
repair_root_fstab
"""

    result = subprocess.run(
        ["bash", "-c", script, "bash", BACKEND / "common.sh", mount_point],
        text=True,
        capture_output=True,
        check=False,
    )

    assert result.returncode == 0, result.stderr
    assert fstab.read_text(encoding="utf-8") == (
        "UUID=ROOT-UUID / btrfs defaults,subvol=@system 0 0\n"
    )
    assert (fstab.parent / "fstab.biglinux-grub-restore.bak").read_text(
        encoding="utf-8"
    ) == original


def test_initramfs_regeneration_is_mandatory():
    script = """
source "$1"
MOUNT_POINT=/tmp/biglinux-grub-restore-test/mnt
chroot_has() { return 1; }
regenerate_initramfs
"""

    result = subprocess.run(
        ["bash", "-c", script, "bash", BACKEND / "common.sh"],
        text=True,
        capture_output=True,
        check=False,
    )

    assert result.returncode != 0
    assert "No supported initramfs generator" in result.stderr


def test_mkinitcpio_repair_adds_required_hooks_and_backup(tmp_path):
    mount_point = tmp_path / "mnt"
    config = mount_point / "etc/mkinitcpio.conf"
    config.parent.mkdir(parents=True)
    original = "HOOKS=(base udev autodetect fsck)\n"
    config.write_text(original, encoding="utf-8")
    script = """
source "$1"
MOUNT_POINT=$2
REPAIR_MKINITCPIO=1
READ_ONLY=0
repair_mkinitcpio_config
"""

    result = subprocess.run(
        ["bash", "-c", script, "bash", BACKEND / "common.sh", mount_point],
        text=True,
        capture_output=True,
        check=False,
    )

    assert result.returncode == 0, result.stderr
    assert config.read_text(encoding="utf-8") == (
        "HOOKS=(base udev autodetect block filesystems fsck)\n"
    )
    assert (config.parent / "mkinitcpio.conf.biglinux-grub-restore.bak").read_text(
        encoding="utf-8"
    ) == original
