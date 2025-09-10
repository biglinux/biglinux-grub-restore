#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
import os
import threading

gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')

try:
    gi.require_version('Vte', '3.91')
    from gi.repository import Vte, Pango, Gdk, GLib
    VTE_AVAILABLE = True
except (ImportError, ValueError):
    VTE_AVAILABLE = False

from gi.repository import Gtk, Adw, Gio
from backend.system_interface import SystemInterface
from utils.translation import _

class GrubRestoreWindow(Adw.ApplicationWindow):
    """Main window for the GRUB Restore application, using a wizard-style flow."""
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        
        self.set_title(_("Restore the installed system"))
        self.set_default_size(1080, 660)
        
        self.system_interface = SystemInterface()
        self.selected_system = None
        self.selected_efi_partition = None
        self.selected_disk = None
        self.current_process = None
        self.current_mode = None
        self.mismatch_warning_shown = False

        self.system_rows = []
        self.efi_rows = []
        self.legacy_rows = []
        self.restore_rows = {}

        self.system_check_buttons = []
        self.boot_target_check_buttons = []
        self.legacy_boot_target_check_buttons = []

        self._build_ui()
        self._create_window_actions()

    def _build_ui(self):
        """Build the main UI structure with a ViewStack."""
        self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.set_content(self.main_box)

        self.header_bar = Adw.HeaderBar()
        
        # Add application icon to the header bar for clear identification
        app_icon = Gtk.Image(
            icon_name="grub-icon",
            pixel_size=22
        )
        self.header_bar.pack_start(app_icon)

        self.main_box.append(self.header_bar)
        
        self._setup_menu()

        self.view_stack = Adw.ViewStack()
        self.main_box.append(self.view_stack)

        self.view_stack.add_named(self._create_welcome_page(), "welcome")
        self.view_stack.add_named(self._create_detection_page(), "detection")
        self.view_stack.add_named(self._create_selection_page(), "selection")
        self.view_stack.add_named(self._create_restore_page(), "restore")
        
        self.view_stack.set_visible_child_name("welcome")

    def _setup_menu(self):
        """Setup the application menu."""
        menu_model = Gio.Menu()
        menu_model.append(_("About"), "app.about")
        menu_model.append(_("Quit"), "app.quit")
        
        menu_button = Gtk.MenuButton(menu_model=menu_model, icon_name="open-menu-symbolic")
        self.header_bar.pack_end(menu_button)

    def _create_window_actions(self):
        """Create actions that are scoped to the window."""
        copy_action = Gio.SimpleAction.new("copy_terminal", None)
        copy_action.connect("activate", self._on_terminal_copy)
        self.add_action(copy_action)

        paste_action = Gio.SimpleAction.new("paste_terminal", None)
        paste_action.connect("activate", self._on_terminal_paste)
        self.add_action(paste_action)

    # Page Creation Methods
    def _create_welcome_page(self):
        # Use the icon_name property to display the application icon prominently
        page = Adw.StatusPage(
            icon_name="grub-icon"
        )
        
        content_box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL, 
            spacing=12, 
            halign=Gtk.Align.CENTER, 
            valign=Gtk.Align.CENTER,
            margin_top=24  # Add space between icon and text
        )
        
        description_label = Gtk.Label(use_markup=True, justify=Gtk.Justification.CENTER, wrap=True, max_width_chars=60)
        description_label.set_markup(
            f"<span font='12'>{_('This tool should be used in {mode_name} to restore the BOOT of the BigLinux installed on the HD or SSD.').format(mode_name='<b>LIVE MODE</b>')}</span>"
            f"\n\n<span font='12' foreground='red' weight='bold'>{_('If the installed system is booting correctly, there are no boot problems, so it\'s better not to proceed with this tool.')}</span>"
            f"\n<span font='10' foreground='gray'>{_('It may also work with other Linux distributions.')}</span>"
        )
        content_box.append(description_label)

        start_button = Gtk.Button(label=_("Start Detection"), css_classes=["suggested-action", "pill"], margin_top=12, halign=Gtk.Align.CENTER)
        start_button.connect("clicked", self._on_start_detection)
        content_box.append(start_button)

        page.set_child(content_box)
        return page

    def _create_detection_page(self):
        page = Adw.StatusPage(
            title=_("Detecting Systems"),
            description=_("Scanning your drives for Linux installations..."),
            icon_name="system-search-symbolic"
        )
        spinner = Gtk.Spinner(spinning=True, width_request=48, height_request=48)
        page.set_child(spinner)
        return page

    def _create_selection_page(self):
        page_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12, margin_top=12, margin_bottom=12, margin_start=12, margin_end=12)
        
        self.guidance_label = Gtk.Label(
            justify=Gtk.Justification.CENTER, wrap=True, css_classes=["dim-label"], margin_bottom=12
        )
        page_box.append(self.guidance_label)
        
        self.selection_page_widget = Adw.PreferencesPage()
        scrolled_window = Gtk.ScrolledWindow(child=self.selection_page_widget, vexpand=True)
        
        self.systems_group = Adw.PreferencesGroup(title=_("1. Select Linux System to Restore"))
        self.selection_page_widget.add(self.systems_group)
        
        self.efi_group = Adw.PreferencesGroup(title=_("2. Select Target EFI Partition"))
        self.legacy_group = Adw.PreferencesGroup(title=_("2. Select Target Disk (MBR)"))
        
        self.selection_page_widget.add(self.efi_group)
        self.selection_page_widget.add(self.legacy_group)

        self.continue_button = Gtk.Button(
            label=_("Continue"), sensitive=False, css_classes=["suggested-action", "pill"], 
            halign=Gtk.Align.CENTER, margin_bottom=12, margin_top=6
        )
        self.continue_button.connect("clicked", self._on_selection_continue)
        
        page_box.append(scrolled_window)
        page_box.append(self.continue_button)
        return page_box

    def _create_restore_page(self):
        self.restore_page_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        
        self.restore_content_flipper = Adw.ViewStack()
        
        options_view = self._create_restore_options_view()
        self.restore_content_flipper.add_named(options_view, "options")
        
        progress_view = self._create_restore_progress_view()
        self.restore_content_flipper.add_named(progress_view, "progress")
        
        self.restore_page_box.append(self.restore_content_flipper)
        return self.restore_page_box

    def _create_restore_options_view(self):
        scrolled_window = Gtk.ScrolledWindow(vexpand=True)
        clamp = Adw.Clamp(maximum_size=800)
        scrolled_window.set_child(clamp)
        
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=18, margin_top=24, margin_bottom=24, margin_start=12, margin_end=12)
        clamp.set_child(box)
        
        restore_guidance = Gtk.Label(
            label=_("If you are unsure, try the 'Simple Restore' first. If the problem persists after restarting, then try the other options."),
            justify=Gtk.Justification.CENTER, wrap=True, margin_bottom=6
        )

        restore_group = Adw.PreferencesGroup(title=_("Restore Methods"))
        interactive_group = Adw.PreferencesGroup(title=_("Interactive Tools"))
        self.summary_group = Adw.PreferencesGroup(title=_("Configuration Summary"))

        box.append(restore_guidance)
        box.append(restore_group)
        box.append(interactive_group)
        box.append(self.summary_group)

        modes = {
            1: (_("Simple Restore"), _("Rewrites GRUB to the boot sector."), "emblem-ok-symbolic", restore_group, True),
            2: (_("Intermediate Restore"), _("Reinstalls GRUB package and regenerates configs."), "view-refresh-symbolic", restore_group, False),
            3: (_("Complete Restore"), _("Updates system, kernel, and performs intermediate restore."), "software-update-available-symbolic", restore_group, False),
            4: (_("Interactive Terminal"), _("Opens a terminal inside the selected system."), "utilities-terminal-symbolic", interactive_group, True),
            5: (_("Control Center"), _("Opens the control center inside the selected system."), "preferences-system-symbolic", interactive_group, True),
            6: (_("Package Manager"), _("Opens the package manager inside the selected system."), "system-software-install-symbolic", interactive_group, True),
        }
        
        self.restore_buttons = {}
        for mode, (title, subtitle, icon, group, net_independent) in modes.items():
            row = Adw.ActionRow(title=title, subtitle=subtitle, icon_name=icon)
            row.set_activatable(False)
            
            button = Gtk.Button(label=_("Execute"), valign=Gtk.Align.CENTER)
            button.connect("clicked", self._on_execute_restore, mode)

            row.add_suffix(button)
            row.set_activatable_widget(button)
            group.add(row)
            self.restore_buttons[mode] = (button, net_independent)
            self.restore_rows[mode] = row
            
        return scrolled_window

    def _create_restore_progress_view(self):
        progress_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12, margin_top=24, margin_bottom=24, margin_start=24, margin_end=24)
        
        self.progress_title_label = Gtk.Label(halign=Gtk.Align.CENTER)
        self.progress_title_label.get_style_context().add_class("title-2")
        progress_box.append(self.progress_title_label)
        
        self.progress_spinner = Gtk.Spinner(spinning=True, width_request=32, height_request=32, halign=Gtk.Align.CENTER)
        progress_box.append(self.progress_spinner)
        
        if VTE_AVAILABLE:
            self.terminal = Vte.Terminal(
                scroll_on_output=True, font_desc=Pango.FontDescription("Monospace 13"), vexpand=True
            )
            self._setup_terminal_context_menu()
            scrolled_term = Gtk.ScrolledWindow(child=self.terminal, min_content_height=250)
            progress_box.append(scrolled_term)
        else:
            self.terminal = None
            progress_box.append(Gtk.Label(label=_("VTE terminal widget not available.")))

        # Box for interactive session controls
        self.interactive_finish_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12, halign=Gtk.Align.CENTER, visible=False, margin_top=12)
        close_session_button = Gtk.Button(label=_("Close Terminal"), css_classes=["pill", "destructive-action"])
        close_session_button.connect("clicked", self._on_close_interactive_session)
        self.interactive_finish_box.append(close_session_button)
        progress_box.append(self.interactive_finish_box)

        # Box for non-interactive completion controls
        self.completion_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12, halign=Gtk.Align.CENTER, visible=False, margin_top=12)
        self.completion_status_label = Gtk.Label(wrap=True)
        
        completion_button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12, halign=Gtk.Align.CENTER)
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", self._on_result_go_back)
        close_button = Gtk.Button(label=_("Close"), css_classes=["pill", "destructive-action"])
        close_button.connect("clicked", lambda w: self.get_application().quit())
        completion_button_box.append(back_button)
        completion_button_box.append(close_button)
        
        self.completion_box.append(self.completion_status_label)
        self.completion_box.append(completion_button_box)
        progress_box.append(self.completion_box)

        return progress_box

    def _get_result_messages(self, mode, error_msg=None):
        if error_msg: return {"title": _("Operation Failed!"), "description": error_msg}
        titles = {1: _("Simple Restore Completed"), 2: _("Intermediate Restore Completed"), 3: _("Complete Restore Completed")}
        descriptions = {
            1: _("The GRUB bootloader has been rewritten. You can now restart your computer."),
            2: _("The GRUB package was reinstalled and configurations were regenerated."),
            3: _("The system, kernel, and GRUB have been updated and restored."),
        }
        return {"title": titles.get(mode, _("Operation Completed Successfully!")), "description": descriptions.get(mode, _("You can now close this tool and restart your computer."))}

    def _create_mismatch_warning_page(self, title, message):
        """Creates a warning page for boot mode mismatches."""
        status_page = Adw.StatusPage(title=title, description=message, icon_name="dialog-warning-symbolic")
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12, halign=Gtk.Align.CENTER)
        
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", lambda w: self.view_stack.set_visible_child_name("welcome"))
        
        proceed_button = Gtk.Button(label=_("Proceed Anyway"), css_classes=["pill", "destructive-action"])
        proceed_button.connect("clicked", self._on_proceed_with_mismatch)
        
        button_box.append(back_button)
        button_box.append(proceed_button)
        status_page.set_child(button_box)
        return status_page

    def _setup_terminal_context_menu(self):
        if not self.terminal: return
        menu_model = Gio.Menu()
        menu_model.append(_("Copy"), "win.copy_terminal")
        menu_model.append(_("Paste"), "win.paste_terminal")
        self.terminal_menu = Gtk.PopoverMenu.new_from_model(menu_model)
        self.terminal_menu.set_parent(self.terminal)
        click_controller = Gtk.GestureClick.new()
        click_controller.set_button(Gdk.BUTTON_SECONDARY)
        click_controller.connect("pressed", self._on_terminal_right_click)
        self.terminal.add_controller(click_controller)

    def _on_terminal_right_click(self, controller, n_press, x, y):
        self.lookup_action("copy_terminal").set_enabled(self.terminal.get_has_selection())
        self.terminal_menu.popup()

    def _on_terminal_copy(self, action, param):
        if self.terminal: self.terminal.copy_clipboard_format(Vte.Format.TEXT)

    def _on_terminal_paste(self, action, param):
        if self.terminal: self.terminal.paste_clipboard()

    # Event Handlers & Logic
    def _on_start_detection(self, button):
        self.mismatch_warning_shown = False
        self.view_stack.set_visible_child_name("detection")
        threading.Thread(target=self._run_detection_thread, daemon=True).start()

    def _run_detection_thread(self):
        try:
            self.system_interface.detect_systems()
            GLib.idle_add(self._populate_selection_page)
        except Exception as e:
            GLib.idle_add(self._show_error, _("Detection Failed"), str(e))

    def _populate_selection_page(self):
        if not self.mismatch_warning_shown:
            is_mismatch = False
            title, message = "", ""
            
            if self.system_interface.boot_mode == "EFI" and not self.system_interface.efi_partitions:
                is_mismatch = True
                title = _("Potential Boot Mode Mismatch")
                message = _("The boot in live mode is using EFI mode, but no EFI partition was found on this computer, most likely the Grub restore will not work.\n\nTry restarting and booting in Legacy or BIOS mode through the computer's BIOS.\n\nDo you want to try even with a low probability of success?")
            
            elif self.system_interface.boot_mode == "LEGACY" and self.system_interface.efi_partitions:
                is_mismatch = True
                title = _("Potential Boot Mode Mismatch")
                message = _("The boot in live mode is using Legacy mode, also called BIOS, but at least one EFI partition was found on this computer, most likely the Grub restore will not work.\n\nTry restarting and booting in EFI mode through the computer's BIOS.\n\nDo you want to try even with a low probability of success?")

            if is_mismatch:
                self._show_mismatch_warning(title, message)
                return

        for row in self.system_rows: self.systems_group.remove(row)
        for row in self.efi_rows: self.efi_group.remove(row)
        for row in self.legacy_rows: self.legacy_group.remove(row)
        self.system_rows.clear()
        self.efi_rows.clear()
        self.legacy_rows.clear()

        self.system_check_buttons.clear()
        self.boot_target_check_buttons.clear()
        self.legacy_boot_target_check_buttons.clear()
        
        self.selected_efi_partition = None
        self.selected_disk = None

        if not self.system_interface.detected_systems:
            self._show_error(_("No Systems Found"), _("No Linux installations could be detected on your drives."))
            return

        is_single_system = len(self.system_interface.detected_systems) == 1
        
        for i, system in enumerate(self.system_interface.detected_systems):
            row = Adw.ActionRow(title=system['name'], subtitle=f"{_('Partition:')} {system['partition']} | {_('FS:')} {system.get('filesystem', 'N/A')} | {_('UUID:')} {system.get('uuid', 'N/A')}")
            if is_single_system:
                self.selected_system = self.system_interface.detected_systems[0]
                row.add_suffix(Gtk.Image(icon_name="emblem-ok-symbolic", visible=True))
            else:
                check = Gtk.CheckButton(css_classes=["radio"])
                if self.system_check_buttons: check.set_group(self.system_check_buttons[0])
                check.connect("toggled", self._on_system_toggled, i)
                self.system_check_buttons.append(check)
                row.add_suffix(check)
                row.set_activatable_widget(check)
            self.systems_group.add(row)
            self.system_rows.append(row)

        boot_mode = self.system_interface.boot_mode
        
        self.efi_group.set_visible(boot_mode == "EFI")
        self.legacy_group.set_visible(boot_mode == "LEGACY")

        if boot_mode == "EFI" and self.system_interface.efi_partitions:
            is_single_efi = len(self.system_interface.efi_partitions) == 1
            for i, part in enumerate(self.system_interface.efi_partitions):
                row = Adw.ActionRow(title=part, subtitle=_("EFI System Partition"))
                if is_single_efi:
                    self.selected_efi_partition = self.system_interface.efi_partitions[0]
                    row.add_suffix(Gtk.Image(icon_name="emblem-ok-symbolic", visible=True))
                else:
                    check = Gtk.CheckButton(css_classes=["radio"])
                    if self.boot_target_check_buttons: check.set_group(self.boot_target_check_buttons[0])
                    check.connect("toggled", lambda btn, index=i: self._on_boot_target_toggled(btn, index, is_efi=True))
                    self.boot_target_check_buttons.append(check)
                    row.add_suffix(check)
                    row.set_activatable_widget(check)
                self.efi_group.add(row)
                self.efi_rows.append(row)

        if boot_mode == "LEGACY" and self.system_interface.grub_disks:
            is_single_legacy = len(self.system_interface.grub_disks) == 1
            for i, disk in enumerate(self.system_interface.grub_disks):
                row = Adw.ActionRow(title=f"/dev/{disk['device']} ({disk['size']})", subtitle=f"{_('Model:')} {disk['name'].replace('_', ' ')} | {_('Partition Table:')} {disk['table'].upper()}")
                if is_single_legacy:
                    self.selected_disk = self.system_interface.grub_disks[0]['device']
                    row.add_suffix(Gtk.Image(icon_name="emblem-ok-symbolic", visible=True))
                else:
                    check = Gtk.CheckButton(css_classes=["radio"])
                    if self.legacy_boot_target_check_buttons: check.set_group(self.legacy_boot_target_check_buttons[0])
                    check.connect("toggled", lambda btn, index=i: self._on_boot_target_toggled(btn, index, is_efi=False))
                    self.legacy_boot_target_check_buttons.append(check)
                    row.add_suffix(check)
                    row.set_activatable_widget(check)
                self.legacy_group.add(row)
                self.legacy_rows.append(row)

        self.view_stack.set_visible_child_name("selection")
        self._check_selection_completeness()

    def _check_selection_completeness(self):
        system_ok = self.selected_system is not None
        boot_target_ok = (self.selected_efi_partition is not None) or (self.selected_disk is not None)
        self.continue_button.set_sensitive(system_ok and boot_target_ok)

    def _on_system_toggled(self, check_button, index):
        if check_button.get_active():
            self.selected_system = self.system_interface.detected_systems[index]
        self._check_selection_completeness()

    def _on_boot_target_toggled(self, check_button, index, *, is_efi):
        if check_button.get_active():
            if is_efi:
                self.selected_efi_partition = self.system_interface.efi_partitions[index]
                self.selected_disk = None
                for btn in self.legacy_boot_target_check_buttons:
                    if btn.get_active(): btn.set_active(False)
            else: # Legacy
                self.selected_disk = self.system_interface.grub_disks[index]['device']
                self.selected_efi_partition = None
                for btn in self.boot_target_check_buttons:
                    if btn.get_active(): btn.set_active(False)
        else:
            if is_efi: self.selected_efi_partition = None
            else: self.selected_disk = None
        self._check_selection_completeness()

    def _on_selection_continue(self, button):
        effective_boot_mode = "EFI" if self.selected_efi_partition else "LEGACY"
        self.system_interface.save_selection(self.selected_system, self.selected_efi_partition, self.selected_disk, effective_boot_mode)
        
        # Mount the selected system to check for available tools
        result = self.system_interface.prepare_chroot()
        if result.returncode != 0:
            error_msg = f"{_('Failed to mount the selected system for verification:')}\n{result.stderr}"
            self._show_error(_("Mount Failed"), error_msg)
            return

        # Check for the existence of specific applications in the mounted system
        show_control_center = os.path.exists("/mnt/usr/bin/bigcontrolcenter")
        show_pamac = os.path.exists("/mnt/usr/bin/pamac-manager")

        self._prepare_restore_page(show_control_center, show_pamac)
        self.view_stack.set_visible_child_name("restore")

    def _prepare_restore_page(self, show_control_center, show_pamac):
        children_to_remove = [child for child in Gtk.Widget.observe_children(self.summary_group)]
        for child in children_to_remove:
            self.summary_group.remove(child)

        summary = self.system_interface.get_system_summary(self.selected_system, self.selected_efi_partition, self.selected_disk)
        
        rows_data = [
            (f"Live {_('Boot Mode')}", summary['boot_mode']),
            (_("Selected System"), summary['system']['name']),
            (_("Selected Partition"), f"{summary['system']['partition']} ({summary['system']['filesystem']})"),
            (_("Partition UUID"), summary['system']['uuid']),
        ]

        if 'efi_partition' in summary:
            rows_data.append((_("Target (EFI Restore)"), summary['efi_partition']))
        if 'disk' in summary:
            disk_info = summary['disk']
            rows_data.append((_("Target (Legacy Restore)"), f"/dev/{disk_info['device']}"))
            rows_data.append((_("Disk Details"), f"{disk_info['size']} | {disk_info['name'].replace('_', ' ')} | {disk_info['table'].upper()}"))

        for title, subtitle in rows_data:
            row = Adw.ActionRow(title=title, subtitle=subtitle)
            row.set_activatable(False)
            self.summary_group.add(row)
        
        # Set visibility of interactive tool rows based on file checks
        if 5 in self.restore_rows:
            self.restore_rows[5].set_visible(show_control_center)
        if 6 in self.restore_rows:
            self.restore_rows[6].set_visible(show_pamac)
        
        is_connected = self.system_interface.check_network_connection()
        if not is_connected:
            dialog = Adw.MessageDialog(
                parent=self,
                heading=_("No Internet Connection Detected"),
                body=_("Intermediate and Complete restore options require an internet connection to download packages. These options may fail if your computer is offline.")
            )
            dialog.add_response("ok", _("OK"))
            dialog.present()

    def _on_execute_restore(self, button, mode):
        self.current_mode = mode
        self.restore_content_flipper.set_visible_child_name("progress")
        self.completion_box.set_visible(False)
        self.interactive_finish_box.set_visible(False)
        self.progress_spinner.start()
        if self.terminal: self.terminal.feed(b'\033c')

        if mode in [1, 2, 3]:
            self.progress_title_label.set_text(_("Restore in Progress..."))
            self.progress_title_label.set_visible(True)
            threading.Thread(target=self._run_restore_thread, args=(mode,), daemon=True).start()
        else:
            self.progress_title_label.set_text(_("Preparing Interactive Session..."))
            self.progress_title_label.set_visible(True)
            threading.Thread(target=self._run_interactive_session, args=(mode,), daemon=True).start()

    def _on_close_interactive_session(self, button):
        if self.terminal: self.terminal.feed_child(b'exit\n')

    def _run_restore_thread(self, mode):
        try:
            self.current_process = self.system_interface.execute_restore(mode)
            for line in iter(self.current_process.stdout.readline, ''):
                if self.terminal: GLib.idle_add(self.terminal.feed, f"{line.strip()}\r\n".encode('utf-8'))
            self.current_process.wait()
            GLib.idle_add(self._on_restore_finished, self.current_process.returncode == 0)
        except Exception as e:
            GLib.idle_add(self._on_restore_finished, False, str(e))

    def _run_interactive_session(self, mode):
        result = self.system_interface.prepare_chroot()
        if result.returncode != 0:
            GLib.idle_add(self._on_restore_finished, False, f"Failed to prepare chroot:\n{result.stderr}")
            return
        
        if mode == 6:
            try:
                lock_file_path = "/mnt/var/lib/pacman/db.lck"
                if os.path.exists(lock_file_path): os.remove(lock_file_path)
            except OSError as e:
                GLib.idle_add(self._on_restore_finished, False, f"Failed to remove pacman lock: {e}")
                return
        GLib.idle_add(self._spawn_interactive_in_vte, mode)

    def _spawn_interactive_in_vte(self, mode):
        if not self.terminal:
            self._on_restore_finished(False, "VTE Terminal not available.")
            return

        cmd_map = {4: ["bash"], 5: ["bash", "-c", "bigcontrolcenter"], 6: ["bash", "-c", "pamac-manager"]}
        cmd = cmd_map.get(mode)
        if not cmd: return
        full_cmd = ["manjaro-chroot", "/mnt"] + cmd

        # Set a more descriptive title or hide it completely
        title_map = {
            5: _("Interactive Session: Control Center"),
            6: _("Interactive Session: Package Manager"),
        }
        
        if mode in title_map:
            self.progress_title_label.set_text(title_map[mode])
            self.progress_title_label.set_visible(True)
        elif mode == 4:
            # For the terminal, hide the title to maximize vertical space
            self.progress_title_label.set_visible(False)
        
        self.progress_spinner.stop()
        
        # Only show the "Close Terminal" button for the actual terminal session
        if mode == 4:
            self.interactive_finish_box.set_visible(True)
        
        try:
            self.terminal.spawn_sync(Vte.PtyFlags.DEFAULT, None, full_cmd, [], GLib.SpawnFlags.DEFAULT, None, None)
            self.terminal.connect("child-exited", self._on_interactive_child_exited)
        except Exception as e:
            self._on_restore_finished(False, str(e))

    def _on_interactive_child_exited(self, terminal, status):
        self.interactive_finish_box.set_visible(False)
        # Make sure the title is visible again for the cleanup message
        self.progress_title_label.set_visible(True)
        GLib.idle_add(self.progress_title_label.set_text, _("Cleaning up session..."))
        threading.Thread(target=self._run_cleanup_thread, args=(status,), daemon=True).start()

    def _run_cleanup_thread(self, exit_status):
        result = self.system_interface.cleanup_chroot()
        success = (exit_status == 0 and result.returncode == 0)
        error_msg = result.stderr if result.returncode != 0 else None
        GLib.idle_add(self._on_restore_finished, success, error_msg)

    def _on_restore_finished(self, success, error_msg=None):
        self.progress_spinner.stop()
        
        # Interactive sessions still go back to the options page on success
        if self.current_mode in [4, 5, 6] and success:
            self._on_result_go_back(None)
            return

        # For non-interactive restores, update the current page instead of switching
        messages = self._get_result_messages(self.current_mode, error_msg)
        self.progress_title_label.set_text(messages["title"])
        self.progress_title_label.set_visible(True)
        self.completion_status_label.set_text(messages["description"])
        
        # Add error class for visual feedback on failure
        if success:
            self.completion_status_label.remove_css_class("error")
        else:
            self.completion_status_label.add_css_class("error")

        self.completion_box.set_visible(True)

    def _on_result_go_back(self, button):
        self.restore_content_flipper.set_visible_child_name("options")

    def _show_error(self, title, message):
        error_page = Adw.StatusPage(title=title, description=message, icon_name="dialog-error-symbolic")
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", lambda w: self.view_stack.set_visible_child_name("welcome"))
        error_page.set_child(back_button)
        
        if self.view_stack.get_child_by_name("error_page"):
            self.view_stack.remove(self.view_stack.get_child_by_name("error_page"))
            
        self.view_stack.add_named(error_page, "error_page")
        self.view_stack.set_visible_child_name("error_page")

    def _show_mismatch_warning(self, title, message):
        """Displays the boot mode mismatch warning page."""
        warning_page_name = "mismatch_warning"
        if self.view_stack.get_child_by_name(warning_page_name):
            self.view_stack.remove(self.view_stack.get_child_by_name(warning_page_name))
        
        warning_page = self._create_mismatch_warning_page(title, message)
        self.view_stack.add_named(warning_page, warning_page_name)
        self.view_stack.set_visible_child_name(warning_page_name)

    def _on_proceed_with_mismatch(self, button):
        """Handles the user's choice to proceed despite the mismatch warning."""
        self.mismatch_warning_shown = True
        self._populate_selection_page()
