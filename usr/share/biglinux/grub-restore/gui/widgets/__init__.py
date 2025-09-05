#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Widgets package for BigLinux GRUB Restore

This package contains custom widgets for the GTK4/Libadwaita interface.
"""

# Make key widgets available at package level
from .system_info import SystemInfoWidget, BootConfigWidget, NetworkStatusWidget
from .disk_selector import DiskSelectorWidget, EfiPartitionSelectorWidget
from .restore_options import RestoreOptionsWidget

__all__ = [
    'SystemInfoWidget',
    'BootConfigWidget', 
    'NetworkStatusWidget',
    'DiskSelectorWidget',
    'EfiPartitionSelectorWidget',
    'RestoreOptionsWidget'
]