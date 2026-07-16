import sys
from pathlib import Path


PROJECT_APP = Path(__file__).parents[1] / "usr/share/biglinux/grub-restore"
sys.path.insert(0, str(PROJECT_APP))

from gui.window import GrubRestoreWindow  # noqa: E402
from utils.translation import _  # noqa: E402


def test_failed_process_never_uses_success_copy():
    result = GrubRestoreWindow._get_result_messages(None, 1, "backend failed")

    assert result["title"] == _("Operation Failed!")
    assert result["description"] == "backend failed"


def test_backend_steps_have_user_facing_progress_text():
    assert GrubRestoreWindow._translate_backend_step("Installing GRUB for EFI") == _(
        "Installing GRUB for EFI..."
    )
