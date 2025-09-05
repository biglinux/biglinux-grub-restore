#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
GUI package for BigLinux GRUB Restore

This package contains all the GTK4/Libadwaita interface components
for the GRUB restore application.
"""

# Package version
__version__ = "2.0.0"

# Make key classes available at package level
from .application import GrubRestoreApplication
from .window import GrubRestoreWindow

__all__ = [
    'GrubRestoreApplication',
    'GrubRestoreWindow'
]