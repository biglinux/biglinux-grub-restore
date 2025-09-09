#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import gi

# Ensure we're using the correct versions
try:
    gi.require_version('Gtk', '4.0')
    gi.require_version('Adw', '1')
except (ImportError, ValueError) as e:
    print(f"Error: Missing GTK4/Adwaita dependencies. {e}", file=sys.stderr)
    sys.exit(1)

from gi.repository import Gtk, Adw

def main():
    """Main entry point for the application"""
    
    # Check if running as root, which is required for backend scripts
    if os.geteuid() != 0:
        print("This application needs to be run as root. Trying to relaunch with pkexec...")
        try:
            # Get the absolute path to the script being run to avoid path issues with pkexec
            script_path = os.path.abspath(sys.argv[0])
            
            # Prepare environment variables to preserve for the GUI app
            env_vars_to_preserve = []
            for var in ['DISPLAY', 'XAUTHORITY', 'DBUS_SESSION_BUS_ADDRESS']:
                if var in os.environ:
                    env_vars_to_preserve.append(f'{var}={os.environ[var]}')

            # Construct the full pkexec command
            args = ['pkexec']
            if env_vars_to_preserve:
                args.extend(['env'] + env_vars_to_preserve)
            
            # Add the python interpreter, the absolute script path, and any other arguments
            args.extend([sys.executable, script_path] + sys.argv[1:])
            
            os.execvp('pkexec', args)
        except Exception as e:
            print(f"Failed to relaunch with pkexec: {e}", file=sys.stderr)
            # Fallback to a simple error dialog if pkexec fails
            error_app = Gtk.Application()
            def show_error(app):
                dialog = Gtk.MessageDialog(
                    transient_for=None,
                    modal=True,
                    message_type=Gtk.MessageType.ERROR,
                    buttons=Gtk.ButtonsType.OK,
                    text="Root privileges are required.",
                    secondary_text="This application must be run as root to function correctly. Please run it with sudo or pkexec."
                )
                dialog.connect("response", lambda d, r: app.quit())
                dialog.show()
            error_app.connect('activate', show_error)
            error_app.run(None)
            sys.exit(1)

    try:
        from gui.application import GrubRestoreApplication
        
        app = GrubRestoreApplication()
        return app.run(sys.argv)
        
    except Exception as e:
        import traceback
        traceback.print_exc()
        
        error_message = "Failed to load main application:\n" + str(e)
        
        # Fallback to a simple Adwaita error window
        class FallbackApp(Adw.Application):
            def __init__(self, error_msg):
                super().__init__(application_id="com.biglinux.grub-restore.fallback")
                self.error_msg = error_msg
            
            def do_activate(self):
                window = Adw.ApplicationWindow(application=self)
                window.set_title("BigLinux GRUB Restore - Error")
                window.set_default_size(600, 400)
                
                status_page = Adw.StatusPage()
                status_page.set_title("Application Error")
                status_page.set_description(self.error_msg)
                status_page.set_icon_name("dialog-error-symbolic")
                
                window.set_content(status_page)
                window.present()
        
        fallback_app = FallbackApp(error_message)
        return fallback_app.run(sys.argv)

if __name__ == "__main__":
    sys.exit(main())
