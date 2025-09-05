#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import subprocess
import threading
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
            'restore_mode': '/tmp/grub-restore-apply-mode'
        }
        
        # System state
        self.detected_systems = []
        self.efi_partitions = []
        self.grub_disks = []
        self.boot_mode = None
        self.partition_type = None
        
    def detect_systems(self):
        """Run system detection using the backend script"""
        try:
            # Execute the detection script
            script_path = self.backend_path / 'grub-restore'
            subprocess.run([str(script_path)], check=True)
            
            # Parse detection results
            self.parse_detection_results()
            
            # Determine boot configuration
            self.determine_boot_config()
            
            return True
            
        except subprocess.CalledProcessError as e:
            raise Exception(f"Detection script failed: {e}")
        except Exception as e:
            raise Exception(f"System detection failed: {e}")
    
    def parse_detection_results(self):
        """Parse the results from detection script"""
        
        # Parse detected Linux systems
        try:
            with open(self.temp_files['os_prober'], 'r') as f:
                lines = f.readlines()
                self.detected_systems = []
                for line in lines:
                    line = line.strip()
                    if line:
                        parts = line.split(':')
                        if len(parts) >= 6:
                            system_info = {
                                'partition': parts[0],
                                'name': parts[1],
                                'description': parts[2],
                                'type': parts[3],
                                'filesystem': parts[4] if len(parts) > 4 else '',
                                'uuid': parts[5].replace('UUID=', '') if len(parts) > 5 else ''
                            }
                            self.detected_systems.append(system_info)
        except FileNotFoundError:
            self.detected_systems = []
        
        # Parse EFI partitions
        try:
            with open(self.temp_files['efi_partitions'], 'r') as f:
                self.efi_partitions = [line.strip() for line in f.readlines() if line.strip()]
        except FileNotFoundError:
            self.efi_partitions = []
        
        # Parse available disks
        try:
            with open(self.temp_files['grub_disks'], 'r') as f:
                lines = f.readlines()
                self.grub_disks = []
                for line in lines:
                    line = line.strip()
                    if line:
                        parts = line.split()
                        if len(parts) >= 4:
                            disk_info = {
                                'device': parts[0],
                                'size': parts[1],
                                'name': parts[2],
                                'table': parts[3]
                            }
                            self.grub_disks.append(disk_info)
        except FileNotFoundError:
            self.grub_disks = []
    
    def determine_boot_config(self):
        """Determine boot mode and partition configuration"""
        
        is_efi_boot = os.path.exists('/sys/firmware/efi')
        has_efi_partitions = len(self.efi_partitions) > 0
        
        if not is_efi_boot and not has_efi_partitions:
            self.boot_mode = "LEGACY"
            self.partition_type = "LEGACY"
        elif is_efi_boot and not has_efi_partitions:
            self.boot_mode = "EFI"
            self.partition_type = "LEGACY"
        elif not is_efi_boot and has_efi_partitions:
            self.boot_mode = "LEGACY"
            self.partition_type = "EFI"
        else:  # EFI boot and EFI partitions
            self.boot_mode = "EFI"
            self.partition_type = "EFI"
    
    def get_boot_compatibility_warning(self):
        """Get warning message for boot compatibility issues"""
        
        if self.boot_mode == "EFI" and self.partition_type == "LEGACY":
            return {
                'type': 'error',
                'title': _("EFI Boot without EFI Partition"),
                'message': _(
                    "The boot in live mode is using EFI mode, but no EFI partition "
                    "was found on this computer. Most likely the Grub restore will not work.\n\n"
                    "Try restarting and booting in Legacy or BIOS mode through the computer's BIOS."
                )
            }
        elif self.boot_mode == "LEGACY" and self.partition_type == "EFI":
            return {
                'type': 'warning',
                'title': _("Legacy Boot with EFI Partition"),
                'message': _(
                    "The boot in live mode is using Legacy mode, also called BIOS, "
                    "but at least one EFI partition was found on this computer. "
                    "Most likely the Grub restore will not work.\n\n"
                    "Try restarting and booting in EFI mode through the computer's BIOS."
                )
            }
        
        return None
    
    def check_network_connection(self):
        """Check if system has internet connection"""
        try:
            result = subprocess.run(
                ['ping', '-c', '1', '8.8.8.8'],
                capture_output=True,
                text=True,
                timeout=5
            )
            return result.returncode == 0
        except Exception:
            return False
    
    def save_selection(self, selected_system, selected_efi=None, selected_disk=None):
        """Save user selections to temporary files"""
        
        # Save selected system
        if selected_system:
            with open(self.temp_files['os_prober_selected'], 'w') as f:
                system = selected_system
                line = f"{system['partition']}:{system['name']}:{system['description']}::{system['filesystem']}:UUID={system['uuid']}\n"
                f.write(line)
        
        # Save selected EFI partition (if EFI mode)
        if selected_efi and self.boot_mode == "EFI":
            with open(self.temp_files['efi_selected'], 'w') as f:
                f.write(selected_efi + '\n')
        
        # Save selected disk (if Legacy mode)
        if selected_disk and self.boot_mode == "LEGACY":
            with open(self.temp_files['grub_disks_selected'], 'w') as f:
                f.write(selected_disk + '\n')
    
    def execute_restore(self, mode):
        """Execute the restore operation"""
        
        # Save restore mode
        with open(self.temp_files['restore_mode'], 'w') as f:
            f.write(str(mode))
        
        # Determine which script to execute
        if self.boot_mode == "EFI":
            script_name = 'grub-apply-efi'
        else:
            script_name = 'grub-apply-legacy'
        
        script_path = self.backend_path / script_name
        
        # Execute restore script
        try:
            # All modes use same command (VTE terminal will handle interactive display)
            cmd = [
                'pkexec', 'env', 
                f'DISPLAY={os.environ.get("DISPLAY", "")}',
                f'XAUTHORITY={os.environ.get("XAUTHORITY", "")}',
                str(script_path)
            ]
            
            process = subprocess.Popen(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
            
            return process
            
        except Exception as e:
            raise Exception(f"Failed to execute restore: {e}")
    
    def get_system_summary(self, selected_system, selected_efi=None, selected_disk=None):
        """Get summary of selected configuration"""
        
        summary = {
            'boot_mode': self.boot_mode,
            'system': selected_system,
        }
        
        if self.boot_mode == "EFI" and selected_efi:
            summary['efi_partition'] = selected_efi
        
        if self.boot_mode == "LEGACY" and selected_disk:
            disk_info = next((d for d in self.grub_disks if d['device'] == selected_disk), None)
            if disk_info:
                summary['disk'] = disk_info
        
        return summary
    
    def cleanup_temp_files(self):
        """Clean up temporary files"""
        for temp_file in self.temp_files.values():
            try:
                if os.path.exists(temp_file):
                    os.remove(temp_file)
            except Exception:
                pass  # Ignore errors during cleanup