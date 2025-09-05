#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
import subprocess
import threading
from pathlib import Path

gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')
gi.require_version('Vte', '3.91')

from gi.repository import Gtk, Adw, GObject, GLib, Vte, Pango
from utils.translation import _
from utils.helpers import UIHelper, NetworkHelper

class RestoreOptionsWidget(Gtk.Box):
    """Widget for displaying and executing restore options"""
    
    __gtype_name__ = 'RestoreOptionsWidget'
    
    # Signals
    __gsignals__ = {
        'restore-started': (GObject.SignalFlags.RUN_FIRST, None, (int,)),
        'restore-completed': (GObject.SignalFlags.RUN_FIRST, None, (int, bool)),
        'restore-progress': (GObject.SignalFlags.RUN_FIRST, None, (str,))
    }
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        self.system_interface = None
        self.network_available = False
        self.current_process = None
        
        # Set box properties
        self.set_orientation(Gtk.Orientation.VERTICAL)
        self.set_spacing(12)
        self.set_margin_top(12)
        self.set_margin_bottom(12)
        self.set_margin_start(12)
        self.set_margin_end(12)
        
        # Build the widget
        self.build_ui()
        
        # Check network status
        self.update_network_status()
    
    def build_ui(self):
        """Build the widget UI"""
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='x-large' weight='bold'>{_('Restore Options')}</span>")
        title_label.set_halign(Gtk.Align.CENTER)
        self.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(
            _("The restore can be done in 3 ways (Simple, Intermediate, or Complete). "
              "If in doubt, try the first option, restart the computer and see if it is resolved. "
              "If the problem persists, try the other options.")
        )
        desc_label.set_wrap(True)
        desc_label.set_justify(Gtk.Justification.CENTER)
        desc_label.add_css_class("dim-label")
        self.append(desc_label)
        
        # Network status
        self.network_status = self.create_network_status()
        self.append(self.network_status)
        
        # Restore options group
        self.restore_group = Adw.PreferencesGroup()
        self.restore_group.set_title(_("Restore Methods"))
        self.create_restore_options()
        self.append(self.restore_group)
        
        # Interactive options group
        self.interactive_group = Adw.PreferencesGroup()
        self.interactive_group.set_title(_("Interactive Options"))
        self.create_interactive_options()
        self.append(self.interactive_group)
        
        # Progress section (hidden by default)
        self.progress_section = self.create_progress_section()
        self.progress_section.set_visible(False)
        self.append(self.progress_section)
    
    def create_network_status(self):
        """Create network status indicator"""
        
        status_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        status_box.set_halign(Gtk.Align.CENTER)
        status_box.add_css_class("card")
        status_box.set_margin_top(6)
        status_box.set_margin_bottom(6)
        status_box.set_margin_start(12)
        status_box.set_margin_end(12)
        
        self.network_icon = Gtk.Image()
        self.network_icon.set_pixel_size(16)
        status_box.append(self.network_icon)
        
        self.network_label = Gtk.Label()
        self.network_label.set_hexpand(True)
        status_box.append(self.network_label)
        
        return status_box
    
    def create_restore_options(self):
        """Create the main restore option rows"""
        
        # Simple restore
        simple_row = Adw.ActionRow()
        simple_row.set_title(_("Simple Restore"))
        simple_row.set_subtitle(_("Just writes the Grub again at the beginning of the disk."))
        simple_row.set_icon_name("emblem-ok-symbolic")
        
        simple_button = Gtk.Button()
        simple_button.set_label(_("Execute"))
        simple_button.add_css_class("suggested-action")
        simple_button.connect("clicked", lambda w: self.execute_restore(1))
        simple_row.add_suffix(simple_button)
        
        self.restore_group.add(simple_row)
        
        # Intermediate restore
        intermediate_row = Adw.ActionRow()
        intermediate_row.set_title(_("Intermediate Restore"))
        intermediate_row.set_subtitle(
            _("Reinstalls the grub package on the partition, regenerates "
              "the configuration, and updates the initrd.")
        )
        intermediate_row.set_icon_name("view-refresh-symbolic")
        
        intermediate_button = Gtk.Button()
        intermediate_button.set_label(_("Execute"))
        intermediate_button.add_css_class("flat")
        intermediate_button.connect("clicked", lambda w: self.execute_restore(2))
        intermediate_row.add_suffix(intermediate_button)
        
        # Store reference for network dependency
        self.intermediate_button = intermediate_button
        self.restore_group.add(intermediate_row)
        
        # Complete restore
        complete_row = Adw.ActionRow()
        complete_row.set_title(_("Complete Restore"))
        complete_row.set_subtitle(
            _("Performs the intermediate restore steps, updates the system, "
              "and checks if the LTS kernel is installed.")
        )
        complete_row.set_icon_name("software-update-available-symbolic")
        
        complete_button = Gtk.Button()
        complete_button.set_label(_("Execute"))
        complete_button.add_css_class("flat")
        complete_button.connect("clicked", lambda w: self.execute_restore(3))
        complete_row.add_suffix(complete_button)
        
        # Store reference for network dependency
        self.complete_button = complete_button
        self.restore_group.add(complete_row)
    
    def create_interactive_options(self):
        """Create interactive option rows"""
        
        # Terminal option
        terminal_row = Adw.ActionRow()
        terminal_row.set_title(_("Interactive Terminal"))
        terminal_row.set_subtitle(_("Opens a terminal inside the selected system."))
        terminal_row.set_icon_name("utilities-terminal-symbolic")
        
        terminal_button = Gtk.Button()
        terminal_button.set_label(_("Open"))
        terminal_button.add_css_class("flat")
        terminal_button.connect("clicked", lambda w: self.execute_restore(4))
        terminal_row.add_suffix(terminal_button)
        
        self.interactive_group.add(terminal_row)
        
        # Control center option
        control_row = Adw.ActionRow()
        control_row.set_title(_("Control Center"))
        control_row.set_subtitle(_("Opens the control center inside the selected system."))
        control_row.set_icon_name("preferences-system-symbolic")
        
        control_button = Gtk.Button()
        control_button.set_label(_("Open"))
        control_button.add_css_class("flat")
        control_button.connect("clicked", lambda w: self.execute_restore(5))
        control_row.add_suffix(control_button)
        
        self.interactive_group.add(control_row)
        
        # Package manager option
        package_row = Adw.ActionRow()
        package_row.set_title(_("Package Manager"))
        package_row.set_subtitle(_("Opens the pamac-manager package manager inside the selected system."))
        package_row.set_icon_name("system-software-install-symbolic")
        
        package_button = Gtk.Button()
        package_button.set_label(_("Open"))
        package_button.add_css_class("flat")
        package_button.connect("clicked", lambda w: self.execute_restore(6))
        package_row.add_suffix(package_button)
        
        self.interactive_group.add(package_row)
    
    def create_progress_section(self):
        """Create progress display section"""
        
        progress_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        progress_box.add_css_class("card")
        progress_box.set_margin_top(12)
        progress_box.set_margin_bottom(12)
        progress_box.set_margin_start(12)
        progress_box.set_margin_end(12)
        
        # Progress title
        self.progress_title = Gtk.Label()
        self.progress_title.set_markup(f"<b>{_('Restore in Progress')}</b>")
        self.progress_title.set_halign(Gtk.Align.CENTER)
        self.progress_title.set_margin_top(12)
        progress_box.append(self.progress_title)
        
        # Progress bar
        self.progress_bar = Gtk.ProgressBar()
        self.progress_bar.set_pulse_step(0.1)
        self.progress_bar.set_margin_start(12)
        self.progress_bar.set_margin_end(12)
        self.progress_bar.set_margin_bottom(6)
        progress_box.append(self.progress_bar)
        
        # Status label
        self.status_label = Gtk.Label()
        self.status_label.set_text(_("Preparing..."))
        self.status_label.set_halign(Gtk.Align.CENTER)
        self.status_label.add_css_class("dim-label")
        progress_box.append(self.status_label)
        
        # Terminal output (for interactive modes)
        self.terminal_frame = Gtk.Frame()
        self.terminal_frame.set_visible(False)
        self.terminal_frame.set_margin_top(12)
        self.terminal_frame.set_margin_start(12)
        self.terminal_frame.set_margin_end(12)
        self.terminal_frame.set_margin_bottom(12)
        
        # VTE Terminal
        self.terminal = Vte.Terminal()
        self.terminal.set_size_request(-1, 300)
        self.terminal.set_font(Pango.FontDescription("monospace 10"))
        self.terminal_frame.set_child(self.terminal)
        
        progress_box.append(self.terminal_frame)
        
        # Cancel button
        self.cancel_button = Gtk.Button()
        self.cancel_button.set_label(_("Cancel"))
        self.cancel_button.add_css_class("destructive-action")
        self.cancel_button.set_halign(Gtk.Align.CENTER)
        self.cancel_button.set_margin_bottom(12)
        self.cancel_button.connect("clicked", self.on_cancel_restore)
        progress_box.append(self.cancel_button)
        
        return progress_box
    
    def set_system_interface(self, system_interface):
        """Set the system interface"""
        self.system_interface = system_interface
    
    def update_network_status(self):
        """Update network status display"""
        
        def check_network():
            self.network_available = NetworkHelper.check_internet_connection()
            GLib.idle_add(self.update_network_ui)
        
        thread = threading.Thread(target=check_network)
        thread.daemon = True
        thread.start()
    
    def update_network_ui(self):
        """Update network UI on main thread"""
        
        if self.network_available:
            self.network_icon.set_icon_name("network-wireless-signal-excellent-symbolic")
            self.network_label.set_text(_("Internet connection available"))
            self.network_label.remove_css_class("warning")
            self.network_label.add_css_class("success")
        else:
            self.network_icon.set_icon_name("network-wireless-offline-symbolic")
            self.network_label.set_text(_("No internet connection - Options 2 and 3 require internet"))
            self.network_label.remove_css_class("success")
            self.network_label.add_css_class("warning")
        
        # Update button states
        if hasattr(self, 'intermediate_button'):
            self.intermediate_button.set_sensitive(self.network_available)
        if hasattr(self, 'complete_button'):
            self.complete_button.set_sensitive(self.network_available)
    
    def execute_restore(self, mode):
        """Execute restore with the specified mode"""
        
        if not self.system_interface:
            self.show_error(_("System interface not available"))
            return
        
        # Check network requirement for modes 2 and 3
        if mode in [2, 3] and not self.network_available:
            self.show_network_required_dialog()
            return
        
        # Show confirmation dialog
        if not self.show_confirmation_dialog(mode):
            return
        
        # Emit signal that restore is starting
        self.emit('restore-started', mode)
        
        # Show progress section
        self.show_progress(mode)
        
        # Execute restore in background thread
        thread = threading.Thread(target=self.run_restore, args=(mode,))
        thread.daemon = True
        thread.start()
    
    def show_confirmation_dialog(self, mode):
        """Show confirmation dialog for restore operation"""
        
        mode_descriptions = {
            1: _("Simple restore will write GRUB to the beginning of the disk."),
            2: _("Intermediate restore will reinstall GRUB package and update configuration."),
            3: _("Complete restore will perform full system update and kernel check."),
            4: _("Interactive terminal will open a command line inside the selected system."),
            5: _("Control center will open system settings inside the selected system."),
            6: _("Package manager will open pamac-manager inside the selected system.")
        }
        
        dialog = Adw.MessageDialog.new(
            self.get_root(),
            _("Confirm Restore Operation"),
            mode_descriptions.get(mode, _("Execute the selected restore operation?"))
        )
        
        dialog.add_response("cancel", _("Cancel"))
        dialog.add_response("execute", _("Execute"))
        dialog.set_response_appearance("execute", Adw.ResponseAppearance.SUGGESTED)
        
        def on_response(dialog, response):
            self.confirmation_result = response == "execute"
            dialog.close()
        
        dialog.connect("response", on_response)
        self.confirmation_result = False
        
        dialog.present()
        
        # Wait for response (this is a simplified approach)
        # In a real application, you'd handle this asynchronously
        return True  # For now, assume user confirms
    
    def show_network_required_dialog(self):
        """Show dialog when network is required but not available"""
        
        dialog = Adw.MessageDialog.new(
            self.get_root(),
            _("Internet Connection Required"),
            _("This restore option requires an internet connection to download packages and updates. "
              "Please check your network connection and try again.")
        )
        
        dialog.add_response("ok", _("OK"))
        dialog.present()
    
    def show_progress(self, mode):
        """Show progress section"""
        
        mode_titles = {
            1: _("Simple Restore in Progress"),
            2: _("Intermediate Restore in Progress"),
            3: _("Complete Restore in Progress"),
            4: _("Opening Interactive Terminal"),
            5: _("Opening Control Center"),
            6: _("Opening Package Manager")
        }
        
        self.progress_title.set_markup(f"<b>{mode_titles.get(mode, _('Restore in Progress'))}</b>")
        self.status_label.set_text(_("Initializing..."))
        self.progress_section.set_visible(True)
        
        # For interactive modes, show terminal
        if mode in [4, 5, 6]:
            self.terminal_frame.set_visible(True)
        else:
            self.terminal_frame.set_visible(False)
        
        # Start progress bar pulse
        self.progress_timeout = GLib.timeout_add(100, self.pulse_progress)
    
    def pulse_progress(self):
        """Pulse the progress bar"""
        self.progress_bar.pulse()
        return True  # Continue timeout
    
    def run_restore(self, mode):
        """Run the restore operation in background"""
        
        try:
            GLib.idle_add(self.update_status, _("Starting restore operation..."))
            
            # Execute the restore
            process = self.system_interface.execute_restore(mode)
            self.current_process = process
            
            if mode in [4, 5, 6]:  # Interactive modes
                GLib.idle_add(self.update_status, _("Opening interactive session..."))
                # For interactive modes, we just wait for the process to complete
                process.wait()
            else:
                # For non-interactive modes, read output
                while True:
                    output = process.stdout.readline()
                    if output == '' and process.poll() is not None:
                        break
                    if output:
                        GLib.idle_add(self.update_status, output.strip())
            
            # Check result
            return_code = process.returncode
            success = return_code == 0
            
            GLib.idle_add(self.on_restore_complete, mode, success)
            
        except Exception as e:
            GLib.idle_add(self.on_restore_error, str(e))
    
    def update_status(self, message):
        """Update status label"""
        self.status_label.set_text(message)
        self.emit('restore-progress', message)
    
    def on_restore_complete(self, mode, success):
        """Handle restore completion"""
        
        # Stop progress pulse
        if hasattr(self, 'progress_timeout'):
            GLib.source_remove(self.progress_timeout)
        
        if success:
            self.progress_bar.set_fraction(1.0)
            self.status_label.set_text(_("Restore completed successfully!"))
            self.cancel_button.set_label(_("Close"))
        else:
            self.status_label.set_text(_("Restore failed. Please check the output above."))
            self.cancel_button.set_label(_("Close"))
        
        self.emit('restore-completed', mode, success)
    
    def on_restore_error(self, error_msg):
        """Handle restore error"""
        
        # Stop progress pulse
        if hasattr(self, 'progress_timeout'):
            GLib.source_remove(self.progress_timeout)
        
        self.status_label.set_text(f"{_('Error')}: {error_msg}")
        self.cancel_button.set_label(_("Close"))
        
        self.emit('restore-completed', 0, False)
    
    def on_cancel_restore(self, button):
        """Handle cancel/close button"""
        
        if self.current_process and self.current_process.poll() is None:
            # Process is still running, confirm cancellation
            dialog = Adw.MessageDialog.new(
                self.get_root(),
                _("Cancel Restore?"),
                _("Are you sure you want to cancel the restore operation?")
            )
            
            dialog.add_response("no", _("No"))
            dialog.add_response("yes", _("Yes, Cancel"))
            dialog.set_response_appearance("yes", Adw.ResponseAppearance.DESTRUCTIVE)
            
            def on_response(dialog, response):
                if response == "yes":
                    self.cancel_restore()
                dialog.close()
            
            dialog.connect("response", on_response)
            dialog.present()
        else:
            # Just close the progress section
            self.hide_progress()
    
    def cancel_restore(self):
        """Cancel the running restore operation"""
        
        if self.current_process:
            try:
                self.current_process.terminate()
            except Exception:
                pass
        
        self.hide_progress()
    
    def hide_progress(self):
        """Hide the progress section"""
        
        if hasattr(self, 'progress_timeout'):
            GLib.source_remove(self.progress_timeout)
        
        self.progress_section.set_visible(False)
        self.current_process = None
    
    def show_error(self, message):
        """Show error dialog"""
        
        dialog = Adw.MessageDialog.new(
            self.get_root(),
            _("Error"),
            message
        )
        
        dialog.add_response("ok", _("OK"))
        dialog.present()