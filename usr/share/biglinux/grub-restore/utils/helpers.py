#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import subprocess
from pathlib import Path
from utils.translation import _

class FileSystemHelper:
    """Helper functions for filesystem operations"""
    
    @staticmethod
    def format_size(size_str):
        """Format size string to human readable format"""
        if not size_str:
            return _("Unknown")
        
        # If already formatted (contains letters), return as is
        if re.search(r'[A-Za-z]', size_str):
            return size_str
        
        try:
            # Convert bytes to appropriate unit
            size_bytes = int(size_str)
            for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
                if size_bytes < 1024.0:
                    return f"{size_bytes:.1f} {unit}"
                size_bytes /= 1024.0
            return f"{size_bytes:.1f} PB"
        except ValueError:
            return size_str
    
    @staticmethod
    def get_partition_label(partition_path):
        """Get partition label if available"""
        try:
            result = subprocess.run(
                ['blkid', '-s', 'LABEL', '-o', 'value', partition_path],
                capture_output=True,
                text=True
            )
            if result.returncode == 0 and result.stdout.strip():
                return result.stdout.strip()
        except Exception:
            pass
        return None
    
    @staticmethod
    def is_mounted(partition_path):
        """Check if partition is currently mounted"""
        try:
            result = subprocess.run(
                ['findmnt', partition_path],
                capture_output=True,
                text=True
            )
            return result.returncode == 0
        except Exception:
            return False

class SystemInfoHelper:
    """Helper functions for system information"""
    
    @staticmethod
    def get_boot_mode():
        """Get current boot mode (EFI or LEGACY)"""
        return "EFI" if os.path.exists('/sys/firmware/efi') else "LEGACY"
    
    @staticmethod
    def is_live_session():
        """Check if running in live session"""
        return os.path.exists('/livefs-pkgs.txt')
    
    @staticmethod
    def get_cpu_info():
        """Get basic CPU information"""
        try:
            with open('/proc/cpuinfo', 'r') as f:
                for line in f:
                    if line.startswith('model name'):
                        return line.split(':', 1)[1].strip()
        except Exception:
            pass
        return _("Unknown CPU")
    
    @staticmethod
    def get_memory_info():
        """Get memory information"""
        try:
            with open('/proc/meminfo', 'r') as f:
                for line in f:
                    if line.startswith('MemTotal:'):
                        kb = int(line.split()[1])
                        return FileSystemHelper.format_size(str(kb * 1024))
        except Exception:
            pass
        return _("Unknown Memory")
    
    @staticmethod
    def get_live_media_info():
        """Get information about the live media"""
        try:
            # Try to get USB device info
            result = subprocess.run(
                ['lsblk', '-no', 'NAME,SIZE,MODEL,TRAN'],
                capture_output=True,
                text=True
            )
            
            if result.returncode == 0:
                lines = result.stdout.strip().split('\n')
                for line in lines:
                    if 'usb' in line.lower():
                        parts = line.split()
                        if len(parts) >= 3:
                            return f"{parts[2]} ({parts[1]})"
        except Exception:
            pass
        return _("Live Media")

class ValidationHelper:
    """Helper functions for validation"""
    
    @staticmethod
    def validate_partition_path(path):
        """Validate if partition path is valid"""
        if not path:
            return False
        
        # Check if path exists and is a block device
        path_obj = Path(path)
        return path_obj.exists() and path_obj.is_block_device()
    
    @staticmethod
    def validate_disk_path(path):
        """Validate if disk path is valid"""
        if not path:
            return False
        
        # Remove partition number if present
        disk_path = re.sub(r'\d+$', '', path)
        path_obj = Path(disk_path)
        return path_obj.exists() and path_obj.is_block_device()
    
    @staticmethod
    def validate_uuid(uuid_str):
        """Validate UUID format"""
        if not uuid_str:
            return False
        
        uuid_pattern = r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
        return bool(re.match(uuid_pattern, uuid_str.lower()))

class UIHelper:
    """Helper functions for UI operations"""
    
    @staticmethod
    def create_system_description(system_info):
        """Create a user-friendly description of the system"""
        parts = []
        
        if system_info.get('name'):
            parts.append(system_info['name'])
        
        if system_info.get('description'):
            parts.append(system_info['description'])
        
        if system_info.get('filesystem'):
            parts.append(f"({system_info['filesystem']})")
        
        return ' '.join(parts) if parts else _("Unknown System")
    
    @staticmethod
    def create_partition_description(partition_path, system_info=None):
        """Create a user-friendly description of the partition"""
        parts = [partition_path]
        
        # Add label if available
        label = FileSystemHelper.get_partition_label(partition_path)
        if label:
            parts.append(f'"{label}"')
        
        # Add filesystem type
        if system_info and system_info.get('filesystem'):
            parts.append(f"({system_info['filesystem']})")
        
        return ' '.join(parts)
    
    @staticmethod
    def create_disk_description(disk_info):
        """Create a user-friendly description of the disk"""
        parts = [disk_info['device']]
        
        if disk_info.get('size'):
            parts.append(f"({disk_info['size']})")
        
        if disk_info.get('name') and disk_info['name'] != '_':
            parts.append(f"- {disk_info['name'].replace('_', ' ')}")
        
        return ' '.join(parts)
    
    @staticmethod
    def get_restore_mode_description(mode):
        """Get description for restore mode"""
        descriptions = {
            1: _("Simple restore - Just writes the Grub again at the beginning of the disk."),
            2: _("Intermediate restore - Reinstalls the grub package, regenerates configuration, and updates initrd."),
            3: _("Complete restore - Performs intermediate steps, updates system, and checks LTS kernel."),
            4: _("Interactive terminal - Opens a terminal inside the selected system."),
            5: _("Interactive control center - Opens the control center inside the selected system."),
            6: _("Interactive package manager - Opens pamac-manager inside the selected system.")
        }
        return descriptions.get(mode, _("Unknown restore mode"))

class NetworkHelper:
    """Helper functions for network operations"""
    
    @staticmethod
    def check_internet_connection(timeout=5):
        """Check if internet connection is available"""
        try:
            result = subprocess.run(
                ['ping', '-c', '1', '-W', str(timeout), '8.8.8.8'],
                capture_output=True,
                text=True,
                timeout=timeout + 1
            )
            return result.returncode == 0
        except Exception:
            return False
    
    @staticmethod
    def get_network_status_message():
        """Get network status message for UI"""
        if NetworkHelper.check_internet_connection():
            return {
                'connected': True,
                'message': _("Internet connection available"),
                'icon': 'network-wireless-signal-excellent-symbolic'
            }
        else:
            return {
                'connected': False,
                'message': _("No internet connection detected. Options 2 and 3 require internet to work."),
                'icon': 'network-wireless-offline-symbolic'
            }

class ErrorHelper:
    """Helper functions for error handling"""
    
    @staticmethod
    def format_subprocess_error(error):
        """Format subprocess error for user display"""
        if hasattr(error, 'stderr') and error.stderr:
            return error.stderr.strip()
        elif hasattr(error, 'stdout') and error.stdout:
            return error.stdout.strip()
        else:
            return str(error)
    
    @staticmethod
    def get_user_friendly_error(error_msg):
        """Convert technical error messages to user-friendly ones"""
        error_mappings = {
            'permission denied': _("Permission denied. Please check if you have administrator privileges."),
            'no such file': _("Required file not found. The system may be corrupted."),
            'device busy': _("Device is busy. Please unmount any mounted partitions and try again."),
            'no space left': _("No space left on device. Please free up some space and try again."),
            'connection refused': _("Network connection failed. Please check your internet connection."),
            'timeout': _("Operation timed out. Please try again.")
        }
        
        error_lower = error_msg.lower()
        for key, message in error_mappings.items():
            if key in error_lower:
                return message
        
        return error_msg  # Return original if no mapping found