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
        
        self.set_title(_("BigLinux GRUB Restore"))
        self.set_default_size(1080, 660)
        
        self.system_interface = SystemInterface()
        self.selected_system = None
        self.selected_efi_partition = None
        self.selected_disk = None
        self.current_process = None
        self.current_mode = None

        self.system_check_buttons = []
        self.boot_target_check_buttons = []

        self._build_ui()
        self._create_window_actions()

    def _build_ui(self):
        """Build the main UI structure with a ViewStack."""
        self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.set_content(self.main_box)

        self.header_bar = Adw.HeaderBar()
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
        page = Adw.StatusPage(
            title=_("GRUB Restore Tool")
        )
        
        content_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12, halign=Gtk.Align.CENTER, valign=Gtk.Align.CENTER)
        
        description_label = Gtk.Label(use_markup=True, justify=Gtk.Justification.CENTER, wrap=True, max_width_chars=50)
        description_label.set_markup(
            _("This tool helps restore the bootloader (GRUB) for your installed Linux systems. It should be run from a live session.") +
            "\n\n<b>" + _("Warning: Only use this tool if your installed system is failing to boot. If your system starts normally, do not proceed.") + "</b>"
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
        
        selection_page = Adw.PreferencesPage()
        scrolled_window = Gtk.ScrolledWindow(child=selection_page, vexpand=True)
        
        self.systems_group = Adw.PreferencesGroup(title=_("1. Select Linux System to Restore"))
        selection_page.add(self.systems_group)
        
        self.boot_specific_group = Adw.PreferencesGroup()
        selection_page.add(self.boot_specific_group)

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
        clamp = Adw.Clamp(maximum_size=800)
        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=18, margin_top=24, margin_bottom=24, margin_start=12, margin_end=12)
        clamp.set_child(box)
        
        self.summary_label = Gtk.Label(halign=Gtk.Align.CENTER, justify=Gtk.Justification.CENTER, wrap=True)
        self.summary_label.get_style_context().add_class("title-4")
        box.append(self.summary_label)
        
        self.network_status_label = Gtk.Label(halign=Gtk.Align.CENTER)
        box.append(self.network_status_label)
        
        restore_guidance = Gtk.Label(
            label=_("If you are unsure, try the 'Simple Restore' first. If the problem persists after restarting, then try the other options."),
            justify=Gtk.Justification.CENTER, wrap=True, margin_bottom=6
        )
        box.append(restore_guidance)

        restore_group = Adw.PreferencesGroup(title=_("Restore Methods"))
        interactive_group = Adw.PreferencesGroup(title=_("Interactive Tools"))
        box.append(restore_group)
        box.append(interactive_group)

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
            
            button = Gtk.Button(label=_("Execute"))
            button.connect("clicked", self._on_execute_restore, mode)

            row.add_suffix(button)
            row.set_activatable_widget(button)
            group.add(row)
            self.restore_buttons[mode] = (button, net_independent)
            
        return clamp

    def _create_restore_progress_view(self):
        self.progress_flipper = Adw.ViewStack()

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
            scrolled_term = Gtk.ScrolledWindow(child=self.terminal, min_content_height=300)
            progress_box.append(scrolled_term)
        else:
            self.terminal = None
            progress_box.append(Gtk.Label(label=_("VTE terminal widget not available.")))

        self.interactive_finish_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12, halign=Gtk.Align.CENTER, visible=False, margin_top=12)
        close_session_button = Gtk.Button(label=_("Close Terminal"), css_classes=["pill", "destructive-action"])
        close_session_button.connect("clicked", self._on_close_interactive_session)
        self.interactive_finish_box.append(close_session_button)
        progress_box.append(self.interactive_finish_box)

        self.progress_flipper.add_named(progress_box, "progress")
        return self.progress_flipper

    def _get_result_messages(self, mode, error_msg=None):
        if error_msg: return {"title": _("Operation Failed!"), "description": error_msg}
        titles = {1: _("Simple Restore Completed"), 2: _("Intermediate Restore Completed"), 3: _("Complete Restore Completed")}
        descriptions = {
            1: _("The GRUB bootloader has been rewritten. You can now restart your computer."),
            2: _("The GRUB package was reinstalled and configurations were regenerated."),
            3: _("The system, kernel, and GRUB have been updated and restored."),
        }
        return {"title": titles.get(mode, _("Operation Completed Successfully!")), "description": descriptions.get(mode, _("You can now close this tool and restart your computer."))}

    def _create_result_page(self, success, title, description):
        status_page = Adw.StatusPage(title=title, description=description, icon_name="emblem-ok-symbolic" if success else "dialog-error-symbolic")
        button_box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=12, halign=Gtk.Align.CENTER)
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", self._on_result_go_back)
        close_button = Gtk.Button(label=_("Close"), css_classes=["pill", "suggested-action" if success else "destructive-action"])
        close_button.connect("clicked", lambda w: self.get_application().quit())
        button_box.append(back_button)
        button_box.append(close_button)
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
        self.view_stack.set_visible_child_name("detection")
        threading.Thread(target=self._run_detection_thread, daemon=True).start()

    def _run_detection_thread(self):
        try:
            self.system_interface.detect_systems()
            GLib.idle_add(self._populate_selection_page)
        except Exception as e:
            GLib.idle_add(self._show_error, _("Detection Failed"), str(e))

    def _populate_selection_page(self):
        for check_button in self.system_check_buttons:
            row = check_button.get_ancestor(Adw.ActionRow)
            if row: self.systems_group.remove(row)
        
        for check_button in self.boot_target_check_buttons:
            row = check_button.get_ancestor(Adw.ActionRow)
            if row: self.boot_specific_group.remove(row)

        self.system_check_buttons.clear()
        self.boot_target_check_buttons.clear()

        if not self.system_interface.detected_systems:
            self._show_error(_("No Systems Found"), _("No Linux installations could be detected on your drives."))
            return

        if self.system_interface.boot_mode == "EFI" and not self.system_interface.efi_partitions:
            self._show_error(
                _("Boot Mode Mismatch"),
                _("The live session is running in EFI mode, but no EFI partition was found on your drives. Restoration is likely to fail.\n\nPlease restart your computer and ensure you are booting in Legacy/BIOS mode.")
            )
            return
        
        if self.system_interface.boot_mode == "LEGACY" and self.system_interface.efi_partitions:
            self._show_error(
                _("Boot Mode Mismatch"),
                _("The live session is running in Legacy/BIOS mode, but an EFI partition was detected. Restoration is likely to fail.\n\nPlease restart your computer and ensure you are booting in EFI mode.")
            )
            return

        is_single_system = len(self.system_interface.detected_systems) == 1
        is_single_boot_target = (len(self.system_interface.efi_partitions) == 1 if self.system_interface.boot_mode == "EFI"
                                 else len(self.system_interface.grub_disks) == 1)

        self.boot_specific_group.set_sensitive(True)

        if is_single_system and is_single_boot_target:
            self.guidance_label.set_label(_("The following system was detected. Press Continue to proceed with the restoration."))

            system = self.system_interface.detected_systems[0]
            self.selected_system = system
            row = Adw.ActionRow(title=system['name'], subtitle=f"{_('Partition:')} {system['partition']} | {_('Filesystem:')} {system.get('filesystem', 'N/A')}")
            row.set_activatable(False)
            self.systems_group.add(row)
            
            if self.system_interface.boot_mode == "EFI":
                part = self.system_interface.efi_partitions[0]
                self.selected_efi_partition = part
                self.boot_specific_group.set_title(_("2. Target EFI Partition"))
                row = Adw.ActionRow(title=part, subtitle=_("EFI System Partition"))
            else: # LEGACY
                disk = self.system_interface.grub_disks[0]
                self.selected_disk = disk['device']
                self.boot_specific_group.set_title(_("2. Target Disk (MBR)"))
                row = Adw.ActionRow(title=f"/dev/{disk['device']} ({disk['size']})", subtitle=f"{_('Model:')} {disk['name'].replace('_', ' ')} | {_('Partition Table:')} {disk['table'].upper()}")
            row.set_activatable(False)
            self.boot_specific_group.add(row)

        else:
            self.guidance_label.set_label(_("Select the Linux installation you want to repair and the corresponding boot partition or disk."))

            for i, system in enumerate(self.system_interface.detected_systems):
                row = Adw.ActionRow(title=system['name'], subtitle=f"{_('Partition:')} {system['partition']} | {_('Filesystem:')} {system.get('filesystem', 'N/A')}")
                check = Gtk.CheckButton(css_classes=["radio"])
                if self.system_check_buttons: check.set_group(self.system_check_buttons[0])
                check.connect("toggled", self._on_system_toggled, i)
                self.system_check_buttons.append(check)
                row.add_suffix(check)
                row.set_activatable_widget(check)
                self.systems_group.add(row)

            if self.system_interface.boot_mode == "EFI":
                self.boot_specific_group.set_title(_("2. Select Target EFI Partition"))
                for i, part in enumerate(self.system_interface.efi_partitions):
                    row = Adw.ActionRow(title=part, subtitle=_("EFI System Partition"))
                    check = Gtk.CheckButton(css_classes=["radio"])
                    if self.boot_target_check_buttons: check.set_group(self.boot_target_check_buttons[0])
                    check.connect("toggled", self._on_boot_target_toggled, i)
                    self.boot_target_check_buttons.append(check)
                    row.add_suffix(check)
                    row.set_activatable_widget(check)
                    self.boot_specific_group.add(row)
            else: # LEGACY
                self.boot_specific_group.set_title(_("2. Target Disk (MBR)"))
                for i, disk in enumerate(self.system_interface.grub_disks):
                    row = Adw.ActionRow(title=f"/dev/{disk['device']} ({disk['size']})", subtitle=f"{_('Model:')} {disk['name'].replace('_', ' ')} | {_('Partition Table:')} {disk['table'].upper()}")
                    check = Gtk.CheckButton(css_classes=["radio"])
                    if self.boot_target_check_buttons: check.set_group(self.boot_target_check_buttons[0])
                    check.connect("toggled", self._on_boot_target_toggled, i)
                    self.boot_target_check_buttons.append(check)
                    row.add_suffix(check)
                    row.set_activatable_widget(check)
                    self.boot_specific_group.add(row)

            if len(self.system_check_buttons) == 1:
                self.system_check_buttons[0].set_active(True)
            if len(self.boot_target_check_buttons) == 1:
                self.boot_target_check_buttons[0].set_active(True)

        self.view_stack.set_visible_child_name("selection")
        self._check_selection_completeness()

    def _check_selection_completeness(self):
        system_ok = self.selected_system is not None
        boot_target_ok = (self.selected_efi_partition is not None) if self.system_interface.boot_mode == "EFI" else (self.selected_disk is not None)
        self.continue_button.set_sensitive(system_ok and boot_target_ok)

    def _on_system_toggled(self, check_button, index):
        if check_button.get_active():
            self.selected_system = self.system_interface.detected_systems[index]
            self.boot_specific_group.set_sensitive(True)
        else:
            self.selected_system = None
            self.boot_specific_group.set_sensitive(False)
            for btn in self.boot_target_check_buttons:
                if btn.get_active():
                    btn.set_active(False)
                    break
        
        self._check_selection_completeness()

    def _on_boot_target_toggled(self, check_button, index):
        if not check_button.get_active():
            self.selected_efi_partition = None
            self.selected_disk = None
        elif self.system_interface.boot_mode == "EFI":
            self.selected_efi_partition = self.system_interface.efi_partitions[index]
            self.selected_disk = None
        else: # LEGACY
            self.selected_disk = self.system_interface.grub_disks[index]['device']
            self.selected_efi_partition = None
        
        self._check_selection_completeness()

    def _on_selection_continue(self, button):
        self.system_interface.save_selection(self.selected_system, self.selected_efi_partition, self.selected_disk)
        self._prepare_restore_page()
        self.view_stack.set_visible_child_name("restore")

    def _prepare_restore_page(self):
        summary = self.system_interface.get_system_summary(self.selected_system, self.selected_efi_partition, self.selected_disk)
        summary_text = f"<b>{_('System to Restore:')}</b> {summary['system']['name']} on {summary['system']['partition']}\n"
        summary_text += f"<b>{_('Boot Mode:')}</b> {summary['boot_mode']}\n"
        if 'efi_partition' in summary: summary_text += f"<b>{_('Target EFI Partition:')}</b> {summary['efi_partition']}"
        if 'disk' in summary: summary_text += f"<b>{_('Target Disk (MBR):')}</b> /dev/{summary['disk']['device']}"
        self.summary_label.set_markup(summary_text)
        
        is_connected = self.system_interface.check_network_connection()
        net_markup = f"<span foreground='green'>{_('Internet connection available.')}</span>" if is_connected else f"<span foreground='orange'>{_('No internet. Some options will be disabled.')}</span>"
        self.network_status_label.set_markup(net_markup)
        
        for mode, (button, net_independent) in self.restore_buttons.items():
            button.set_sensitive(net_independent or is_connected)

    def _on_execute_restore(self, button, mode):
        self.current_mode = mode
        self.restore_content_flipper.set_visible_child_name("progress")
        self.progress_flipper.set_visible_child_name("progress")
        self.progress_spinner.start()
        if self.terminal: self.terminal.feed(b'\033c')

        if mode in [1, 2, 3]:
            self.progress_title_label.set_text(_("Restore in Progress..."))
            threading.Thread(target=self._run_restore_thread, args=(mode,), daemon=True).start()
        else:
            self.progress_title_label.set_text(_("Preparing Interactive Session..."))
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

        self.progress_title_label.set_text(_("Interactive Session Active"))
        self.progress_spinner.stop()
        if mode == 4: self.interactive_finish_box.set_visible(True)
        
        try:
            self.terminal.spawn_sync(Vte.PtyFlags.DEFAULT, None, full_cmd, [], GLib.SpawnFlags.DEFAULT, None, None)
            self.terminal.connect("child-exited", self._on_interactive_child_exited)
        except Exception as e:
            self._on_restore_finished(False, str(e))

    def _on_interactive_child_exited(self, terminal, status):
        self.interactive_finish_box.set_visible(False)
        GLib.idle_add(self.progress_title_label.set_text, _("Cleaning up session..."))
        threading.Thread(target=self._run_cleanup_thread, args=(status,), daemon=True).start()

    def _run_cleanup_thread(self, exit_status):
        result = self.system_interface.cleanup_chroot()
        success = (exit_status == 0 and result.returncode == 0)
        error_msg = result.stderr if result.returncode != 0 else None
        GLib.idle_add(self._on_restore_finished, success, error_msg)

    def _on_restore_finished(self, success, error_msg=None):
        self.progress_spinner.stop()
        if self.current_mode in [4, 5, 6] and success:
            self._on_result_go_back(None)
            return

        messages = self._get_result_messages(self.current_mode, error_msg)
        if self.progress_flipper.get_child_by_name("result"):
            self.progress_flipper.remove(self.progress_flipper.get_child_by_name("result"))

        result_page = self._create_result_page(success, messages["title"], messages["description"])
        self.progress_flipper.add_named(result_page, "result")
        self.progress_flipper.set_visible_child_name("result")

    def _on_result_go_back(self, button):
        self.restore_content_flipper.set_visible_child_name("options")
        self.progress_flipper.set_visible_child_name("progress")

    def _show_error(self, title, message):
        error_page = Adw.StatusPage(title=title, description=message, icon_name="dialog-error-symbolic")
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", lambda w: self.view_stack.set_visible_child_name("welcome"))
        error_page.set_child(back_button)
        
        if self.view_stack.get_child_by_name("error_page"):
            self.view_stack.remove(self.view_stack.get_child_by_name("error_page"))
            
        self.view_stack.add_named(error_page, "error_page")
        self.view_stack.set_visible_child_name("error_page")
