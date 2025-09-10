#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import gi
import subprocess
import argparse

# Ensure we're using the correct versions
try:
    gi.require_version('Gtk', '4.0')
    gi.require_version('Adw', '1')
except (ImportError, ValueError) as e:
    print(f"Error: Missing GTK4/Adwaita dependencies. {e}", file=sys.stderr)
    sys.exit(1)

from gi.repository import Gtk, Adw, GLib

def get_user_gsetting(schema, key):
    """Gets a user's gsettings value."""
    try:
        result = subprocess.run(
            ['gsettings', 'get', schema, key],
            capture_output=True, text=True, check=True
        )
        return result.stdout.strip().strip("'")
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None

def main():
    """Main entry point for the application"""
    
    # Set the program name for Wayland association
    GLib.set_prgname("br.com.biglinux.grub-restore")
    
    # Check if running as root
    if os.geteuid() != 0:
        print("This application needs to be run as root. Trying to relaunch with pkexec...")
        try:
            script_path = os.path.abspath(sys.argv[0])
            
            # --- USER SETTINGS DETECTION (RUNNING AS USER) ---
            user_scheme = get_user_gsetting('org.gnome.desktop.interface', 'color-scheme') or 'default'
            user_button_layout = get_user_gsetting('org.gnome.desktop.wm.preferences', 'button-layout') or ''

            env_vars_to_preserve = []
            for var in ['DISPLAY', 'XAUTHORITY', 'DBUS_SESSION_BUS_ADDRESS', 'WAYLAND_DISPLAY']:
                if var in os.environ:
                    env_vars_to_preserve.append(f'{var}={os.environ[var]}')

            args = ['pkexec']
            if env_vars_to_preserve:
                args.extend(['env'] + env_vars_to_preserve)
            
            args.extend([sys.executable, script_path] + sys.argv[1:])
            # Pass detected settings to the root process
            args.append(f'--color-scheme-from-user={user_scheme}')
            args.append(f'--button-layout-from-user={user_button_layout}')
            
            os.execvp('pkexec', args)
        except Exception as e:
            print(f"Failed to relaunch with pkexec: {e}", file=sys.stderr)
            error_app = Gtk.Application()
            def show_error(app):
                dialog = Gtk.MessageDialog(
                    transient_for=None, modal=True, message_type=Gtk.MessageType.ERROR,
                    buttons=Gtk.ButtonsType.OK, text="Root privileges are required.",
                    secondary_text="This application must be run as root to function correctly. Please run it with sudo or pkexec."
                )
                dialog.connect("response", lambda d, r: app.quit())
                dialog.show()
            error_app.connect('activate', show_error)
            error_app.run(None)
            sys.exit(1)

    # --- SETTINGS APPLICATION (RUNNING AS ROOT) ---
    
    # Force Cairo renderer for compatibility, especially in Live environments
    os.environ['GSK_RENDERER'] = 'cairo'
    
    parser = argparse.ArgumentParser()
    parser.add_argument('--color-scheme-from-user', type=str, default='default')
    parser.add_argument('--button-layout-from-user', type=str, default=None)
    args, unknown = parser.parse_known_args()

    # Apply color scheme
    scheme_map = {
        'default': Adw.ColorScheme.DEFAULT,
        'prefer-light': Adw.ColorScheme.FORCE_LIGHT,
        'prefer-dark': Adw.ColorScheme.FORCE_DARK,
    }
    color_scheme_to_apply = scheme_map.get(args.color_scheme_from_user, Adw.ColorScheme.DEFAULT)
    if color_scheme_to_apply != Adw.ColorScheme.DEFAULT:
        style_manager = Adw.StyleManager.get_default()
        style_manager.set_color_scheme(color_scheme_to_apply)

    # Apply button layout
    if args.button_layout_from_user:
        gtk_settings = Gtk.Settings.get_default()
        gtk_settings.set_property('gtk-decoration-layout', args.button_layout_from_user)

    try:
        from gui.application import GrubRestoreApplication
        
        # Pass the original sys.argv (without our custom args) to the app
        app = GrubRestoreApplication()
        return app.run([sys.argv[0]] + unknown)
        
    except Exception as e:
        import traceback
        traceback.print_exc()
        
        error_message = "Failed to load main application:\n" + str(e)
        
        class FallbackApp(Adw.Application):
            def __init__(self, error_msg):
                super().__init__(application_id="com.biglinux.grub-restore.fallback")
                self.error_msg = error_msg
            
            def do_activate(self):
                window = Adw.ApplicationWindow(application=self)
                window.set_title("Restore the installed system - Error")
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
