#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import gi

print("1. Starting application...")

# Ensure we're using the correct versions
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')

print("2. GTK versions set...")

from gi.repository import Gtk, Adw, GLib

print("3. GTK imports successful...")

# Simple translation function for testing
def _(text):
    return text

print("4. Translation function ready...")

def main():
    """Main entry point for the application"""
    
    print("5. In main function...")
    
    # Check if running in live mode (skip for testing)
    # if not os.path.exists('/livefs-pkgs.txt'):
    #     print("Not in live mode, but continuing for testing...")
    
    print("6. Live mode check passed...")
    
    # Try to import the main application
    try:
        print("7. Importing GrubRestoreApplication...")
        from gui.application import GrubRestoreApplication
        print("8. Import successful...")
        
        # Create and run the application
        print("9. Creating application...")
        app = GrubRestoreApplication()
        print("10. Application created, running...")
        return app.run(sys.argv)
        
    except Exception as e:
        print("ERROR: Failed to import or run application:", str(e))
        import traceback
        traceback.print_exc()
        
        # CAPTURE the error message BEFORE defining the class
        error_message = "Failed to load main application:\n" + str(e)
        
        # Fallback to simple window
        print("Creating fallback window...")
        
        class FallbackApp(Adw.Application):
            def __init__(self):
                super().__init__(application_id="com.biglinux.grub-restore.fallback")
            
            def do_activate(self):
                window = Adw.ApplicationWindow(application=self)
                window.set_title("BigLinux GRUB Restore - Error")
                window.set_default_size(600, 400)
                
                status_page = Adw.StatusPage()
                status_page.set_title("Application Error")
                status_page.set_description(error_message)
                status_page.set_icon_name("dialog-error")
                
                window.set_content(status_page)
                window.present()
        
        fallback_app = FallbackApp()
        return fallback_app.run(sys.argv)

if __name__ == "__main__":
    print("0. Starting main...")
    exit_code = main()
    print("11. Application finished with code:", exit_code)
    sys.exit(exit_code)