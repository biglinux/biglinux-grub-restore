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


def test_cleanup_rejects_global_mount_point():
    result = subprocess.run(
        [BACKEND / "cleanup-chroot.sh", "--mount-point", "/mnt"],
        text=True,
        capture_output=True,
        check=False,
    )

    assert result.returncode != 0
    assert "Unsafe mount point" in result.stderr
