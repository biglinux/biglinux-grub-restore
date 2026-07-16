#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi

gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")

from gi.repository import Gtk, Adw, Gio  # noqa: E402
from .window import GrubRestoreWindow  # noqa: E402
from utils.translation import _  # noqa: E402
from utils.version import __version__  # noqa: E402


class GrubRestoreApplication(Adw.Application):
    """Main application class for BigLinux GRUB Restore"""

    def __init__(self):
        super().__init__(
            application_id="br.com.biglinux.grub-restore", flags=Gio.ApplicationFlags.DEFAULT_FLAGS
        )
        self.window = None

    def do_activate(self):
        """Activate the application"""
        if not self.window:
            self.window = GrubRestoreWindow(application=self)
        self.window.present()

    def do_startup(self):
        """Initialize the application"""
        Adw.Application.do_startup(self)
        self.create_actions()

    def do_shutdown(self):
        """Release private mounts even when the window is closed directly."""
        if self.window:
            self.window.shutdown()
        Adw.Application.do_shutdown(self)

    def create_actions(self):
        """Create application-wide actions"""
        # Quit action
        quit_action = Gio.SimpleAction.new("quit", None)
        quit_action.connect("activate", self._on_quit)
        self.add_action(quit_action)
        self.set_accels_for_action("app.quit", ["<primary>q"])

        # About action
        about_action = Gio.SimpleAction.new("about", None)
        about_action.connect("activate", self.on_about)
        self.add_action(about_action)

    def _on_quit(self, _action, _parameter):
        window = self.get_active_window()
        if window:
            window.close()
        else:
            self.quit()

    def on_about(self, action, param):
        """Show about dialog"""
        about_window = Adw.AboutWindow(
            transient_for=self.get_active_window(),
            application_name=_("BigLinux GRUB Restore"),
            application_icon="biglinux-grub-restore",
            developer_name="BigLinux Team",
            version=__version__,
            website="https://github.com/biglinux/biglinux-grub-restore",
            issue_url="https://github.com/biglinux/biglinux-grub-restore/issues",
            copyright="© 2026 BigLinux",
            license_type=Gtk.License.GPL_2_0,
            comments=_("A tool to restore the GRUB bootloader."),
            developers=["BigLinux Team"],
        )
        about_window.present()
