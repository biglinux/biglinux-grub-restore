#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')

from gi.repository import Gtk, Adw, GObject
from utils.translation import _
from utils.helpers import UIHelper, FileSystemHelper, SystemInfoHelper

class SystemInfoWidget(Gtk.Box):
    """Widget to display system information in a card-like format"""
    
    __gtype_name__ = 'SystemInfoWidget'
    
    def __init__(self, system_info=None, **kwargs):
        super().__init__(**kwargs)
        
        self.system_info = system_info
        
        # Set box properties
        self.set_orientation(Gtk.Orientation.VERTICAL)
        self.set_spacing(6)
        self.add_css_class("card")
        self.set_margin_top(6)
        self.set_margin_bottom(6)
        self.set_margin_start(6)
        self.set_margin_end(6)
        
        # Build the widget
        self.build_ui()
        
        # Update content if system info provided
        if system_info:
            self.update_system_info(system_info)
    
    def build_ui(self):
        """Build the widget UI"""
        
        # Header with icon and title
        header_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        header_box.set_margin_top(12)
        header_box.set_margin_bottom(8)
        header_box.set_margin_start(12)
        header_box.set_margin_end(12)
        
        # System icon
        self.system_icon = Gtk.Image()
        self.system_icon.set_icon_name("computer-symbolic")
        self.system_icon.set_pixel_size(32)
        header_box.append(self.system_icon)
        
        # Title and subtitle
        title_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
        title_box.set_hexpand(True)
        
        self.title_label = Gtk.Label()
        self.title_label.set_markup("<b>" + _("Linux System") + "</b>")
        self.title_label.set_halign(Gtk.Align.START)
        title_box.append(self.title_label)
        
        self.subtitle_label = Gtk.Label()
        self.subtitle_label.set_text(_("No system detected"))
        self.subtitle_label.add_css_class("dim-label")
        self.subtitle_label.set_halign(Gtk.Align.START)
        title_box.append(self.subtitle_label)
        
        header_box.append(title_box)
        
        # Status indicator
        self.status_icon = Gtk.Image()
        self.status_icon.set_icon_name("emblem-ok-symbolic")
        self.status_icon.add_css_class("success")
        header_box.append(self.status_icon)
        
        self.append(header_box)
        
        # Details group
        self.details_group = Adw.PreferencesGroup()
        self.details_group.set_margin_start(6)
        self.details_group.set_margin_end(6)
        self.details_group.set_margin_bottom(6)
        self.append(self.details_group)
        
        # Create detail rows
        self.create_detail_rows()
    
    def create_detail_rows(self):
        """Create the detail information rows"""
        
        # Partition row
        self.partition_row = Adw.ActionRow()
        self.partition_row.set_title(_("Partition"))
        self.partition_row.set_subtitle(_("Not selected"))
        self.partition_row.set_icon_name("drive-harddisk-symbolic")
        self.details_group.add(self.partition_row)
        
        # Filesystem row
        self.filesystem_row = Adw.ActionRow()
        self.filesystem_row.set_title(_("Filesystem"))
        self.filesystem_row.set_subtitle(_("Unknown"))
        self.filesystem_row.set_icon_name("folder-symbolic")
        self.details_group.add(self.filesystem_row)
        
        # UUID row
        self.uuid_row = Adw.ActionRow()
        self.uuid_row.set_title(_("UUID"))
        self.uuid_row.set_subtitle(_("Not available"))
        self.uuid_row.set_icon_name("document-properties-symbolic")
        self.details_group.add(self.uuid_row)
    
    def update_system_info(self, system_info):
        """Update the widget with system information"""
        
        self.system_info = system_info
        
        if not system_info:
            self.show_no_system()
            return
        
        # Update title and subtitle
        name = system_info.get('name', _('Unknown System'))
        description = system_info.get('description', '')
        
        self.title_label.set_markup(f"<b>{name}</b>")
        
        if description:
            self.subtitle_label.set_text(description)
        else:
            self.subtitle_label.set_text(_("Linux Installation"))
        
        # Update partition info
        partition = system_info.get('partition', '')
        if partition:
            partition_desc = UIHelper.create_partition_description(partition, system_info)
            self.partition_row.set_subtitle(partition_desc)
        else:
            self.partition_row.set_subtitle(_("Not specified"))
        
        # Update filesystem info
        filesystem = system_info.get('filesystem', '')
        if filesystem:
            self.filesystem_row.set_subtitle(filesystem.upper())
        else:
            self.filesystem_row.set_subtitle(_("Unknown"))
        
        # Update UUID info
        uuid = system_info.get('uuid', '')
        if uuid:
            # Truncate UUID for display
            display_uuid = uuid[:8] + "..." if len(uuid) > 8 else uuid
            self.uuid_row.set_subtitle(display_uuid)
        else:
            self.uuid_row.set_subtitle(_("Not available"))
        
        # Update status
        self.show_valid_system()
    
    def show_no_system(self):
        """Show state when no system is detected"""
        self.title_label.set_markup(f"<b>{_('No System')}</b>")
        self.subtitle_label.set_text(_("No Linux installation detected"))
        self.status_icon.set_icon_name("dialog-warning-symbolic")
        self.status_icon.remove_css_class("success")
        self.status_icon.add_css_class("warning")
        
        # Clear details
        self.partition_row.set_subtitle(_("Not detected"))
        self.filesystem_row.set_subtitle(_("Unknown"))
        self.uuid_row.set_subtitle(_("Not available"))
    
    def show_valid_system(self):
        """Show state when valid system is detected"""
        self.status_icon.set_icon_name("emblem-ok-symbolic")
        self.status_icon.remove_css_class("warning")
        self.status_icon.add_css_class("success")
    
    def set_selected(self, selected):
        """Set the selected state of the widget"""
        if selected:
            self.add_css_class("selected")
        else:
            self.remove_css_class("selected")

class BootConfigWidget(Gtk.Box):
    """Widget to display boot configuration information"""
    
    __gtype_name__ = 'BootConfigWidget'
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        # Set box properties
        self.set_orientation(Gtk.Orientation.VERTICAL)
        self.set_spacing(6)
        self.add_css_class("card")
        self.set_margin_top(6)
        self.set_margin_bottom(6)
        self.set_margin_start(6)
        self.set_margin_end(6)
        
        # Build the widget
        self.build_ui()
        
        # Set initial state
        self.update_boot_info()
    
    def build_ui(self):
        """Build the widget UI"""
        
        # Header
        header_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12)
        header_box.set_margin_top(12)
        header_box.set_margin_bottom(8)
        header_box.set_margin_start(12)
        header_box.set_margin_end(12)
        
        # Boot icon
        boot_icon = Gtk.Image()
        boot_icon.set_icon_name("system-run-symbolic")
        boot_icon.set_pixel_size(32)
        header_box.append(boot_icon)
        
        # Title
        title_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
        title_box.set_hexpand(True)
        
        title_label = Gtk.Label()
        title_label.set_markup(f"<b>{_('Boot Configuration')}</b>")
        title_label.set_halign(Gtk.Align.START)
        title_box.append(title_label)
        
        subtitle_label = Gtk.Label()
        subtitle_label.set_text(_("Current system boot information"))
        subtitle_label.add_css_class("dim-label")
        subtitle_label.set_halign(Gtk.Align.START)
        title_box.append(subtitle_label)
        
        header_box.append(title_box)
        self.append(header_box)
        
        # Details group
        self.details_group = Adw.PreferencesGroup()
        self.details_group.set_margin_start(6)
        self.details_group.set_margin_end(6)
        self.details_group.set_margin_bottom(6)
        self.append(self.details_group)
        
        # Create detail rows
        self.create_detail_rows()
    
    def create_detail_rows(self):
        """Create the detail information rows"""
        
        # Boot mode row
        self.boot_mode_row = Adw.ActionRow()
        self.boot_mode_row.set_title(_("Boot Mode"))
        self.boot_mode_row.set_subtitle(_("Detecting..."))
        self.boot_mode_row.set_icon_name("emblem-system-symbolic")
        self.details_group.add(self.boot_mode_row)
        
        # Live session row
        self.live_session_row = Adw.ActionRow()
        self.live_session_row.set_title(_("Live Session"))
        self.live_session_row.set_subtitle(_("Checking..."))
        self.live_session_row.set_icon_name("media-optical-symbolic")
        self.details_group.add(self.live_session_row)
        
        # Memory info row
        self.memory_row = Adw.ActionRow()
        self.memory_row.set_title(_("Available Memory"))
        self.memory_row.set_subtitle(_("Detecting..."))
        self.memory_row.set_icon_name("application-x-firmware-symbolic")
        self.details_group.add(self.memory_row)
    
    def update_boot_info(self):
        """Update boot configuration information"""
        
        # Boot mode
        boot_mode = SystemInfoHelper.get_boot_mode()
        if boot_mode == "EFI":
            self.boot_mode_row.set_subtitle(_("EFI/UEFI"))
        else:
            self.boot_mode_row.set_subtitle(_("Legacy/BIOS"))
        
        # Live session
        if SystemInfoHelper.is_live_session():
            self.live_session_row.set_subtitle(_("Active (Live Mode)"))
        else:
            self.live_session_row.set_subtitle(_("Not detected"))
        
        # Memory info
        memory_info = SystemInfoHelper.get_memory_info()
        self.memory_row.set_subtitle(memory_info)

class NetworkStatusWidget(Gtk.Box):
    """Widget to display network status"""
    
    __gtype_name__ = 'NetworkStatusWidget'
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        # Set box properties
        self.set_orientation(Gtk.Orientation.HORIZONTAL)
        self.set_spacing(8)
        self.set_margin_top(6)
        self.set_margin_bottom(6)
        self.set_margin_start(12)
        self.set_margin_end(12)
        
        # Build the widget
        self.build_ui()
        
        # Initial status check
        self.check_network_status()
    
    def build_ui(self):
        """Build the widget UI"""
        
        # Network icon
        self.network_icon = Gtk.Image()
        self.network_icon.set_icon_name("network-wireless-signal-excellent-symbolic")
        self.network_icon.set_pixel_size(16)
        self.append(self.network_icon)
        
        # Status label
        self.status_label = Gtk.Label()
        self.status_label.set_text(_("Checking network connection..."))
        self.status_label.set_hexpand(True)
        self.status_label.set_halign(Gtk.Align.START)
        self.append(self.status_label)
    
    def check_network_status(self):
        """Check and update network status"""
        from utils.helpers import NetworkHelper
        
        status = NetworkHelper.get_network_status_message()
        
        self.network_icon.set_icon_name(status['icon'])
        self.status_label.set_text(status['message'])
        
        if status['connected']:
            self.status_label.add_css_class("success")
            self.status_label.remove_css_class("warning")
        else:
            self.status_label.add_css_class("warning")
            self.status_label.remove_css_class("success")