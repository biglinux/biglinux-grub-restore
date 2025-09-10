**BigLinux GRUB Restore** is a graphical utility designed to easily repair and restore the GRUB bootloader for BigLinux and other Linux distributions. It is particularly useful when the bootloader is broken, for instance, after installing another operating system.



<img width="1068" height="681" alt="biglinux-grub-restore" src="https://github.com/user-attachments/assets/ae668b43-b80e-48ee-bff4-03268deb66f5" />
<img width="1068" height="681" alt="biglinux-grub-restore2" src="https://github.com/user-attachments/assets/19e8d437-4223-41af-884a-9bff977db984" />
<img width="1068" height="681" alt="biglinux-grub-restore3" src="https://github.com/user-attachments/assets/109c9845-c572-483f-acc5-41142453aaaf" />

The application is built with Python using the GTK4 and Adwaita libraries, providing a modern and user-friendly wizard-style interface. It is intended to be run in a live environment to safely detect and repair installed systems.

## Key Features

- **User-Friendly Wizard**: The application guides the user through the process of detecting installed systems and restoring the bootloader with a simple, step-by-step interface.
- **System Detection**: Automatically scans the drives for installed Linux systems, identifying their partitions, filesystems, and UUIDs.
- **Boot Mode Awareness**: Detects whether the live environment was booted in EFI or Legacy (BIOS) mode and warns the user about potential mismatches with the installed systems to prevent restore failures.
- **Multiple Restore Modes**: Offers different levels of restoration to address various issues:
    - **Simple Restore**: Rewrites the GRUB information to the boot sector, a quick fix for common problems.
    - **Intermediate Restore**: Reinstalls the GRUB package and regenerates configuration files.
    - **Complete Restore**: Updates the entire system, including the kernel and GRUB, for more severe issues.
- **Interactive Tools**: For advanced users, it provides direct access to the installed system through a chroot environment:
    - **Interactive Terminal**: Opens a terminal session within the selected system.
    - **Control Center**: Launches the BigLinux Control Center of the installed system.
    - **Package Manager**: Opens the package manager of the installed system.
- **Network Awareness**: Checks for an active internet connection and warns the user if offline, as some restore modes require downloading packages.

## How to Use

1.  **Boot from a Live Environment**: To use the tool, boot your computer from a BigLinux live USB or DVD.
2.  **Launch the Application**: Open the "BigLinux GRUB Restore" application. It will automatically request root privileges.
3.  **Start Detection**: On the welcome screen, click "Start Detection" to allow the tool to scan your drives for Linux installations.
4.  **Select System and Target**:
    -   From the detected systems, select the Linux installation you want to repair.
    -   The application will automatically detect the boot mode (EFI or Legacy). Select the appropriate EFI partition or target disk (for MBR) for the restoration.
5.  **Choose a Restore Method**:
    -   For most common issues, start with the **Simple Restore**.
    -   If the problem persists, you can try the **Intermediate Restore** or **Complete Restore** (internet connection required).
    -   Advanced users can use the **Interactive Tools** to perform manual repairs.
6.  **Execute and Monitor**: Click "Execute" and monitor the progress in the integrated terminal view.
7.  **Reboot**: Once the process is complete, reboot your computer to check if the bootloader has been successfully restored.

## Dependencies

- Python 3
- GTK4
- libadwaita
- VTE (for the integrated terminal)
