#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')

from gi.repository import Gtk, Adw, Gio
from utils.translation import _

class GrubRestoreApplication(Adw.Application):
    """Main application class for BigLinux GRUB Restore"""
    
    def __init__(self):
        super().__init__(
            application_id="br.com.biglinux.grub-restore",
            flags=Gio.ApplicationFlags.DEFAULT_FLAGS
        )
        
        # Create actions
        self.create_actions()
        
        # Application window
        self.window = None
    
    def do_activate(self):
        """Activate the application"""
        
        # Create window if it doesn't exist
        if not self.window:
            # Import aqui para evitar import circular
            from gui.window import GrubRestoreWindow
            self.window = GrubRestoreWindow(application=self)
        
        # Present the window
        self.window.present()
    
    def create_actions(self):
        """Create application-wide actions"""
        
        # Quit action
        quit_action = Gio.SimpleAction.new("quit", None)
        quit_action.connect("activate", self.on_quit_action)
        self.add_action(quit_action)
        self.set_accels_for_action("app.quit", ["<primary>q"])
        
        # About action
        about_action = Gio.SimpleAction.new("about", None)
        about_action.connect("activate", self.on_about_action)
        self.add_action(about_action)
    
    def on_quit_action(self, action, param):
        """Handle quit action"""
        self.quit()
    
    def on_about_action(self, action, param):
        """Show about dialog"""
        about = Adw.AboutDialog.new()
        about.set_application_name(_("BigLinux GRUB Restore"))
        about.set_application_icon("system-software-install")
        about.set_developer_name("Biglinux")
        about.set_version("2.0.0")
        about.set_website("https://www.biglinux.com.br")
        about.set_issue_url("https://github.com/biglinux/biglinux-grub-restore")
        about.set_copyright("© 2025 BigLinux")
        about.set_license_type(Gtk.License.GPL_2_0)
        about.set_comments(_("Restore GRUB bootloader and repair boot issues"))
        
        # Add developers
        about.set_developers([
            "Bruno Gonçalves",
            "Tales A. Mendonça"
        ])
        
        # Present with parent window
        about.present(self.window)
    
    def do_startup(self):
        """Initialize the application"""
        Adw.Application.do_startup(self)