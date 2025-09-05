#!/usr/bin/env python3
# Debug version to test basic GTK4/Libadwaita functionality

import sys
import gi

print("1. Starting debug...")

# Ensure we're using the correct versions
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')

print("2. GTK versions set...")

from gi.repository import Gtk, Adw, GLib

print("3. Imports successful...")

class DebugApp(Adw.Application):
    def __init__(self):
        super().__init__(application_id="com.biglinux.grub-restore.debug")
        print("4. Application created...")
    
    def do_activate(self):
        print("5. Application activated...")
        
        # Create window
        window = Adw.ApplicationWindow(application=self)
        window.set_title("Debug GRUB Restore")
        window.set_default_size(400, 300)
        
        # Create simple content
        status_page = Adw.StatusPage()
        status_page.set_title("Debug Test")
        status_page.set_description("If you see this, GTK4/Libadwaita is working!")
        status_page.set_icon_name("dialog-information")
        
        window.set_content(status_page)
        window.present()
        
        print("6. Window presented!")

def main():
    print("0. Starting main...")
    app = DebugApp()
    return app.run(sys.argv)

if __name__ == "__main__":
    print("Starting debug application...")
    sys.exit(main())