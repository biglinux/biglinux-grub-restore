#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import gi
import os
import signal
import threading

gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")

try:
    gi.require_version("Vte", "3.91")
    from gi.repository import Vte

    VTE_AVAILABLE = True
except (ImportError, ValueError):
    VTE_AVAILABLE = False

from gi.repository import Gtk, Adw, Gio, Pango, Gdk, GLib  # noqa: E402
from backend.system_interface import SystemInterface  # noqa: E402
from utils.translation import _  # noqa: E402


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
        self.active_efi_candidates = []
        self.restore_log = []
        self.last_restore_error = None
        self.boot_diagnostics = None
        self.cancel_requested = False
        self._shutdown_started = False
        self.interactive_pid = None
        self._quit_after_interactive_exit = False

        self.system_rows = []
        self.efi_rows = []
        self.legacy_rows = []
        self.restore_rows = {}

        self.system_check_buttons = []
        self.boot_target_check_buttons = []
        self.legacy_boot_target_check_buttons = []

        self._build_ui()
        self._create_window_actions()
        self.connect("close-request", self._on_close_request)

    def _build_ui(self):
        """Build the main UI structure with a ViewStack."""
        self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL)
        self.set_content(self.main_box)

        self.header_bar = Adw.HeaderBar()

        # Add application icon to the header bar for clear identification
        app_icon = Gtk.Image(icon_name="biglinux-grub-restore", pixel_size=22)
        self.header_bar.pack_start(app_icon)

        self.main_box.append(self.header_bar)

        self._setup_menu()

        self.view_stack = Adw.ViewStack()
        self.main_box.append(self.view_stack)

        self.view_stack.add_named(self._create_welcome_page(), "welcome")
        self.detection_page = self._create_detection_page()
        self.view_stack.add_named(self.detection_page, "detection")
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

        for name, callback, accelerators in (
            ("zoom_terminal_in", self._on_terminal_zoom_in, ["<primary>plus", "<primary>equal"]),
            ("zoom_terminal_out", self._on_terminal_zoom_out, ["<primary>minus"]),
            ("zoom_terminal_reset", self._on_terminal_zoom_reset, ["<primary>0"]),
        ):
            action = Gio.SimpleAction.new(name, None)
            action.connect("activate", callback)
            self.add_action(action)
            self.get_application().set_accels_for_action(f"win.{name}", accelerators)

    # Page Creation Methods
    def _create_welcome_page(self):
        # Use the icon_name property to display the application icon prominently
        page = Adw.StatusPage(icon_name="biglinux-grub-restore")

        content_box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=12,
            halign=Gtk.Align.CENTER,
            valign=Gtk.Align.CENTER,
            margin_top=24,  # Add space between icon and text
        )

        mode_label = Gtk.Label(label=_("LIVE MODE"), css_classes=["title-3"])
        content_box.append(mode_label)

        description_label = Gtk.Label(
            label=_(
                "Use this tool from a live system to restore the bootloader of an installed Linux system."
            ),
            justify=Gtk.Justification.CENTER,
            wrap=True,
            max_width_chars=60,
        )
        content_box.append(description_label)

        warning_label = Gtk.Label(
            label=_(
                "If the installed system starts correctly, do not continue: no boot repair is necessary."
            ),
            justify=Gtk.Justification.CENTER,
            wrap=True,
            max_width_chars=60,
            css_classes=["error"],
        )
        content_box.append(warning_label)

        compatibility_label = Gtk.Label(
            label=_("Boot repair can also work with other Linux distributions."),
            justify=Gtk.Justification.CENTER,
            wrap=True,
            css_classes=["dim-label"],
        )
        content_box.append(compatibility_label)

        start_button = Gtk.Button(
            label=_("Start Detection"),
            css_classes=["suggested-action", "pill"],
            margin_top=12,
            halign=Gtk.Align.CENTER,
        )
        start_button.connect("clicked", self._on_start_detection)
        content_box.append(start_button)

        page.set_child(content_box)
        return page

    def _create_detection_page(self):
        page = Adw.StatusPage(
            title=_("Detecting Systems"),
            description=_("Scanning your drives for Linux installations..."),
            icon_name="system-search-symbolic",
        )
        spinner = Gtk.Spinner(spinning=True, width_request=48, height_request=48)
        page.set_child(spinner)
        return page

    def _create_selection_page(self):
        page_box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=12,
            margin_top=12,
            margin_bottom=12,
            margin_start=12,
            margin_end=12,
        )

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
            label=_("Continue"),
            sensitive=False,
            css_classes=["suggested-action", "pill"],
            halign=Gtk.Align.CENTER,
            margin_bottom=12,
            margin_top=6,
        )
        self.continue_button.connect("clicked", self._on_selection_continue)

        selection_buttons = Gtk.Box(
            orientation=Gtk.Orientation.HORIZONTAL,
            spacing=12,
            homogeneous=True,
            halign=Gtk.Align.CENTER,
            margin_bottom=12,
            margin_top=6,
        )
        selection_back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        selection_back_button.connect(
            "clicked", lambda _button: self.view_stack.set_visible_child_name("welcome")
        )
        selection_buttons.append(selection_back_button)
        selection_buttons.append(self.continue_button)

        page_box.append(scrolled_window)
        page_box.append(selection_buttons)
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

        box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=18,
            margin_top=24,
            margin_bottom=24,
            margin_start=12,
            margin_end=12,
        )
        clamp.set_child(box)

        restore_guidance = Gtk.Label(
            label=_(
                "Start with 'Diagnose and Repair Boot'. Package repair is needed only when GRUB itself is damaged or missing."
            ),
            justify=Gtk.Justification.CENTER,
            wrap=True,
            margin_bottom=6,
        )

        restore_group = Adw.PreferencesGroup(title=_("Restore Methods"))
        interactive_group = Adw.PreferencesGroup(title=_("Interactive Tools"))
        interactive_group.set_visible(VTE_AVAILABLE)
        self.summary_group = Adw.PreferencesGroup(title=_("Configuration Summary"))

        box.append(restore_guidance)
        box.append(restore_group)
        box.append(interactive_group)
        box.append(self.summary_group)

        restore_back_button = Gtk.Button(
            label=_("Change Selection"),
            css_classes=["pill"],
            halign=Gtk.Align.CENTER,
            margin_top=6,
        )
        restore_back_button.connect(
            "clicked", lambda _button: self.view_stack.set_visible_child_name("selection")
        )
        box.append(restore_back_button)

        modes = {
            1: (
                _("Diagnose and Repair Boot"),
                _(
                    "Checks the root filesystem, rebuilds initramfs, reinstalls GRUB, and validates the result."
                ),
                "emblem-ok-symbolic",
                restore_group,
                True,
            ),
            2: (
                _("Intermediate Restore"),
                _("Requires internet. Reinstalls the GRUB package and regenerates configs."),
                "view-refresh-symbolic",
                restore_group,
                False,
            ),
            3: (
                _("Complete Restore"),
                _(
                    "Requires internet. Updates the system and restores GRUB without replacing the installed kernel."
                ),
                "software-update-available-symbolic",
                restore_group,
                False,
            ),
            4: (
                _("Interactive Terminal"),
                _("Opens a terminal inside the selected system."),
                "utilities-terminal-symbolic",
                interactive_group,
                True,
            ),
            5: (
                _("Control Center"),
                _("Opens the control center inside the selected system."),
                "preferences-system-symbolic",
                interactive_group,
                True,
            ),
            6: (
                _("Package Manager"),
                _("Opens the package manager inside the selected system."),
                "system-software-install-symbolic",
                interactive_group,
                True,
            ),
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
        progress_box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=12,
            margin_top=24,
            margin_bottom=24,
            margin_start=24,
            margin_end=24,
        )

        self.progress_title_label = Gtk.Label(halign=Gtk.Align.CENTER)
        self.progress_title_label.get_style_context().add_class("title-2")
        progress_box.append(self.progress_title_label)

        self.progress_spinner = Gtk.Spinner(
            spinning=True, width_request=32, height_request=32, halign=Gtk.Align.CENTER
        )
        progress_box.append(self.progress_spinner)

        if VTE_AVAILABLE:
            terminal_font = os.environ.get("GRUB_RESTORE_MONOSPACE_FONT", "Monospace 10")
            self.terminal = Vte.Terminal(
                scroll_on_output=True,
                font_desc=Pango.FontDescription(terminal_font),
                vexpand=True,
            )
            self._setup_terminal_context_menu()
            scrolled_term = Gtk.ScrolledWindow(child=self.terminal, min_content_height=250)
            progress_box.append(scrolled_term)
        else:
            self.terminal = None
            progress_box.append(Gtk.Label(label=_("VTE terminal widget not available.")))

        # Box for interactive session controls
        self.interactive_finish_box = Gtk.Box(
            orientation=Gtk.Orientation.HORIZONTAL,
            spacing=12,
            halign=Gtk.Align.CENTER,
            visible=False,
            margin_top=12,
        )
        close_session_button = Gtk.Button(
            label=_("Close Terminal"), css_classes=["pill", "destructive-action"]
        )
        close_session_button.connect("clicked", self._on_close_interactive_session)
        self.interactive_finish_box.append(close_session_button)
        progress_box.append(self.interactive_finish_box)

        # Box for non-interactive completion controls
        self.completion_box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=12,
            halign=Gtk.Align.CENTER,
            visible=False,
            margin_top=12,
        )
        self.completion_status_label = Gtk.Label(wrap=True)

        completion_button_box = Gtk.Box(
            orientation=Gtk.Orientation.HORIZONTAL, spacing=12, halign=Gtk.Align.CENTER
        )
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", self._on_result_go_back)
        close_button = Gtk.Button(label=_("Close"), css_classes=["pill", "destructive-action"])
        close_button.connect("clicked", lambda w: self.get_application().quit())
        completion_button_box.append(back_button)
        completion_button_box.append(close_button)

        self.completion_box.append(self.completion_status_label)
        self.completion_box.append(completion_button_box)
        progress_box.append(self.completion_box)

        self.progress_actions_box = Gtk.Box(
            orientation=Gtk.Orientation.HORIZONTAL,
            spacing=12,
            halign=Gtk.Align.CENTER,
        )
        self.copy_log_button = Gtk.Button(label=_("Copy Log"), css_classes=["pill"])
        self.copy_log_button.connect("clicked", self._on_copy_log)
        self.save_log_button = Gtk.Button(label=_("Save Log"), css_classes=["pill"])
        self.save_log_button.connect("clicked", self._on_save_log)
        self.cancel_button = Gtk.Button(
            label=_("Cancel"), css_classes=["pill", "destructive-action"]
        )
        self.cancel_button.connect("clicked", self._on_cancel_restore)
        self.progress_actions_box.append(self.copy_log_button)
        self.progress_actions_box.append(self.save_log_button)
        self.progress_actions_box.append(self.cancel_button)
        progress_box.append(self.progress_actions_box)

        return progress_box

    def _get_result_messages(self, mode, error_msg=None):
        if error_msg:
            return {"title": _("Operation Failed!"), "description": error_msg}
        titles = {
            1: _("Boot Repair Completed"),
            2: _("Intermediate Restore Completed"),
            3: _("Complete Restore Completed"),
        }
        descriptions = {
            1: _(
                "The root configuration, initramfs, and GRUB boot files were validated. You can now restart your computer."
            ),
            2: _("The GRUB package was reinstalled and configurations were regenerated."),
            3: _("The system was updated and GRUB was restored."),
        }
        return {
            "title": titles.get(mode, _("Operation Completed Successfully!")),
            "description": descriptions.get(
                mode, _("You can now close this tool and restart your computer.")
            ),
        }

    def _setup_terminal_context_menu(self):
        if not self.terminal:
            return
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
        if self.terminal:
            self.terminal.copy_clipboard_format(Vte.Format.TEXT)

    def _on_terminal_paste(self, action, param):
        if self.terminal:
            self.terminal.paste_clipboard()

    def _on_terminal_zoom_in(self, _action, _param):
        if self.terminal:
            self.terminal.set_font_scale(min(self.terminal.get_font_scale() + 0.1, 2.0))

    def _on_terminal_zoom_out(self, _action, _param):
        if self.terminal:
            self.terminal.set_font_scale(max(self.terminal.get_font_scale() - 0.1, 0.5))

    def _on_terminal_zoom_reset(self, _action, _param):
        if self.terminal:
            self.terminal.set_font_scale(1.0)

    # Event Handlers & Logic
    def _on_start_detection(self, button):
        self.detection_page.set_title(_("Detecting Systems"))
        self.detection_page.set_description(_("Scanning your drives for Linux installations..."))
        self.view_stack.set_visible_child_name("detection")
        threading.Thread(target=self._run_detection_thread, daemon=True).start()

    def _run_detection_thread(self):
        try:
            self.system_interface.detect_systems()
            GLib.idle_add(self._populate_selection_page)
        except Exception as e:
            GLib.idle_add(self._show_error, _("Detection Failed"), str(e))

    def _populate_selection_page(self):
        for row in self.system_rows:
            self.systems_group.remove(row)
        for row in self.efi_rows:
            self.efi_group.remove(row)
        for row in self.legacy_rows:
            self.legacy_group.remove(row)
        self.system_rows.clear()
        self.efi_rows.clear()
        self.legacy_rows.clear()

        self.system_check_buttons.clear()
        self.boot_target_check_buttons.clear()
        self.legacy_boot_target_check_buttons.clear()

        self.selected_efi_partition = None
        self.selected_disk = None
        self.selected_system = None

        if not self.system_interface.detected_systems:
            self._show_error(
                _("No Systems Found"), _("No Linux installations could be detected on your drives.")
            )
            return

        is_single_system = len(self.system_interface.detected_systems) == 1

        for i, system in enumerate(self.system_interface.detected_systems):
            row = Adw.ActionRow(
                title=system["name"],
                subtitle=f"{_('Partition:')} {system['partition']} | {_('FS:')} {system.get('filesystem', _('N/A'))} | {_('UUID:')} {system.get('uuid', _('N/A'))}",
            )
            if is_single_system:
                self.selected_system = self.system_interface.detected_systems[0]
                row.add_suffix(Gtk.Image(icon_name="emblem-ok-symbolic", visible=True))
            else:
                check = Gtk.CheckButton(css_classes=["radio"])
                if self.system_check_buttons:
                    check.set_group(self.system_check_buttons[0])
                check.connect("toggled", self._on_system_toggled, i)
                self.system_check_buttons.append(check)
                row.add_suffix(check)
                row.set_activatable_widget(check)
            self.systems_group.add(row)
            self.system_rows.append(row)

        self._populate_boot_targets()

        self.view_stack.set_visible_child_name("selection")
        self._check_selection_completeness()

    def _populate_boot_targets(self):
        for row in self.efi_rows:
            self.efi_group.remove(row)
        for row in self.legacy_rows:
            self.legacy_group.remove(row)
        self.efi_rows.clear()
        self.legacy_rows.clear()
        self.boot_target_check_buttons.clear()
        self.legacy_boot_target_check_buttons.clear()
        self.selected_efi_partition = None
        self.selected_disk = None

        boot_mode = self.system_interface.boot_mode
        self.efi_group.set_visible(boot_mode == "EFI")
        self.legacy_group.set_visible(boot_mode == "LEGACY")
        if boot_mode == "EFI":
            self.guidance_label.set_text(
                _(
                    "Only validated EFI System Partitions are shown. The best match is selected automatically when confidence is high."
                )
            )
            self.active_efi_candidates = (
                self.system_interface.recommend_efi_partitions(self.selected_system)
                if self.selected_system
                else [dict(item) for item in self.system_interface.efi_partitions]
            )
            if not self.active_efi_candidates:
                self.guidance_label.set_text(
                    _(
                        "No validated EFI System Partition was found. Reboot the live system in the firmware mode used by the installed system, or verify the disk partition table."
                    )
                )
            for index, candidate in enumerate(self.active_efi_candidates):
                subtitle = _("%(size)s • %(model)s • disk %(disk)s") % {
                    "size": self.system_interface.format_size(candidate.get("size")),
                    "model": candidate.get("disk_model") or _("Unknown disk"),
                    "disk": candidate.get("disk") or _("N/A"),
                }
                row = Adw.ActionRow(title=candidate["device"], subtitle=subtitle)
                if candidate.get("recommended"):
                    tag = Gtk.Label(
                        label=_("Recommended"), css_classes=["accent", "caption", "pill"]
                    )
                    tag.set_tooltip_text(candidate.get("reason"))
                    row.add_prefix(tag)
                check = Gtk.CheckButton(css_classes=["radio"])
                if self.boot_target_check_buttons:
                    check.set_group(self.boot_target_check_buttons[0])
                check.connect(
                    "toggled",
                    lambda button, selected=index: self._on_boot_target_toggled(
                        button, selected, is_efi=True
                    ),
                )
                self.boot_target_check_buttons.append(check)
                row.add_suffix(check)
                row.set_activatable_widget(check)
                self.efi_group.add(row)
                self.efi_rows.append(row)
                if candidate.get("recommended"):
                    check.set_active(True)
        else:
            self.guidance_label.set_text(
                _(
                    "Legacy mode writes GRUB to a whole disk. Verify the model and size before continuing."
                )
            )
            for index, disk in enumerate(self.system_interface.grub_disks):
                subtitle = f"{_('Model:')} {disk['name']} | {_('Partition Table:')} {disk['table'].upper()}"
                row = Adw.ActionRow(
                    title=f"{disk['device']} ({self.system_interface.format_size(disk['size'])})",
                    subtitle=subtitle,
                )
                check = Gtk.CheckButton(css_classes=["radio"])
                if self.legacy_boot_target_check_buttons:
                    check.set_group(self.legacy_boot_target_check_buttons[0])
                check.connect(
                    "toggled",
                    lambda button, selected=index: self._on_boot_target_toggled(
                        button, selected, is_efi=False
                    ),
                )
                self.legacy_boot_target_check_buttons.append(check)
                row.add_suffix(check)
                row.set_activatable_widget(check)
                self.legacy_group.add(row)
                self.legacy_rows.append(row)
                if len(self.system_interface.grub_disks) == 1:
                    check.set_active(True)

    def _check_selection_completeness(self):
        system_ok = self.selected_system is not None
        boot_target_ok = (self.selected_efi_partition is not None) or (
            self.selected_disk is not None
        )
        self.continue_button.set_sensitive(system_ok and boot_target_ok)

    def _on_system_toggled(self, check_button, index):
        if check_button.get_active():
            self.selected_system = self.system_interface.detected_systems[index]
            self._populate_boot_targets()
        self._check_selection_completeness()

    def _on_boot_target_toggled(self, check_button, index, *, is_efi):
        if check_button.get_active():
            if is_efi:
                self.selected_efi_partition = self.active_efi_candidates[index]["device"]
                self.selected_disk = None
                for btn in self.legacy_boot_target_check_buttons:
                    if btn.get_active():
                        btn.set_active(False)
            else:  # Legacy
                self.selected_disk = self.system_interface.grub_disks[index]["device"]
                self.selected_efi_partition = None
                for btn in self.boot_target_check_buttons:
                    if btn.get_active():
                        btn.set_active(False)
        else:
            if is_efi:
                self.selected_efi_partition = None
            else:
                self.selected_disk = None
        self._check_selection_completeness()

    def _on_selection_continue(self, button):
        effective_boot_mode = "EFI" if self.selected_efi_partition else "LEGACY"
        self.system_interface.save_selection(
            self.selected_system,
            self.selected_efi_partition,
            self.selected_disk,
            effective_boot_mode,
        )
        button.set_sensitive(False)
        self.detection_page.set_title(_("Verifying Selection"))
        self.detection_page.set_description(
            _("Mounting the selected system safely for verification...")
        )
        self.view_stack.set_visible_child_name("detection")
        threading.Thread(target=self._prepare_selection_thread, daemon=True).start()

    def _prepare_selection_thread(self):
        try:
            result = self.system_interface.prepare_chroot(read_only=True, include_efi=False)
        except Exception as error:
            GLib.idle_add(self._finish_selection_prepare, False, str(error), False, False, None)
            return
        if result.returncode != 0:
            error_msg = (
                f"{_('Failed to mount the selected system for verification:')}\n{result.stderr}"
            )
            cleanup_result = self.system_interface.cleanup_chroot()
            if cleanup_result.returncode != 0 and cleanup_result.stderr:
                error_msg = f"{error_msg}\n{cleanup_result.stderr}"
            GLib.idle_add(self._finish_selection_prepare, False, error_msg, False, False, None)
            return

        mount_point = self.system_interface.mount_point
        show_control_center = (mount_point / "usr/bin/bigcontrolcenter").exists()
        show_pamac = (mount_point / "usr/bin/pamac-manager").exists()
        try:
            diagnostics = self.system_interface.diagnose_mounted_system()
        except Exception as error:
            cleanup_result = self.system_interface.cleanup_chroot()
            details = str(error)
            if cleanup_result.returncode != 0 and cleanup_result.stderr:
                details = f"{details}\n{cleanup_result.stderr}"
            GLib.idle_add(self._finish_selection_prepare, False, details, False, False, None)
            return
        cleanup_result = self.system_interface.cleanup_chroot()
        if cleanup_result.returncode != 0:
            GLib.idle_add(
                self._finish_selection_prepare,
                False,
                cleanup_result.stderr,
                False,
                False,
                None,
            )
            return
        GLib.idle_add(
            self._finish_selection_prepare,
            True,
            "",
            show_control_center,
            show_pamac,
            diagnostics,
        )

    def _finish_selection_prepare(
        self, success, error_msg, show_control_center, show_pamac, diagnostics
    ):
        self.continue_button.set_sensitive(True)
        if not success:
            self._show_error(_("Mount Failed"), error_msg)
            return GLib.SOURCE_REMOVE
        self.boot_diagnostics = diagnostics
        self._prepare_restore_page(show_control_center, show_pamac, diagnostics)
        self.view_stack.set_visible_child_name("restore")
        if diagnostics and diagnostics.get("issues"):
            self._show_boot_diagnostics(diagnostics)
        threading.Thread(target=self._check_network_thread, daemon=True).start()
        return GLib.SOURCE_REMOVE

    def _prepare_restore_page(self, show_control_center, show_pamac, diagnostics=None):
        children_to_remove = [child for child in Gtk.Widget.observe_children(self.summary_group)]
        for child in children_to_remove:
            self.summary_group.remove(child)

        summary = self.system_interface.get_system_summary(
            self.selected_system, self.selected_efi_partition, self.selected_disk
        )

        rows_data = [
            (_("Live Boot Mode"), summary["boot_mode"]),
            (_("Secure Boot"), _("Enabled") if summary["secure_boot"] else _("Disabled")),
            (_("Selected System"), summary["system"]["name"]),
            (
                _("Selected Partition"),
                f"{summary['system']['partition']} ({summary['system']['filesystem']})",
            ),
            (_("Partition UUID"), summary["system"]["uuid"]),
        ]

        if diagnostics:
            diagnostic_status = {
                "ok": _("Ready for repair"),
                "warning": _("Boot issues detected; repair is recommended"),
                "repair": _("Root configuration repair requires confirmation"),
                "blocked": _("Repair blocked; review the detected errors"),
            }.get(diagnostics.get("status"), _("Unknown status"))
            rows_data.append((_("Boot Check"), diagnostic_status))
            if diagnostics.get("root_subvol"):
                rows_data.append((_("Detected Root Subvolume"), diagnostics["root_subvol"]))
            if diagnostics.get("fstab_root_spec"):
                rows_data.append((_("Configured Root"), diagnostics["fstab_root_spec"]))

        if "efi_partition" in summary:
            rows_data.append((_("Target (EFI Restore)"), summary["efi_partition"]))
        if "disk" in summary:
            disk_info = summary["disk"]
            rows_data.append((_("Target (Legacy Restore)"), disk_info["device"]))
            rows_data.append(
                (
                    _("Disk Details"),
                    f"{self.system_interface.format_size(disk_info['size'])} | {disk_info['name']} | {disk_info['table'].upper()}",
                )
            )

        for title, subtitle in rows_data:
            row = Adw.ActionRow(title=title, subtitle=subtitle)
            row.set_activatable(False)
            self.summary_group.add(row)

        # Set visibility of interactive tool rows based on file checks
        if 5 in self.restore_rows:
            self.restore_rows[5].set_visible(show_control_center)
        if 6 in self.restore_rows:
            self.restore_rows[6].set_visible(show_pamac)

        package_repair_supported = bool(self.selected_system.get("supported"))
        restore_allowed = not (diagnostics and diagnostics.get("blocking"))
        self.restore_buttons[1][0].set_sensitive(restore_allowed)
        self.restore_rows[2].set_subtitle(
            _("Requires internet. Reinstalls the GRUB package and regenerates configs.")
        )
        self.restore_rows[3].set_subtitle(
            _(
                "Requires internet. Updates the system and restores GRUB without replacing the installed kernel."
            )
        )
        for mode in (2, 3):
            self.restore_buttons[mode][0].set_sensitive(
                package_repair_supported and restore_allowed
            )
        if not package_repair_supported:
            self.restore_rows[2].set_subtitle(
                _("Package repair is available only for BigLinux, Arch Linux, and Manjaro.")
            )
            self.restore_rows[3].set_subtitle(
                _("Complete system update is unavailable for this distribution.")
            )
        if summary.get("secure_boot"):
            dialog = Adw.MessageDialog(
                parent=self,
                heading=_("Secure Boot Is Enabled"),
                body=_(
                    "GRUB files can be restored, but the firmware may reject an unsigned bootloader. Verify the distribution's Secure Boot support before restarting."
                ),
            )
            dialog.add_response("ok", _("OK"))
            dialog.present()

    def _show_boot_diagnostics(self, diagnostics):
        headings = {
            "blocked": _("Boot Repair Is Blocked"),
            "repair": _("Root Configuration Problem Detected"),
            "warning": _("Boot Problems Detected"),
        }
        body = "\n".join(f"• {issue['message']}" for issue in diagnostics["issues"])
        dialog = Adw.MessageDialog(
            parent=self,
            heading=headings.get(diagnostics.get("status"), _("Boot Check")),
            body=body,
        )
        dialog.add_response("ok", _("OK"))
        dialog.present()

    def _check_network_thread(self):
        if not self.system_interface.check_network_connection():
            GLib.idle_add(self._show_network_warning)

    def _show_network_warning(self):
        if self.view_stack.get_visible_child_name() == "restore":
            dialog = Adw.MessageDialog(
                parent=self,
                heading=_("No Internet Connection Detected"),
                body=_(
                    "Intermediate and Complete restore options require an internet connection to download packages. These options may fail if your computer is offline."
                ),
            )
            dialog.add_response("ok", _("OK"))
            dialog.present()
        return GLib.SOURCE_REMOVE

    def _on_execute_restore(self, button, mode):
        diagnostics = self.boot_diagnostics or {}
        if diagnostics.get("blocking"):
            self._show_boot_diagnostics(diagnostics)
            return
        if diagnostics.get("requires_confirmation"):
            body = "\n".join(
                f"• {issue['message']}"
                for issue in diagnostics.get("issues", [])
                if issue.get("confirmation")
            )
            if diagnostics.get("repairable"):
                body = (
                    _(
                        "Backups will be created before correcting the root or initramfs configuration."
                    )
                    + f"\n\n{body}"
                )
            dialog = Adw.MessageDialog(
                parent=self,
                heading=_("Confirm Boot Configuration Repair"),
                body=body,
            )
            dialog.add_response("cancel", _("Cancel"))
            dialog.add_response("continue", _("Repair and Continue"))
            dialog.set_response_appearance("continue", Adw.ResponseAppearance.DESTRUCTIVE)
            dialog.set_default_response("cancel")
            dialog.connect(
                "response",
                lambda _dialog, response: (
                    self._confirm_package_repair_or_start(
                        mode,
                        diagnostics.get("repair_fstab", False),
                        diagnostics.get("repair_mkinitcpio", False),
                    )
                    if response == "continue"
                    else None
                ),
            )
            dialog.present()
            return
        self._confirm_package_repair_or_start(mode, False, False)

    def _confirm_package_repair_or_start(self, mode, repair_fstab, repair_mkinitcpio):
        if mode in [2, 3]:
            dialog = Adw.MessageDialog(
                parent=self,
                heading=_("Confirm Package Repair"),
                body=_(
                    "This operation changes packages in the installed system. Keep the computer connected to power and do not close the application."
                ),
            )
            dialog.add_response("cancel", _("Cancel"))
            dialog.add_response("continue", _("Continue"))
            dialog.set_response_appearance("continue", Adw.ResponseAppearance.DESTRUCTIVE)
            dialog.set_default_response("cancel")
            dialog.connect(
                "response",
                lambda _dialog, response: (
                    self._start_restore(
                        mode,
                        repair_fstab=repair_fstab,
                        repair_mkinitcpio=repair_mkinitcpio,
                    )
                    if response == "continue"
                    else None
                ),
            )
            dialog.present()
            return
        self._start_restore(
            mode,
            repair_fstab=repair_fstab,
            repair_mkinitcpio=repair_mkinitcpio,
        )

    def _start_restore(self, mode, *, repair_fstab=False, repair_mkinitcpio=False):
        self.current_mode = mode
        self.cancel_requested = False
        self.last_restore_error = None
        self.restore_log.clear()
        self.restore_content_flipper.set_visible_child_name("progress")
        self.completion_box.set_visible(False)
        self.interactive_finish_box.set_visible(False)
        self.cancel_button.set_visible(mode in [1, 2, 3])
        self.progress_spinner.start()
        if self.terminal:
            self.terminal.feed(b"\033c")

        if mode in [1, 2, 3]:
            self.progress_title_label.set_text(_("Restore in Progress..."))
            self.progress_title_label.set_visible(True)
            threading.Thread(
                target=self._run_restore_thread,
                args=(mode, repair_fstab, repair_mkinitcpio),
                daemon=True,
            ).start()
        else:
            self.progress_title_label.set_text(_("Preparing Interactive Session..."))
            self.progress_title_label.set_visible(True)
            threading.Thread(
                target=self._run_interactive_session, args=(mode,), daemon=True
            ).start()

    def _on_close_interactive_session(self, button):
        if self.terminal:
            self.terminal.feed_child(b"exit\n")

    def _on_cancel_restore(self, _button):
        self.cancel_requested = True
        self.cancel_button.set_sensitive(False)
        self.progress_title_label.set_text(_("Cancelling and cleaning up..."))
        self.system_interface.cancel_restore()

    def _on_copy_log(self, _button):
        clipboard = Gdk.Display.get_default().get_clipboard()
        content = GLib.Bytes.new("".join(self.restore_log).encode("utf-8"))
        provider = Gdk.ContentProvider.new_for_bytes("text/plain;charset=utf-8", content)
        clipboard.set_content(provider)

    def _on_save_log(self, _button):
        dialog = Gtk.FileDialog(
            title=_("Save Restore Log"), initial_name="biglinux-grub-restore.log"
        )
        dialog.save(self, None, self._on_log_file_selected, None)

    def _on_log_file_selected(self, dialog, result, _user_data):
        try:
            destination = dialog.save_finish(result)
            destination.replace_contents(
                "".join(self.restore_log).encode("utf-8"),
                None,
                False,
                Gio.FileCreateFlags.REPLACE_DESTINATION,
                None,
            )
            path = destination.get_path()
            if path:
                uid = int(os.environ.get("GRUB_RESTORE_USER_UID", "0"))
                gid = int(os.environ.get("GRUB_RESTORE_USER_GID", "0"))
                os.chown(path, uid, gid)
        except GLib.Error as error:
            dismissed = error.matches(Gtk.dialog_error_quark(), Gtk.DialogError.DISMISSED)
            cancelled = error.matches(Gtk.dialog_error_quark(), Gtk.DialogError.CANCELLED)
            if not (dismissed or cancelled):
                self._show_error(_("Could Not Save Log"), error.message)
        except (OSError, ValueError) as error:
            self._show_error(_("Could Not Save Log"), str(error))

    def _run_restore_thread(self, mode, repair_fstab=False, repair_mkinitcpio=False):
        try:
            self.current_process = self.system_interface.execute_restore(
                mode,
                repair_fstab=repair_fstab,
                repair_mkinitcpio=repair_mkinitcpio,
            )
            for line in iter(self.current_process.stdout.readline, ""):
                self.restore_log.append(line)
                if line.startswith("EVENT:STEP:"):
                    step = line.removeprefix("EVENT:STEP:").strip()
                    GLib.idle_add(
                        self.progress_title_label.set_text, self._translate_backend_step(step)
                    )
                    continue
                if line.startswith("EVENT:ERROR:"):
                    backend_error = line.removeprefix("EVENT:ERROR:").strip()
                    self.last_restore_error = self._translate_backend_error(backend_error)
                if self.terminal:
                    colored_line = self._colorize_terminal_line(line)
                    GLib.idle_add(
                        self.terminal.feed,
                        colored_line.replace("\n", "\r\n").encode("utf-8"),
                    )
            self.current_process.wait()
            success = self.current_process.returncode == 0
            error_msg = None
            if not success:
                error_msg = (
                    self.last_restore_error
                    or _("Restore process exited with code %d.") % self.current_process.returncode
                )
            GLib.idle_add(self._on_restore_finished, success, error_msg)
        except Exception as e:
            GLib.idle_add(self._on_restore_finished, False, str(e))

    @staticmethod
    def _colorize_terminal_line(line):
        """Add ANSI colors to the terminal view without changing saved logs."""
        if "\033[" in line:
            return line
        normalized = line.casefold()
        color = ""
        if any(
            marker in normalized
            for marker in ("no error reported", "completed", "success", "finished")
        ):
            color = "\033[1;32m"
        elif any(marker in normalized for marker in ("error", "failed", "failure", "fatal")):
            color = "\033[1;31m"
        elif "warning" in normalized:
            color = "\033[1;33m"
        elif any(
            marker in normalized
            for marker in ("installing", "generating", "regenerating", "validating")
        ):
            color = "\033[1;32m"
        elif any(marker in normalized for marker in ("mounting", "chroot executing")):
            color = "\033[1;36m"
        if not color:
            return line
        body = line.removesuffix("\n")
        newline = "\n" if line.endswith("\n") else ""
        return f"{color}{body}\033[0m{newline}"

    @staticmethod
    def _translate_backend_step(step):
        translations = {
            "Preparing mount points": _("Preparing mount points..."),
            "Removing stale package lock": _("Preparing the package database..."),
            "Refreshing package signing keys": _("Refreshing package signing keys..."),
            "Updating the installed system": _("Updating the installed system..."),
            "Reinstalling GRUB package": _("Reinstalling the GRUB package..."),
            "Installing GRUB for EFI": _("Installing GRUB for EFI..."),
            "Installing GRUB in Legacy mode": _("Installing GRUB in Legacy mode..."),
            "Regenerating initramfs": _("Regenerating initramfs..."),
            "Generating GRUB configuration": _("Generating the GRUB configuration..."),
            "Repairing root filesystem configuration": _(
                "Repairing the root filesystem configuration..."
            ),
            "Repairing initramfs configuration": _("Repairing the initramfs configuration..."),
            "Validating repaired boot files": _("Validating the repaired boot files..."),
            "Checking GRUB configuration": _("Checking the GRUB configuration..."),
            "Finishing the restore": _("Finishing the restore..."),
        }
        return translations.get(step, step)

    @staticmethod
    def _translate_backend_error(error):
        translations = {
            "The selected root does not contain a recognizable Linux installation.": _(
                "The selected root does not contain a recognizable Linux installation."
            ),
            "The selected root filesystem has no UUID.": _(
                "The selected root filesystem has no UUID."
            ),
            "The selected root UUID changed after detection. Run detection again.": _(
                "The selected root UUID changed after detection. Run detection again."
            ),
            "No supported initramfs generator was found in the installed system.": _(
                "No supported initramfs generator was found in the installed system."
            ),
            "No mkinitcpio preset was found; no initramfs can be regenerated safely.": _(
                "No mkinitcpio preset was found; no initramfs can be regenerated safely."
            ),
            "The generated GRUB configuration is missing or empty.": _(
                "The generated GRUB configuration is missing or empty."
            ),
            "No bootable kernel image was found after the repair.": _(
                "No bootable kernel image was found after the repair."
            ),
            "No initramfs image was found after regeneration.": _(
                "No initramfs image was found after regeneration."
            ),
            "The generated GRUB configuration does not reference the selected root UUID.": _(
                "The generated GRUB configuration does not reference the selected root UUID."
            ),
            "The generated GRUB configuration does not reference the detected Btrfs root subvolume.": _(
                "The generated GRUB configuration does not reference the detected Btrfs root subvolume."
            ),
            "GRUB was restored, but a filesystem could not be unmounted.": _(
                "GRUB was restored, but a filesystem could not be unmounted."
            ),
        }
        return translations.get(error, error)

    def _run_interactive_session(self, mode):
        if not self.terminal:
            GLib.idle_add(self._on_restore_finished, False, _("VTE Terminal not available."))
            return
        try:
            result = self.system_interface.prepare_chroot()
        except Exception as error:
            GLib.idle_add(self._on_restore_finished, False, str(error))
            return
        if result.returncode != 0:
            cleanup_result = self.system_interface.cleanup_chroot()
            details = result.stderr
            if cleanup_result.returncode != 0 and cleanup_result.stderr:
                details = f"{details}\n{cleanup_result.stderr}"
            GLib.idle_add(
                self._on_restore_finished, False, _("Failed to prepare chroot:\n%s") % details
            )
            return

        if mode == 6:
            try:
                lock_file_path = self.system_interface.mount_point / "var/lib/pacman/db.lck"
                if lock_file_path.exists():
                    lock_file_path.unlink()
            except OSError as e:
                self._cleanup_interactive_failure(_("Failed to remove pacman lock: %s") % e)
                return
        GLib.idle_add(self._spawn_interactive_in_vte, mode)

    def _spawn_interactive_in_vte(self, mode):
        if not self.terminal:
            self._cleanup_interactive_failure(_("VTE Terminal not available."))
            return

        cmd_map = {
            4: ["bash"],
            5: ["bash", "-c", "bigcontrolcenter --no-sandbox"],
            6: ["bash", "-c", "pamac-manager --no-sandbox"],
        }
        cmd = cmd_map.get(mode)
        if not cmd:
            self._cleanup_interactive_failure(_("Invalid restore mode."))
            return
        full_cmd = ["manjaro-chroot", str(self.system_interface.mount_point)] + cmd

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
            _spawned, self.interactive_pid = self.terminal.spawn_sync(
                Vte.PtyFlags.DEFAULT, None, full_cmd, [], GLib.SpawnFlags.DEFAULT, None, None
            )
            self.terminal.connect("child-exited", self._on_interactive_child_exited)
        except Exception as e:
            self._cleanup_interactive_failure(str(e))

    def _cleanup_interactive_failure(self, error_msg):
        def cleanup():
            try:
                result = self.system_interface.cleanup_chroot()
                if result.returncode != 0 and result.stderr:
                    message = f"{error_msg}\n{result.stderr}"
                else:
                    message = error_msg
            except Exception as error:
                message = f"{error_msg}\n{error}"
            GLib.idle_add(self._on_restore_finished, False, message)

        threading.Thread(target=cleanup, daemon=True).start()

    def _on_interactive_child_exited(self, terminal, status):
        self.interactive_pid = None
        self.interactive_finish_box.set_visible(False)
        # Make sure the title is visible again for the cleanup message
        self.progress_title_label.set_visible(True)
        GLib.idle_add(self.progress_title_label.set_text, _("Cleaning up session..."))
        threading.Thread(target=self._run_cleanup_thread, args=(status,), daemon=True).start()

    def _run_cleanup_thread(self, exit_status):
        try:
            result = self.system_interface.cleanup_chroot()
            success = exit_status == 0 and result.returncode == 0
            error_msg = result.stderr if result.returncode != 0 else None
        except Exception as error:
            success = False
            error_msg = str(error)
        GLib.idle_add(self._finish_interactive_cleanup, success, error_msg)

    def _finish_interactive_cleanup(self, success, error_msg):
        self._on_restore_finished(success, error_msg)
        if self._quit_after_interactive_exit:
            self._shutdown_started = True
            self.get_application().quit()
        return GLib.SOURCE_REMOVE

    def _on_restore_finished(self, success, error_msg=None):
        self.progress_spinner.stop()
        self.cancel_button.set_visible(False)
        self.cancel_button.set_sensitive(True)
        self.current_process = None

        if self.cancel_requested:
            success = False
            error_msg = _("The operation was cancelled. Review the log for cleanup details.")

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

    def _on_close_request(self, _window):
        if self._shutdown_started:
            return False
        processes = (self.current_process, self.system_interface.prepare_process)
        operation_running = (
            any(process and process.poll() is None for process in processes)
            or self.interactive_pid is not None
        )
        if operation_running:
            dialog = Adw.MessageDialog(
                parent=self,
                heading=_("A restore operation is still running"),
                body=_("Closing now will cancel the operation and clean up mounted filesystems."),
            )
            dialog.add_response("keep", _("Keep Running"))
            dialog.add_response("close", _("Cancel and Close"))
            dialog.set_response_appearance("close", Adw.ResponseAppearance.DESTRUCTIVE)
            dialog.set_default_response("keep")
            dialog.connect("response", self._on_close_confirmation)
            dialog.present()
            return True
        self._shutdown_started = True
        return False

    def _on_close_confirmation(self, _dialog, response):
        if response != "close":
            return
        if self.interactive_pid is not None:
            self._quit_after_interactive_exit = True
            if self.current_mode == 4:
                self.terminal.feed_child(b"exit\n")
            else:
                try:
                    os.kill(self.interactive_pid, signal.SIGTERM)
                except ProcessLookupError:
                    pass
            return
        self._shutdown_started = True
        self.system_interface.cancel_restore()
        self.get_application().quit()

    def shutdown(self):
        if getattr(self, "system_interface", None):
            self.system_interface.shutdown()

    def _show_error(self, title, message):
        error_page = Adw.StatusPage(
            title=title, description=message, icon_name="dialog-error-symbolic"
        )
        back_button = Gtk.Button(label=_("Go Back"), css_classes=["pill"])
        back_button.connect("clicked", lambda w: self.view_stack.set_visible_child_name("welcome"))
        error_page.set_child(back_button)

        if self.view_stack.get_child_by_name("error_page"):
            self.view_stack.remove(self.view_stack.get_child_by_name("error_page"))

        self.view_stack.add_named(error_page, "error_page")
        self.view_stack.set_visible_child_name("error_page")
