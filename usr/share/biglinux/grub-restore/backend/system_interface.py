#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import subprocess
from pathlib import Path
from utils.translation import _

class SystemInterface:
    """Interface to interact with the backend shell scripts and system detection"""
    
    def __init__(self):
        self.backend_path = Path(__file__).parent
        self.temp_files = {
            'os_prober': '/tmp/os-prober',
            'os_prober_selected': '/tmp/os-prober-selected',
            'efi_partitions': '/tmp/efi-partitions',
            'efi_selected': '/tmp/efi-selected',
            'grub_disks': '/tmp/grub-disks',
            'grub_disks_selected': '/tmp/grub-disks-selected',
            'restore_mode': '/tmp/grub-restore-apply-mode',
            'effective_boot_mode': '/tmp/effective-boot-mode'
        }
        
        self.detected_systems = []
        self.efi_partitions = []
        self.grub_disks = []
        self.boot_mode = None
        self.effective_boot_mode = None
        
    def detect_systems(self):
        """Run system detection using the backend script"""
        try:
            script_path = self.backend_path / 'grub-restore'
            subprocess.run([str(script_path)], check=True, capture_output=True)
            self.parse_detection_results()
            self.determine_boot_config()
            return True
        except subprocess.CalledProcessError as e:
            error_output = e.stderr.decode() if e.stderr else "No error output"
            raise Exception(f"Detection script failed: {error_output}")
        except Exception as e:
            raise Exception(f"System detection failed: {e}")
    
    def parse_detection_results(self):
        """Parse the results from detection script"""
        try:
            with open(self.temp_files['os_prober'], 'r') as f:
                self.detected_systems = []
                for line in f.readlines():
                    line = line.strip()
                    if not line: continue
                    parts = line.split(':')
                    if len(parts) >= 6:
                        self.detected_systems.append({
                            'partition': parts[0],
                            'name': parts[1],
                            'description': parts[2],
                            'type': parts[3],
                            'filesystem': parts[4] if len(parts) > 4 else '',
                            'uuid': parts[5].replace('UUID=', '') if len(parts) > 5 else ''
                        })
        except FileNotFoundError: self.detected_systems = []
        
        try:
            with open(self.temp_files['efi_partitions'], 'r') as f:
                self.efi_partitions = [line.strip() for line in f.readlines() if line.strip()]
        except FileNotFoundError: self.efi_partitions = []
        
        try:
            with open(self.temp_files['grub_disks'], 'r') as f:
                self.grub_disks = []
                for line in f.readlines():
                    line = line.strip()
                    if not line: continue
                    parts = line.split()
                    if len(parts) >= 4:
                        self.grub_disks.append({
                            'device': parts[0],
                            'size': parts[1],
                            'name': ' '.join(parts[2:-1]),
                            'table': parts[-1]
                        })
        except FileNotFoundError: self.grub_disks = []
    
    def determine_boot_config(self):
        self.boot_mode = "EFI" if os.path.exists('/sys/firmware/efi') else "LEGACY"
    
    def check_network_connection(self):
        try:
            subprocess.run(['ping', '-c', '1', '8.8.8.8'], check=True, capture_output=True, timeout=5)
            return True
        except (subprocess.CalledProcessError, subprocess.TimeoutExpired):
            return False
    
    def save_selection(self, selected_system, selected_efi=None, selected_disk=None, effective_boot_mode=None):
        for key in ['os_prober_selected', 'efi_selected', 'grub_disks_selected', 'effective_boot_mode']:
            try:
                if os.path.exists(self.temp_files[key]): os.remove(self.temp_files[key])
            except OSError as e: print(f"Warning: Could not remove {self.temp_files[key]}: {e}")

        if selected_system:
            with open(self.temp_files['os_prober_selected'], 'w') as f:
                system = selected_system
                line = f"{system['partition']}:{system['name']}:{system['description']}::{system['filesystem']}:UUID={system['uuid']}\n"
                f.write(line)
        
        if selected_efi:
            with open(self.temp_files['efi_selected'], 'w') as f: f.write(selected_efi + '\n')
        
        if selected_disk:
            with open(self.temp_files['grub_disks_selected'], 'w') as f: f.write(selected_disk + '\n')

        self.effective_boot_mode = effective_boot_mode if effective_boot_mode else self.boot_mode
    
    def _prepare_mode_file(self, mode):
        """Helper to prepare the mode file."""
        try:
            if os.path.exists(self.temp_files['restore_mode']):
                os.remove(self.temp_files['restore_mode'])
        except OSError as e:
            print(f"Warning: Could not remove old temp file {self.temp_files['restore_mode']}: {e}")
        with open(self.temp_files['restore_mode'], 'w') as f:
            f.write(str(mode))

    def execute_restore(self, mode):
        """Execute non-interactive restore, streaming output."""
        self._prepare_mode_file(mode)
        script_name = 'grub-apply-efi' if self.effective_boot_mode == "EFI" else 'grub-apply-legacy'
        script_path = self.backend_path / script_name
        try:
            return subprocess.Popen(
                [str(script_path)],
                stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                text=True, bufsize=1
            )
        except Exception as e:
            raise Exception(f"Failed to execute restore: {e}")

    def prepare_chroot(self):
        """Runs the script to mount partitions for chroot."""
        script_path = self.backend_path / 'prepare-chroot.sh'
        return subprocess.run([str(script_path)], capture_output=True, text=True)

    def cleanup_chroot(self):
        """Runs the script to unmount chroot partitions."""
        script_path = self.backend_path / 'cleanup-chroot.sh'
        return subprocess.run([str(script_path)], capture_output=True, text=True)

    def get_system_summary(self, selected_system, selected_efi=None, selected_disk=None):
        summary = {'boot_mode': self.boot_mode, 'system': selected_system}
        if selected_efi:
            summary['efi_partition'] = selected_efi
        if selected_disk:
            summary['disk'] = next((d for d in self.grub_disks if d['device'] == selected_disk), None)
        return summary
