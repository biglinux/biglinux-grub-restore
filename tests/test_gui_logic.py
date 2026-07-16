import sys
from pathlib import Path


PROJECT_APP = Path(__file__).parents[1] / "usr/share/biglinux/grub-restore"
sys.path.insert(0, str(PROJECT_APP))

from gui.window import GrubRestoreWindow  # noqa: E402
from gui.application import GrubRestoreApplication  # noqa: E402
from gi.repository import Gio  # noqa: E402
from utils.translation import _  # noqa: E402


def test_failed_process_never_uses_success_copy():
    result = GrubRestoreWindow._get_result_messages(None, 1, "backend failed")

    assert result["title"] == _("Operation Failed!")
    assert result["description"] == "backend failed"


def test_backend_steps_have_user_facing_progress_text():
    assert GrubRestoreWindow._translate_backend_step("Installing GRUB for EFI") == _(
        "Installing GRUB for EFI..."
    )
    assert GrubRestoreWindow._translate_backend_step("Validating repaired boot files") == _(
        "Validating the repaired boot files..."
    )


def test_backend_boot_errors_are_translated():
    message = "No initramfs image was found after regeneration."

    assert GrubRestoreWindow._translate_backend_error(message) == _(message)
    cleanup_message = "GRUB was restored, but a filesystem could not be unmounted."
    assert GrubRestoreWindow._translate_backend_error(cleanup_message) == _(cleanup_message)


def test_privileged_application_does_not_require_session_bus():
    application = GrubRestoreApplication()

    assert application.get_flags() & Gio.ApplicationFlags.NON_UNIQUE


def test_terminal_log_colors_highlight_status_without_changing_plain_lines():
    assert "\033[1;31m" in GrubRestoreWindow._colorize_terminal_line("ERROR: failed\n")
    assert "\033[1;33m" in GrubRestoreWindow._colorize_terminal_line("Warning: check disk\n")
    assert "\033[1;32m" in GrubRestoreWindow._colorize_terminal_line(
        "Installation finished. No error reported.\n"
    )
    assert GrubRestoreWindow._colorize_terminal_line("ordinary output\n") == "ordinary output\n"
