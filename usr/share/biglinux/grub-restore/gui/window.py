#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import gi
import subprocess
import threading
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')
# Add VTE import for terminal with better error handling
VTE_AVAILABLE = False
VTE_VERSION = None

try:
    # Try VTE 3.91 first (GTK4)
    gi.require_version('Vte', '3.91')
    from gi.repository import Vte, Pango
    VTE_AVAILABLE = True
    VTE_VERSION = '3.91'
    print("DEBUG: VTE 3.91 loaded successfully")
except (ImportError, ValueError):
    try:
        # Fallback to VTE 2.91 (GTK3 compatibility)
        gi.require_version('Vte', '2.91')
        from gi.repository import Vte, Pango
        VTE_AVAILABLE = True
        VTE_VERSION = '2.91'
        print("DEBUG: VTE 2.91 loaded as fallback")
    except (ImportError, ValueError):
        print("DEBUG: VTE not available - terminal features disabled")
        VTE_AVAILABLE = False

from gi.repository import Gtk, Adw, GLib, Gio
from utils.translation import _

class GrubRestoreWindow(Adw.ApplicationWindow):
    """Main window for BigLinux GRUB Restore application"""
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        # Window properties
        self.set_title(_("BigLinux GRUB Restore"))
        self.set_default_size(800, 600)
        self.set_resizable(True)
        
        # Setup UI
        self.setup_ui()
    
    def setup_ui(self):
        """Setup the main UI structure"""
        
        # Create main box
        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        
        # Create header bar (NÃO usar set_titlebar para AdwApplicationWindow)
        self.header_bar = Adw.HeaderBar()
        main_box.append(self.header_bar)
        
        # Create menu button
        self.setup_menu()
        
        # Create main content area
        self.content_area = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.content_area.set_vexpand(True)
        self.content_area.set_hexpand(True)
        main_box.append(self.content_area)
        
        # Set main content
        self.set_content(main_box)
        
        # Show welcome page
        self.show_welcome_page()
    
    def setup_menu(self):
        """Setup application menu"""
        menu_model = Gio.Menu()
        menu_model.append(_("About"), "app.about")
        menu_model.append(_("Quit"), "app.quit")
        
        menu_button = Gtk.MenuButton()
        menu_button.set_icon_name("open-menu-symbolic")
        menu_button.set_menu_model(menu_model)
        
        self.header_bar.pack_end(menu_button)
    
    def show_welcome_page(self):
        """Show the welcome page"""
        
        # Clear existing content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Create welcome status page
        welcome_page = Adw.StatusPage()
        welcome_page.set_icon_name("grub-icon")
        welcome_page.set_title(_("GRUB Restore Tool"))
        welcome_page.set_description(
            _("This tool should be used in") + " " + _("Mode") + " Live " + _("to restore the BOOT "
            "of the BigLinux installed on the HD or SSD.\n\n"
            "If the installed system is booting correctly, there are no "
            "boot problems, so it's better not to proceed with this tool.")
        )
        
        # Start button with smaller size
        start_button = Gtk.Button()
        start_button.set_label(_("Start"))
        start_button.add_css_class("pill")
        start_button.add_css_class("suggested-action")
        start_button.set_size_request(200, -1)  # Fixed width, auto height
        start_button.set_halign(Gtk.Align.CENTER)  # Center alignment
        start_button.connect("clicked", self.on_start_detection)

        welcome_page.set_child(start_button)
        
        self.content_area.append(welcome_page)

    def on_start_detection(self, button):
        """Handle start detection button click"""
        
        print("DEBUG: Start detection clicked!")
        
        # Clear existing content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Show detection page
        detection_page = Adw.StatusPage()
        detection_page.set_icon_name("view-refresh-symbolic")
        detection_page.set_title(_("Detecting Systems"))
        detection_page.set_description(_("Please wait while we scan your system..."))
        
        # Progress indicator
        spinner = Gtk.Spinner()
        spinner.set_size_request(48, 48)
        spinner.start()
        detection_page.set_child(spinner)
        
        self.content_area.append(detection_page)
        
        print("DEBUG: Detection page shown, starting real detection...")
        
        # Initialize system interface and run real detection
        from backend.system_interface import SystemInterface
        import threading
        
        self.system_interface = SystemInterface()
        
        # Run detection in background thread
        thread = threading.Thread(target=self.run_real_detection)
        thread.daemon = True
        thread.start()

    def run_real_detection(self):
        """Run the actual system detection using shell scripts"""
        try:
            print("DEBUG: Running real system detection...")
            
            # Update UI with progress
            GLib.idle_add(self.update_detection_progress, _("Initializing detection..."))
            
            # Start detection
            GLib.idle_add(self.update_detection_progress, _("Scanning for Linux systems..."))
            self.system_interface.detect_systems()
            
            GLib.idle_add(self.update_detection_progress, _("Analyzing boot configuration..."))
            
            print("DEBUG: Detection completed successfully")
            GLib.idle_add(self.show_detection_results)
        except Exception as e:
            print(f"DEBUG: Detection failed: {e}")
            import traceback
            traceback.print_exc()
            GLib.idle_add(self.show_detection_error, str(e))

    def update_detection_progress(self, message):
        """Update detection progress message"""
        # Find detection page and update description
        child = self.content_area.get_first_child()
        if child and isinstance(child, Adw.StatusPage):
            child.set_description(message)
        return False  # Remove from idle queue

    def show_detection_results(self):
        """Show real detection results"""
        systems = self.system_interface.detected_systems
        efi_partitions = self.system_interface.efi_partitions
        boot_mode = self.system_interface.boot_mode
        
        print(f"DEBUG: Found {len(systems)} systems, {len(efi_partitions)} EFI partitions, boot mode: {boot_mode}")
        
        # Clear existing content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Show results
        if not systems:
            self.show_no_systems_found()
            return
            
        # Show selection page
        self.show_system_selection()

    def show_detection_error(self, error_msg):
        """Show detection error"""
        # Clear existing content  
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        error_page = Adw.StatusPage()
        error_page.set_icon_name("dialog-error-symbolic")
        error_page.set_title(_("Detection Failed"))
        error_page.set_description(f"Error: {error_msg}")
        
        retry_button = Gtk.Button()
        retry_button.set_label(_("Try Again"))
        retry_button.add_css_class("pill")
        retry_button.add_css_class("suggested-action")
        retry_button.set_size_request(200, -1)  # Fixed width
        retry_button.set_halign(Gtk.Align.CENTER)  # Center alignment
        retry_button.connect("clicked", lambda x: self.show_welcome_page())

        error_page.set_child(retry_button)
        self.content_area.append(error_page)

    def show_no_systems_found(self):
        """Show when no systems are found"""
        no_systems_page = Adw.StatusPage()
        no_systems_page.set_icon_name("dialog-warning-symbolic")
        no_systems_page.set_title(_("No Systems Found"))
        no_systems_page.set_description(_("No Linux installations found on this computer."))
        
        back_button = Gtk.Button()
        back_button.set_label(_("Back"))
        back_button.add_css_class("pill")
        back_button.connect("clicked", lambda x: self.show_welcome_page())
        
        no_systems_page.set_child(back_button)
        self.content_area.append(no_systems_page)

    def show_system_selection(self):
        """Show system selection page with real system list"""
        print("DEBUG: Showing system selection page")
        
        # Create main selection box
        selection_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        selection_box.set_margin_top(24)
        selection_box.set_margin_bottom(24)
        selection_box.set_margin_start(24)
        selection_box.set_margin_end(24)
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='x-large' weight='bold'>{_('Select System to Restore')}</span>")
        title_label.set_halign(Gtk.Align.CENTER)
        selection_box.append(title_label)
        
        # Systems group
        systems_group = Adw.PreferencesGroup()
        systems_group.set_title(_("Detected Linux Systems"))
        systems_group.set_description(f"{_('Found')} {len(self.system_interface.detected_systems)} {_('system(s)')}")
        
        # Add system rows
        self.selected_system = None
        self.system_radio_group = None
        for i, system in enumerate(self.system_interface.detected_systems):
            system_row = self.create_system_row(system, i == 0)
            systems_group.add(system_row)
        
        selection_box.append(systems_group)
        
        # Boot info group
        boot_info_group = Adw.PreferencesGroup()
        boot_info_group.set_title(_("Boot Configuration"))
        
        # Boot mode info
        boot_mode_row = Adw.ActionRow()
        boot_mode_row.set_title(_("Current Boot Mode"))
        boot_mode_row.set_subtitle(self.system_interface.boot_mode or "Unknown")
        boot_mode_row.set_icon_name("emblem-system-symbolic")
        boot_info_group.add(boot_mode_row)
        
        # EFI partitions info
        efi_info_row = Adw.ActionRow()
        efi_info_row.set_title(_("EFI Partitions Found"))
        efi_info_row.set_subtitle(f"{len(self.system_interface.efi_partitions)} {_('partition(s)')}")
        efi_info_row.set_icon_name("drive-harddisk-symbolic")
        boot_info_group.add(efi_info_row)
        
        selection_box.append(boot_info_group)
        
        # Continue button
        continue_button = Gtk.Button()
        continue_button.set_label(_("Continue"))
        continue_button.add_css_class("pill")
        continue_button.add_css_class("suggested-action")
        continue_button.set_size_request(300, -1)
        continue_button.set_halign(Gtk.Align.CENTER)
        continue_button.connect("clicked", self.on_continue_to_restore)
        selection_box.append(continue_button)
        
        self.content_area.append(selection_box)
        
    def show_disk_selection(self):
        """Show disk selection page for LEGACY mode"""
        print("DEBUG: Showing disk selection page")
        
        # Clear content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Create main selection box
        selection_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        selection_box.set_margin_top(24)
        selection_box.set_margin_bottom(24)
        selection_box.set_margin_start(24)
        selection_box.set_margin_end(24)
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='x-large' weight='bold'>{_('Select Target Disk')}</span>")
        title_label.set_halign(Gtk.Align.CENTER)
        selection_box.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(_("Select the disk where GRUB will be installed. The bootloader will be written to the beginning (MBR) of the selected disk."))
        desc_label.set_wrap(True)
        desc_label.set_justify(Gtk.Justification.CENTER)
        desc_label.add_css_class("dim-label")
        selection_box.append(desc_label)
        
        # Disks group
        disks_group = Adw.PreferencesGroup()
        disks_group.set_title(_("Available Disks"))
        disks_group.set_description(f"{_('Found')} {len(self.system_interface.grub_disks)} {_('disk(s)')}")
        
        # Add disk rows
        self.selected_disk = None
        for i, disk in enumerate(self.system_interface.grub_disks):
            disk_row = self.create_disk_row(disk, i == 0)
            disks_group.add(disk_row)
        
        selection_box.append(disks_group)
        
        # Continue button
        continue_button = Gtk.Button()
        continue_button.set_label(_("Continue"))
        continue_button.add_css_class("pill")
        continue_button.add_css_class("suggested-action")
        continue_button.set_size_request(300, -1)
        continue_button.set_halign(Gtk.Align.CENTER)
        continue_button.connect("clicked", self.on_disk_continue_to_restore)
        selection_box.append(continue_button)
        
        self.content_area.append(selection_box)

    def create_disk_row(self, disk, is_default=False):
        """Create a row for disk selection"""
        disk_row = Adw.ActionRow()
        
        # Title: device + size
        title = f"/dev/{disk.get('device', 'unknown')} ({disk.get('size', 'Unknown')})"
        disk_row.set_title(title)
        
        # Subtitle: model + partition table
        subtitle_parts = []
        if disk.get('name') and disk['name'] != 'Unknown_Disk':
            model_name = disk['name'].replace('_', ' ')
            subtitle_parts.append(model_name)
        
        if disk.get('table'):
            subtitle_parts.append(f"{_('Partition table')}: {disk['table']}")
        
        if subtitle_parts:
            disk_row.set_subtitle(" | ".join(subtitle_parts))
        else:
            disk_row.set_subtitle(_("Unknown model"))
        
        disk_row.set_icon_name("drive-harddisk-symbolic")
        
        # Radio button
        radio_button = Gtk.CheckButton()
        radio_button.set_active(is_default)

        # If only one disk, make it disabled and checked
        if len(self.system_interface.grub_disks) == 1:
            radio_button.set_active(True)
            radio_button.set_sensitive(False)  # Gray out and disable
        else:
            radio_button.connect('toggled', self.on_disk_selected, disk)
        
        # Group radio buttons
        if not hasattr(self, 'disk_radio_group'):
            self.disk_radio_group = radio_button
        else:
            radio_button.set_group(self.disk_radio_group)
        
        disk_row.add_prefix(radio_button)
        
        # Select first disk by default
        if is_default:
            self.selected_disk = disk
        
        return disk_row

    def on_disk_selected(self, radio_button, disk):
        """Handle disk selection"""
        if radio_button.get_active():
            self.selected_disk = disk
            print(f"DEBUG: Selected disk: /dev/{disk.get('device', 'unknown')}")

    def on_disk_continue_to_restore(self, button):
        """Handle continue from disk selection"""
        if not self.selected_disk:
            print("DEBUG: No disk selected")
            return
            
        print(f"DEBUG: Continuing with disk: /dev/{self.selected_disk.get('device', 'unknown')}")
        
        # Save selection with both system and disk
        self.system_interface.save_selection(
            self.selected_system, 
            selected_disk=self.selected_disk['device']
        )
        self.show_restore_options()

    def create_system_row(self, system, is_default=False):
        """Create a row for system selection"""
        system_row = Adw.ActionRow()
        
        # Title: partition + name
        title = f"{system.get('partition', 'Unknown')} - {system.get('name', 'Unknown System')}"
        system_row.set_title(title)
        
        # Subtitle: filesystem and description
        subtitle_parts = []
        if system.get('filesystem'):
            subtitle_parts.append(f"{_('Filesystem')}: {system['filesystem']}")
        if system.get('description'):
            subtitle_parts.append(system['description'])
        
        if subtitle_parts:
            system_row.set_subtitle(" | ".join(subtitle_parts))
        
        system_row.set_icon_name("computer-symbolic")
        
        # Radio button
        radio_button = Gtk.CheckButton()
        radio_button.set_active(is_default)

        # If only one system, make it disabled and checked
        if len(self.system_interface.detected_systems) == 1:
            radio_button.set_active(True)
            radio_button.set_sensitive(False)  # Gray out and disable
        else:
            radio_button.connect('toggled', self.on_system_selected, system)

        # Properly group radio buttons in GTK4
        if self.system_radio_group is None:
            self.system_radio_group = radio_button
        else:
            radio_button.set_group(self.system_radio_group)
        
        system_row.add_prefix(radio_button)
        
        # Select first system by default
        if is_default:
            self.selected_system = system
        
        return system_row

    def on_system_selected(self, radio_button, system):
        """Handle system selection"""
        if radio_button.get_active():
            self.selected_system = system
            print(f"DEBUG: Selected system: {system.get('partition', 'Unknown')}")

    def on_continue_to_restore(self, button):
        """Handle continue to restore options"""
        if not self.selected_system:
            print("DEBUG: No system selected")
            return
            
        print(f"DEBUG: Continuing with system: {self.selected_system.get('partition', 'Unknown')}")
        
        # For LEGACY mode, show disk selection first
        if self.system_interface.boot_mode == "LEGACY":
            self.show_disk_selection()
        else:
            # For EFI mode, go directly to restore options
            self.system_interface.save_selection(self.selected_system)
            self.show_restore_options()
        
    def show_restore_options(self):
        """Show restore options page with all 6 options"""
        print("DEBUG: Showing restore options")
        
        # Clear content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Create main options box
        options_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        options_box.set_margin_top(24)
        options_box.set_margin_bottom(24)
        options_box.set_margin_start(24)
        options_box.set_margin_end(24)
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='x-large' weight='bold'>{_('Restore Options')}</span>")
        title_label.set_halign(Gtk.Align.CENTER)
        options_box.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(_("The restore can be done in 3 ways (Simple, Intermediate, or Complete). "
                            "If in doubt, try the first option, restart the computer and see if it is resolved."))
        desc_label.set_wrap(True)
        desc_label.set_justify(Gtk.Justification.CENTER)
        desc_label.add_css_class("dim-label")
        options_box.append(desc_label)
        
        # Check network status asynchronously
        self.check_network_connection_async(self.on_network_check_complete)
        
        # Network status indicator
        network_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        network_box.set_halign(Gtk.Align.CENTER)
        network_box.add_css_class("card")
        network_box.set_margin_top(6)
        network_box.set_margin_bottom(12)
        network_box.set_margin_start(5)
        network_box.set_margin_end(5)

        network_icon = Gtk.Image()
        network_label = Gtk.Label()
        
        if self.network_available:
            network_icon.set_from_icon_name("network-wireless-signal-excellent-symbolic")
            network_label.set_text(_("Internet connection available"))
            network_label.add_css_class("success")
        else:
            network_icon.set_from_icon_name("network-wireless-offline-symbolic") 
            network_label.set_text(_("No internet - Options 2 and 3 require internet"))
            network_label.add_css_class("warning")
        
        network_box.append(network_icon)
        network_box.append(network_label)
        options_box.append(network_box)
        
        # Main restore options group
        restore_group = Adw.PreferencesGroup()
        restore_group.set_title(_("Restore Methods"))
        
        # Option 1: Simple
        simple_row = Adw.ActionRow()
        simple_row.set_title(_("Simple Restore"))
        simple_row.set_subtitle(_("Just writes the Grub again at the beginning of the disk."))
        simple_row.set_icon_name("emblem-ok-symbolic")
        
        simple_button = Gtk.Button()
        simple_button.set_label(_("Execute"))
        simple_button.add_css_class("suggested-action")
        simple_button.set_size_request(100, -1)
        simple_button.connect("clicked", lambda w: self.execute_restore(1))
        simple_row.add_suffix(simple_button)
        restore_group.add(simple_row)
        
        # Option 2: Intermediate  
        intermediate_row = Adw.ActionRow()
        intermediate_row.set_title(_("Intermediate Restore"))
        intermediate_row.set_subtitle(_("Reinstalls the grub package, regenerates configuration, and updates initrd."))
        intermediate_row.set_icon_name("view-refresh-symbolic")
        
        intermediate_button = Gtk.Button()
        intermediate_button.set_label(_("Execute"))
        intermediate_button.add_css_class("flat")
        intermediate_button.set_size_request(100, -1)
        intermediate_button.set_sensitive(self.network_available)
        intermediate_button.connect("clicked", lambda w: self.execute_restore(2))
        intermediate_row.add_suffix(intermediate_button)
        restore_group.add(intermediate_row)
        
        # Option 3: Complete
        complete_row = Adw.ActionRow()
        complete_row.set_title(_("Complete Restore"))
        complete_row.set_subtitle(_("Performs intermediate steps, updates system, and checks LTS kernel."))
        complete_row.set_icon_name("software-update-available-symbolic")
        
        complete_button = Gtk.Button()
        complete_button.set_label(_("Execute"))
        complete_button.add_css_class("flat")
        complete_button.set_size_request(100, -1)
        complete_button.set_sensitive(self.network_available)
        complete_button.connect("clicked", lambda w: self.execute_restore(3))
        complete_row.add_suffix(complete_button)
        restore_group.add(complete_row)
        
        options_box.append(restore_group)
        
        # Interactive options group
        interactive_group = Adw.PreferencesGroup()
        interactive_group.set_title(_("Interactive Options"))
        
        # Option 4: Terminal
        terminal_row = Adw.ActionRow()
        terminal_row.set_title(_("Interactive Terminal"))
        terminal_row.set_subtitle(_("Opens a terminal inside the selected system."))
        terminal_row.set_icon_name("utilities-terminal-symbolic")
        
        terminal_button = Gtk.Button()
        terminal_button.set_label(_("Open"))
        terminal_button.add_css_class("flat")
        terminal_button.set_size_request(100, -1)
        terminal_button.connect("clicked", lambda w: self.execute_restore(4))
        terminal_row.add_suffix(terminal_button)
        interactive_group.add(terminal_row)
        
        # Option 5: Control Center (only if bigcontrolcenter exists)
        if os.path.exists("/usr/bin/bigcontrolcenter"):
            control_row = Adw.ActionRow()
            control_row.set_title(_("Control Center"))
            control_row.set_subtitle(_("Opens the control center inside the selected system."))
            control_row.set_icon_name("preferences-system-symbolic")

            control_button = Gtk.Button()
            control_button.set_label(_("Open"))
            control_button.add_css_class("flat")
            control_button.set_size_request(100, -1)
            control_button.connect("clicked", lambda w: self.execute_restore(5))
            control_row.add_suffix(control_button)

            interactive_group.add(control_row)
        
        # Option 6: Package Manager
        package_row = Adw.ActionRow()
        package_row.set_title(_("Package Manager"))
        package_row.set_subtitle(_("Opens pamac-manager inside the selected system."))
        package_row.set_icon_name("system-software-install-symbolic")

        package_button = Gtk.Button()
        package_button.set_label(_("Open"))
        package_button.add_css_class("flat")
        package_button.set_size_request(100, -1)
        package_button.connect("clicked", lambda w: self.execute_restore(6))
        package_row.add_suffix(package_button)

        interactive_group.add(package_row)
        
        options_box.append(interactive_group)
        
        self.content_area.append(options_box)

    def check_network_connection_async(self, callback):
        """Check network connection asynchronously"""
        def check_network():
            result = self.check_network_connection_sync()
            GLib.idle_add(callback, result)
        
        thread = threading.Thread(target=check_network, daemon=True)
        thread.start()

    def check_network_connection_sync(self):
        """Check if internet connection is available using multiple methods"""
        
        # Method 1: Try HTTP request (most reliable)
        try:
            print("DEBUG: Checking network via HTTP request...")
            import urllib.request
            
            # Try to open a simple HTTP connection
            with urllib.request.urlopen('http://detectportal.firefox.com/canonical.html', timeout=5) as response:
                if response.getcode() == 200:
                    print("DEBUG: HTTP test successful - Network connected")
                    return True
        except Exception as e:
            print(f"DEBUG: HTTP test failed: {e}")
        
        # Method 2: Try DNS resolution
        try:
            print("DEBUG: Checking network via DNS resolution...")
            import socket
            
            # Try to resolve a known domain
            socket.gethostbyname('google.com')
            print("DEBUG: DNS resolution successful - Network connected")
            return True
        except Exception as e:
            print(f"DEBUG: DNS resolution failed: {e}")
        
        # Method 3: Try wget/curl as fallback
        try:
            print("DEBUG: Checking network via wget...")
            import subprocess
            
            result = subprocess.run(['wget', '--quiet', '--spider', '--timeout=5', 'http://google.com'], 
                                capture_output=True, timeout=10)
            if result.returncode == 0:
                print("DEBUG: wget test successful - Network connected")
                return True
        except Exception as e:
            print(f"DEBUG: wget test failed: {e}")
        
        # Method 4: Try ping as last resort
        try:
            print("DEBUG: Checking network via ping (last resort)...")
            import subprocess
            
            result = subprocess.run(['ping', '-c', '1', '-W', '3', '8.8.8.8'], 
                                capture_output=True, timeout=5)
            if result.returncode == 0:
                print("DEBUG: ping test successful - Network connected")
                return True
        except Exception as e:
            print(f"DEBUG: ping test failed: {e}")
        
        print("DEBUG: All network tests failed - Network disconnected")
        return False

    def on_network_check_complete(self, network_available):
        """Handle network check completion"""
        self.network_available = network_available
        self.update_network_ui()

    def update_network_ui(self):
        """Update network UI elements"""
        if self.network_available:
            self.network_icon.set_icon_name("network-wireless-signal-excellent-symbolic")
            self.network_label.set_text(_("Internet connection available"))
            self.network_label.remove_css_class("warning")
            self.network_label.add_css_class("success")
        else:
            self.network_icon.set_icon_name("network-wireless-offline-symbolic")
            self.network_label.set_text(_("No internet - Options 2 and 3 require internet"))
            self.network_label.remove_css_class("success")
            self.network_label.add_css_class("warning")
        
        # Update button states
        if hasattr(self, 'intermediate_button'):
            self.intermediate_button.set_sensitive(self.network_available)
        if hasattr(self, 'complete_button'):
            self.complete_button.set_sensitive(self.network_available)

    def execute_restore(self, mode):
        """Execute restore operation"""
        print(f"DEBUG: Executing restore mode {mode}")
        
        # Show confirmation dialog
        if not self.show_restore_confirmation(mode):
            return

        # For mode 4 (interactive terminal), show special terminal interface
        if mode == 4:
            self.show_interactive_terminal()
            return

        # Clear content and show progress for all modes
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()

        self.show_restore_progress(mode)

        # Execute in background thread
        thread = threading.Thread(target=self.run_restore_operation, args=(mode,))
        thread.daemon = True
        thread.start()

    def show_restore_confirmation(self, mode):
        """Show confirmation dialog"""
        mode_descriptions = {
            1: _("Simple restore will write GRUB to the beginning of the disk."),
            2: _("Intermediate restore will reinstall GRUB package and update configuration."),
            3: _("Complete restore will perform full system update and kernel check."),
            4: _("Interactive terminal will open inside the selected system."),
            5: _("Control center will open inside the selected system."),
            6: _("Package manager will open inside the selected system.")
        }
        
        # For now, always return True (would normally show Adw.AlertDialog)
        print(f"DEBUG: Would show confirmation for mode {mode}: {mode_descriptions.get(mode, 'Unknown')}")
        return True

    def show_restore_progress(self, mode):
        """Show restore progress page"""
        # Create main progress box
        progress_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        progress_box.set_margin_top(24)
        progress_box.set_margin_bottom(24)
        progress_box.set_margin_start(24)
        progress_box.set_margin_end(24)
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='x-large' weight='bold'>{_('Restore in Progress')}</span>")
        title_label.set_halign(Gtk.Align.CENTER)
        progress_box.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(_("Please wait while the restore operation completes..."))
        desc_label.set_halign(Gtk.Align.CENTER)
        desc_label.add_css_class("dim-label")
        progress_box.append(desc_label)
        
        # Progress spinner
        self.progress_spinner = Gtk.Spinner()
        self.progress_spinner.set_size_request(48, 48)
        self.progress_spinner.set_halign(Gtk.Align.CENTER)
        self.progress_spinner.start()
        progress_box.append(self.progress_spinner)
        
        # Expandable terminal section
        terminal_expander = Adw.ExpanderRow()
        terminal_expander.set_title(_("Technical Details"))
        terminal_expander.set_subtitle(_("Real-time execution log"))
        terminal_expander.set_icon_name("utilities-terminal-symbolic")
        terminal_expander.set_expanded(True)
        
        # Terminal frame and VTE
        try:
            gi.require_version('Vte', '3.91')
            from gi.repository import Vte, Pango
            
            self.terminal = Vte.Terminal()
            self.terminal.set_size_request(-1, 200)
            self.terminal.set_font(Pango.FontDescription("monospace 9"))
            self.terminal.set_scroll_on_output(True)
            
            terminal_frame = Gtk.Frame()
            terminal_frame.set_child(self.terminal)
            terminal_frame.set_margin_top(6)
            terminal_frame.set_margin_bottom(6)
            terminal_frame.set_margin_start(6)
            terminal_frame.set_margin_end(6)
            
            terminal_expander.add_row(terminal_frame)
        except Exception as e:
            # Fallback if VTE is not available
            error_label = Gtk.Label()
            error_label.set_text(_("Terminal not available"))
            terminal_expander.add_row(error_label)
            self.terminal = None
        
        progress_box.append(terminal_expander)
        
        self.content_area.append(progress_box)

    def run_restore_operation(self, mode):
        """Run restore operation in background"""
        try:
            print(f"DEBUG: Running restore operation mode {mode}")
            
            # Execute the restore using system_interface
            process = self.system_interface.execute_restore(mode)
            
            # Interactive mode 4 is now handled separately in show_interactive_terminal()
            # Modes 5 and 6 are handled here
            if mode in [5, 6]:
                print("DEBUG: Setting up interactive application mode")
                # Don't monitor - let it run interactively
                return
            
            # Monitor output for other modes
            if hasattr(self, 'terminal') and self.terminal:
                import threading
                def monitor_process():
                    try:
                        for line in iter(process.stdout.readline, ''):
                            if line:
                                clean_line = line.strip() + '\r\n'
                                GLib.idle_add(self.terminal.feed, clean_line.encode('utf-8'))
                        
                        process.wait()
                        success = process.returncode == 0
                        GLib.idle_add(self.on_restore_complete, mode, success)
                        
                    except Exception as e:
                        GLib.idle_add(self.on_restore_error, str(e))
                
                thread = threading.Thread(target=monitor_process)
                thread.daemon = True
                thread.start()
            else:
                process.wait()
                success = process.returncode == 0
                GLib.idle_add(self.on_restore_complete, mode, success)
            
        except Exception as e:
            print(f"DEBUG: Restore operation failed: {e}")
            GLib.idle_add(self.on_restore_error, str(e))

    def on_restore_complete(self, mode, success):
        """Handle restore completion"""
        print(f"DEBUG: Restore mode {mode} completed, success: {success}")
        
        # Stop spinner only if it exists (non-interactive modes)
        if hasattr(self, 'progress_spinner') and self.progress_spinner:
            self.progress_spinner.stop()
        
        # Clear content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Show result
        result_page = Adw.StatusPage()
        if success:
            result_page.set_icon_name("emblem-ok-symbolic")
            result_page.set_title(_("Restore Completed"))
            result_page.set_description(_("The restore operation completed successfully!"))
        else:
            result_page.set_icon_name("dialog-error-symbolic")
            result_page.set_title(_("Restore Failed"))
            result_page.set_description(_("The restore operation failed. Please try again."))
        
        # Button box for multiple buttons
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        button_box.set_halign(Gtk.Align.CENTER)
        
        # Back button
        back_button = Gtk.Button()
        back_button.set_label(_("Back"))
        back_button.add_css_class("pill")
        back_button.set_size_request(100, -1)
        back_button.connect("clicked", lambda w: self.show_restore_options())
        button_box.append(back_button)
        
        # Close button
        close_button = Gtk.Button()
        close_button.set_label(_("Close"))
        close_button.add_css_class("pill")
        close_button.add_css_class("suggested-action")
        close_button.set_size_request(100, -1)
        close_button.connect("clicked", lambda w: self.get_application().quit())
        button_box.append(close_button)
        
        result_page.set_child(button_box)
        self.content_area.append(result_page)

    def on_restore_error(self, error_msg):
        """Handle restore error"""
        print(f"DEBUG: Restore error: {error_msg}")
        
        # Stop spinner only if it exists (non-interactive modes)
        if hasattr(self, 'progress_spinner') and self.progress_spinner:
            self.progress_spinner.stop()
        
        # Clear content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Show error
        error_page = Adw.StatusPage()
        error_page.set_icon_name("dialog-error-symbolic")
        error_page.set_title(_("Restore Error"))
        error_page.set_description(f"Error: {error_msg}")
        
        # Button box for multiple buttons
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        button_box.set_halign(Gtk.Align.CENTER)
        
        # Back button
        back_button = Gtk.Button()
        back_button.set_label(_("Back"))
        back_button.add_css_class("pill")
        back_button.set_size_request(100, -1)
        back_button.connect("clicked", lambda w: self.show_restore_options())
        button_box.append(back_button)
        
        # Close button
        close_button = Gtk.Button()
        close_button.set_label(_("Close"))
        close_button.add_css_class("pill")
        close_button.add_css_class("suggested-action")
        close_button.set_size_request(100, -1)
        close_button.connect("clicked", lambda w: self.get_application().quit())
        button_box.append(close_button)
        
        error_page.set_child(button_box)
        self.content_area.append(error_page)
        
    def show_interactive_terminal(self):
        """Show interactive terminal for mode 4"""
        print("DEBUG: Showing interactive terminal interface")
        
        # Clear content
        child = self.content_area.get_first_child()
        while child:
            self.content_area.remove(child)
            child = self.content_area.get_first_child()
        
        # Create terminal interface box
        terminal_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        terminal_box.set_margin_top(24)
        terminal_box.set_margin_bottom(24)
        terminal_box.set_margin_start(24)
        terminal_box.set_margin_end(24)
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='x-large' weight='bold'>{_('Interactive Terminal')}</span>")
        title_label.set_halign(Gtk.Align.CENTER)
        terminal_box.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(_("Terminal running inside the selected system. You can execute commands directly."))
        desc_label.set_wrap(True)
        desc_label.set_justify(Gtk.Justification.CENTER)
        desc_label.add_css_class("dim-label")
        terminal_box.append(desc_label)
        
        # Terminal frame and VTE
        if VTE_AVAILABLE:
            self.interactive_terminal = Vte.Terminal()
            self.interactive_terminal.set_size_request(-1, 400)
            self.interactive_terminal.set_font(Pango.FontDescription("monospace 10"))
            self.interactive_terminal.set_scroll_on_output(True)
            
            terminal_frame = Gtk.Frame()
            terminal_frame.set_child(self.interactive_terminal)
            terminal_frame.set_margin_top(12)
            terminal_frame.set_margin_bottom(12)
            
            terminal_box.append(terminal_frame)
            
            # Start chroot session in terminal
            self.start_chroot_session()
        else:
            # Fallback if VTE is not available
            error_label = Gtk.Label()
            error_label.set_text(_("Terminal not available - VTE library not found"))
            error_label.add_css_class("error")
            terminal_box.append(error_label)
        
        # Button box
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        button_box.set_halign(Gtk.Align.CENTER)
        button_box.set_margin_top(12)
        
        # Back button
        back_button = Gtk.Button()
        back_button.set_label(_("Back"))
        back_button.add_css_class("pill")
        back_button.set_size_request(100, -1)
        back_button.connect("clicked", lambda w: self.show_restore_options())
        button_box.append(back_button)
        
        # Close button
        close_button = Gtk.Button()
        close_button.set_label(_("Close"))
        close_button.add_css_class("pill")
        close_button.add_css_class("suggested-action")
        close_button.set_size_request(100, -1)
        close_button.connect("clicked", lambda w: self.get_application().quit())
        button_box.append(close_button)
        
        terminal_box.append(button_box)
        
        self.content_area.append(terminal_box)

    def start_chroot_session(self):
        """Start chroot session in the interactive terminal"""
        try:
            print("DEBUG: Starting chroot session...")
            
            # Mount system manually for interactive session
            import threading
            def setup_and_run():
                try:
                    print("DEBUG: Mounting system for interactive session...")
                    
                    # Get system info
                    selected_system = self.selected_system
                    selected_partition = selected_system['partition']
                    partition_format = selected_system.get('filesystem', 'ext4')
                    
                    # Unmount any existing mounts
                    subprocess.run(['sudo', 'umount', '-l', '/mnt'], capture_output=True)
                    subprocess.run(['sudo', 'umount', '-l', selected_partition], capture_output=True)
                    
                    # Mount the target partition
                    if partition_format == "btrfs":
                        mount_cmd = ['sudo', 'mount', selected_partition, '/mnt', '-o', 'subvol=@']
                    else:
                        mount_cmd = ['sudo', 'mount', selected_partition, '/mnt']
                    
                    mount_result = subprocess.run(mount_cmd, capture_output=True, text=True)
                    
                    if mount_result.returncode == 0:
                        print("DEBUG: System mounted successfully, starting interactive bash...")
                        
                        # Start interactive bash in VTE terminal  
                        cmd = ['sudo', 'manjaro-chroot', '/mnt', 'bash']
                        GLib.idle_add(self.spawn_in_terminal, cmd)
                    else:
                        error_msg = mount_result.stderr or "Failed to mount system"
                        print(f"DEBUG: Mount failed: {error_msg}")
                        GLib.idle_add(self.show_terminal_error, f"Mount failed: {error_msg}")
                        
                except Exception as e:
                    print(f"DEBUG: Setup failed: {e}")
                    GLib.idle_add(self.show_terminal_error, str(e))
            
            thread = threading.Thread(target=setup_and_run)
            thread.daemon = True
            thread.start()
            
        except Exception as e:
            print(f"DEBUG: Failed to start chroot session: {e}")
            self.show_terminal_error(str(e))

    def spawn_in_terminal(self, cmd):
        """Spawn command in VTE terminal using modern async API"""
        try:
            # Use modern async spawn method
            if VTE_VERSION == '3.91':
                self.interactive_terminal.spawn_async(
                    Vte.PtyFlags.DEFAULT,
                    None,  # working directory
                    cmd,   # command and arguments
                    None,  # environment
                    GLib.SpawnFlags.DO_NOT_REAP_CHILD,
                    None,  # child setup function
                    None,  # child setup data
                    -1,    # timeout (-1 = no timeout)
                    None,  # cancellable
                    self.on_spawn_complete,  # callback
                    None   # user data
                )
            else:
                # Fallback to sync method for older VTE
                success = self.interactive_terminal.spawn_sync(
                    Vte.PtyFlags.DEFAULT,
                    None,  # working directory  
                    cmd,
                    None,  # environment
                    GLib.SpawnFlags.DO_NOT_REAP_CHILD,
                    None,  # child setup
                    None   # child setup data
                )
                
                if success:
                    print("DEBUG: Interactive terminal spawned successfully")
                else:
                    self.show_terminal_error("Failed to spawn terminal process")
                
        except Exception as e:
            print(f"DEBUG: Failed to spawn terminal: {e}")
            self.show_terminal_error(f"Failed to start terminal: {e}")

    def on_spawn_complete(self, terminal, pid, error, user_data):
        """Handle spawn completion"""
        if error:
            print(f"DEBUG: Spawn failed: {error}")
            self.show_terminal_error(f"Failed to start terminal: {error}")
        else:
            print(f"DEBUG: Interactive terminal spawned successfully (PID: {pid})")

    def show_terminal_error(self, error_msg):
        """Show terminal error message"""
        if hasattr(self, 'interactive_terminal'):
            error_text = f"Error: {error_msg}\r\n"
            self.interactive_terminal.feed(error_text.encode('utf-8'))

    def update_app_status(self, message):
        """Update application status label"""
        if hasattr(self, 'app_status_label'):
            self.app_status_label.set_text(message)

    def stop_app_spinner(self):
        """Stop application spinner"""
        if hasattr(self, 'app_spinner'):
            self.app_spinner.stop()