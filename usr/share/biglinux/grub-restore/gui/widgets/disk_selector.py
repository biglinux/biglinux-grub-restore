#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')

from gi.repository import Gtk, Adw, GObject
from utils.translation import _
from utils.helpers import UIHelper, FileSystemHelper

class DiskSelectorWidget(Gtk.Box):
    """Widget for selecting disk in Legacy boot mode"""
    
    __gtype_name__ = 'DiskSelectorWidget'
    
    # Signals
    __gsignals__ = {
        'disk-selected': (GObject.SignalFlags.RUN_FIRST, None, (str,))
    }
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        self.selected_disk = None
        self.disk_list = []
        
        # Set box properties
        self.set_orientation(Gtk.Orientation.VERTICAL)
        self.set_spacing(12)
        self.set_margin_top(12)
        self.set_margin_bottom(12)
        self.set_margin_start(12)
        self.set_margin_end(12)
        
        # Build the widget
        self.build_ui()
    
    def build_ui(self):
        """Build the widget UI"""
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='large' weight='bold'>{_('Select Target Disk')}</span>")
        title_label.set_halign(Gtk.Align.START)
        self.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(
            _("Select the disk where GRUB will be installed. "
              "The bootloader will be written to the beginning of the selected disk.")
        )
        desc_label.set_wrap(True)
        desc_label.set_halign(Gtk.Align.START)
        desc_label.add_css_class("dim-label")
        self.append(desc_label)
        
        # Disk list group
        self.disk_group = Adw.PreferencesGroup()
        self.disk_group.set_title(_("Available Disks"))
        self.append(self.disk_group)
        
        # No disks message (hidden by default)
        self.no_disks_message = Adw.StatusPage()
        self.no_disks_message.set_icon_name("drive-harddisk-symbolic")
        self.no_disks_message.set_title(_("No Disks Found"))
        self.no_disks_message.set_description(
            _("No suitable disks were found for GRUB installation. "
              "Please check if your disks are properly connected.")
        )
        self.no_disks_message.set_visible(False)
        self.append(self.no_disks_message)
    
    def set_disk_list(self, disk_list):
        """Set the list of available disks"""
        
        self.disk_list = disk_list or []
        self.selected_disk = None
        
        # Clear existing items
        while self.disk_group.get_first_child():
            self.disk_group.remove(self.disk_group.get_first_child())
        
        if not self.disk_list:
            self.show_no_disks()
            return
        
        self.hide_no_disks()
        
        # Add disk items
        for i, disk_info in enumerate(self.disk_list):
            disk_row = self.create_disk_row(disk_info, i == 0)
            self.disk_group.add(disk_row)
        
        # Select first disk by default if only one
        if len(self.disk_list) == 1:
            self.select_disk(self.disk_list[0]['device'])
    
    def create_disk_row(self, disk_info, is_default=False):
        """Create a row for a disk"""
        
        disk_row = Adw.ActionRow()
        
        # Title: device name and size
        title = f"{disk_info['device']} ({disk_info['size']})"
        disk_row.set_title(title)
        
        # Subtitle: model and partition table
        subtitle_parts = []
        if disk_info.get('name') and disk_info['name'] != 'Unknown_Disk':
            model_name = disk_info['name'].replace('_', ' ')
            subtitle_parts.append(model_name)
        
        if disk_info.get('table'):
            subtitle_parts.append(f"({disk_info['table']})")
        
        if subtitle_parts:
            disk_row.set_subtitle(' '.join(subtitle_parts))
        else:
            disk_row.set_subtitle(_("Unknown model"))
        
        # Icon
        disk_row.set_icon_name("drive-harddisk-symbolic")
        
        # Radio button for selection
        radio_button = Gtk.CheckButton()
        radio_button.set_active(is_default)
        radio_button.connect('toggled', self.on_disk_selected, disk_info['device'])
        
        # Group radio buttons together
        if hasattr(self, 'radio_group'):
            radio_button.set_group(self.radio_group)
        else:
            self.radio_group = radio_button
        
        disk_row.add_prefix(radio_button)
        
        # Warning for certain partition tables
        if disk_info.get('table') == 'gpt':
            warning_icon = Gtk.Image()
            warning_icon.set_icon_name("dialog-warning-symbolic")
            warning_icon.set_tooltip_text(
                _("GPT partition table detected. Make sure this is correct for Legacy boot mode.")
            )
            disk_row.add_suffix(warning_icon)
        
        return disk_row
    
    def on_disk_selected(self, radio_button, disk_device):
        """Handle disk selection"""
        
        if radio_button.get_active():
            self.selected_disk = disk_device
            self.emit('disk-selected', disk_device)
    
    def select_disk(self, disk_device):
        """Programmatically select a disk"""
        
        self.selected_disk = disk_device
        
        # Find and activate the corresponding radio button
        child = self.disk_group.get_first_child()
        while child:
            if isinstance(child, Adw.ActionRow):
                radio_button = child.get_first_child()
                if isinstance(radio_button, Gtk.CheckButton):
                    # Check if this row corresponds to the device
                    if disk_device in child.get_title():
                        radio_button.set_active(True)
                        break
            child = child.get_next_sibling()
    
    def get_selected_disk(self):
        """Get the currently selected disk"""
        return self.selected_disk
    
    def show_no_disks(self):
        """Show no disks message"""
        self.disk_group.set_visible(False)
        self.no_disks_message.set_visible(True)
    
    def hide_no_disks(self):
        """Hide no disks message"""
        self.no_disks_message.set_visible(False)
        self.disk_group.set_visible(True)

class EfiPartitionSelectorWidget(Gtk.Box):
    """Widget for selecting EFI partition in EFI boot mode"""
    
    __gtype_name__ = 'EfiPartitionSelectorWidget'
    
    # Signals
    __gsignals__ = {
        'partition-selected': (GObject.SignalFlags.RUN_FIRST, None, (str,))
    }
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        self.selected_partition = None
        self.partition_list = []
        
        # Set box properties
        self.set_orientation(Gtk.Orientation.VERTICAL)
        self.set_spacing(12)
        self.set_margin_top(12)
        self.set_margin_bottom(12)
        self.set_margin_start(12)
        self.set_margin_end(12)
        
        # Build the widget
        self.build_ui()
    
    def build_ui(self):
        """Build the widget UI"""
        
        # Title
        title_label = Gtk.Label()
        title_label.set_markup(f"<span size='large' weight='bold'>{_('Select EFI Partition')}</span>")
        title_label.set_halign(Gtk.Align.START)
        self.append(title_label)
        
        # Description
        desc_label = Gtk.Label()
        desc_label.set_text(
            _("Select the EFI System Partition where GRUB will be installed. "
              "This partition contains the boot files for UEFI systems.")
        )
        desc_label.set_wrap(True)
        desc_label.set_halign(Gtk.Align.START)
        desc_label.add_css_class("dim-label")
        self.append(desc_label)
        
        # Partition list group
        self.partition_group = Adw.PreferencesGroup()
        self.partition_group.set_title(_("Available EFI Partitions"))
        self.append(self.partition_group)
        
        # No partitions message (hidden by default)
        self.no_partitions_message = Adw.StatusPage()
        self.no_partitions_message.set_icon_name("drive-harddisk-symbolic")
        self.no_partitions_message.set_title(_("No EFI Partitions Found"))
        self.no_partitions_message.set_description(
            _("No EFI System Partitions were found. "
              "Your system may not be configured for UEFI boot.")
        )
        self.no_partitions_message.set_visible(False)
        self.append(self.no_partitions_message)
    
    def set_partition_list(self, partition_list):
        """Set the list of available EFI partitions"""
        
        self.partition_list = partition_list or []
        self.selected_partition = None
        
        # Clear existing items
        while self.partition_group.get_first_child():
            self.partition_group.remove(self.partition_group.get_first_child())
        
        if not self.partition_list:
            self.show_no_partitions()
            return
        
        self.hide_no_partitions()
        
        # Add partition items
        for i, partition_path in enumerate(self.partition_list):
            partition_row = self.create_partition_row(partition_path, i == 0)
            self.partition_group.add(partition_row)
        
        # Select first partition by default if only one
        if len(self.partition_list) == 1:
            self.select_partition(self.partition_list[0])
    
    def create_partition_row(self, partition_path, is_default=False):
        """Create a row for an EFI partition"""
        
        partition_row = Adw.ActionRow()
        
        # Title: partition path
        partition_row.set_title(partition_path)
        
        # Get additional info about the partition
        try:
            import subprocess
            # Get size
            result = subprocess.run(
                ['lsblk', '-no', 'SIZE', partition_path],
                capture_output=True,
                text=True
            )
            if result.returncode == 0:
                size = result.stdout.strip()
                partition_row.set_subtitle(f"EFI System Partition ({size})")
            else:
                partition_row.set_subtitle(_("EFI System Partition"))
        except Exception:
            partition_row.set_subtitle(_("EFI System Partition"))
        
        # Icon
        partition_row.set_icon_name("drive-harddisk-symbolic")
        
        # Radio button for selection
        radio_button = Gtk.CheckButton()
        radio_button.set_active(is_default)
        radio_button.connect('toggled', self.on_partition_selected, partition_path)
        
        # Group radio buttons together
        if hasattr(self, 'radio_group'):
            radio_button.set_group(self.radio_group)
        else:
            self.radio_group = radio_button
        
        partition_row.add_prefix(radio_button)
        
        return partition_row
    
    def on_partition_selected(self, radio_button, partition_path):
        """Handle partition selection"""
        
        if radio_button.get_active():
            self.selected_partition = partition_path
            self.emit('partition-selected', partition_path)
    
    def select_partition(self, partition_path):
        """Programmatically select a partition"""
        
        self.selected_partition = partition_path
        
        # Find and activate the corresponding radio button
        child = self.partition_group.get_first_child()
        while child:
            if isinstance(child, Adw.ActionRow):
                radio_button = child.get_first_child()
                if isinstance(radio_button, Gtk.CheckButton):
                    # Check if this row corresponds to the partition
                    if partition_path in child.get_title():
                        radio_button.set_active(True)
                        break
            child = child.get_next_sibling()
    
    def get_selected_partition(self):
        """Get the currently selected partition"""
        return self.selected_partition
    
    def show_no_partitions(self):
        """Show no partitions message"""
        self.partition_group.set_visible(False)
        self.no_partitions_message.set_visible(True)
    
    def hide_no_partitions(self):
        """Hide no partitions message"""
        self.no_partitions_message.set_visible(False)
        self.partition_group.set_visible(True)