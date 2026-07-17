#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
# translation.py - Utilities for translation support
"""

import gettext
from pathlib import Path

# Configure the translation domain/name
DOMAIN = "biglinux-grub-restore"
LOCALE_DIR = Path(__file__).resolve().parents[3] / "locale"
gettext.bindtextdomain(DOMAIN, LOCALE_DIR)
gettext.textdomain(DOMAIN)

# Export _ directly as the translation function
_ = gettext.gettext
