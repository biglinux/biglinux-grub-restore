#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
# translation.py - Utilities for translation support
"""

import gettext

# Configure the translation domain/name
gettext.textdomain("grub-restore")

# Export _ directly as the translation function
_ = gettext.gettext