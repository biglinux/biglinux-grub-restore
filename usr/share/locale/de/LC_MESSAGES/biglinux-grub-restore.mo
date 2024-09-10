��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  %  �  �  �  �   �  �   h  �   >  �  �  �   �     %     4  
   A  9   L  >   �  K   �  z        �  5   �  K   �  1         E      L      ^   &   n   ;   �      �   �  �   �  b"  @   $     F$                                     
                                                   	                                                 <span font='12'>This tool should be used in LIVE MODE to restore the BOOT of the BigLinux installed on the HD or SSD.</span>

<span font='12' foreground='red'>If the installed system is booting correctly, there are no boot problems, so it's better not to proceed with this tool.</span>
<span font='10' foreground='gray'>It may also work with other Linux distributions.</span>

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Confirm the data:</span>
    
<span font='11' foreground='gray'>Boot mode:</span> EFI
<span font='11' foreground='gray'>EFI partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Selected partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Confirm the data:</span>    

<span font='11' foreground='gray'>Boot mode:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Selected disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Disk partition table:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Disk size:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Selected partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Select an option:</span>

More than one EFI partition was found, select which one to use: <span font='16' foreground='LightSkyBlue'>Select an option:</span>

More than one Linux installation was found on this computer, select which one to restore the boot: <span font='16' foreground='LightSkyBlue'>Select an option:</span>
    
More than one storage device was found, select which one to write the boot to: <span font='16' foreground='LightSkyBlue'>Select the desired option:</span>
        
The restore can be done in 3 ways (<span foreground='gray'>Simple, Intermediate, or Complete</span>), if in doubt, try the first option, restart the computer and see if it is resolved.

If the problem persists, try the other options. Complete, performs the intermediate restore steps, updates the system, and checks if the LTS kernel is installed. Completed! Description Disk Interactive, opens a terminal inside the selected system. Interactive, opens the control center inside the selected system. Interactive, opens the pamac-manager package manager inside the selected system. Intermediate, reinstalls the grub package on the partition, regenerates the configuration, and updates the initrd. Name No EFI partition selected, process canceled. No Linux installation found on this computer, process canceled. No partition selected, process canceled. Option Partition Table Please wait... Restore Boot, Grub, and initrd Simple, just writes the Grub again at the beginning of the disk. Size The boot in live mode is using EFI mode, but <span foreground='red'>no EFI partition</span> was found on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in Legacy or BIOS mode through the computer's BIOS.

Do you want to try even with a low probability of success? The boot in live mode is using Legacy mode, also called BIOS, 
<span foreground='red'>but at least one EFI partition was found</span> on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in EFI mode through the computer's BIOS.

Do you want to try even with a low probability of success? This utility should only be used in live mode! Your computer is not connected to the internet, options 2 and 3 require internet to work. Project-Id-Version: biglinux-grub-restore
Report-Msgid-Bugs-To: 
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Dieses Tool sollte im LIVE-MODUS verwendet werden, um den BOOT von BigLinux, das auf der HD oder SSD installiert ist, wiederherzustellen.</span>

<span font='12' foreground='red'>Wenn das installierte System korrekt bootet, gibt es keine Bootprobleme, daher ist es besser, mit diesem Tool nicht fortzufahren.</span>
<span font='10' foreground='gray'>Es könnte auch mit anderen Linux-Distributionen funktionieren.</span>

Möchten Sie fortfahren? <span font='16' foreground='LightSkyBlue'>Bestätigen Sie die Daten:</span>
    
<span font='11' foreground='gray'>Bootmodus:</span> EFI
<span font='11' foreground='gray'>EFI-Partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Ausgewählte Partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Ausgewähltes System:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Möchten Sie fortfahren? <span font='16' foreground='LightSkyBlue'>Bestätigen Sie die Daten:</span>    

<span font='11' foreground='gray'>Bootmodus:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Ausgewähltes Laufwerk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Partitionstabelle:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Laufwerksgröße:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Ausgewählte Partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Ausgewähltes System:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Möchten Sie fortfahren? <span font='16' foreground='LightSkyBlue'>Wählen Sie eine Option:</span>

Es wurden mehr als eine EFI-Partition gefunden, wählen Sie aus, welche verwendet werden soll: <span font='16' foreground='LightSkyBlue'>Wählen Sie eine Option:</span>

Es wurden mehr als eine Linux-Installation auf diesem Computer gefunden, wählen Sie aus, welche Sie zum Booten wiederherstellen möchten: <span font='16' foreground='LightSkyBlue'>Wählen Sie eine Option:</span>
    
Es wurden mehr als ein Speichergerät gefunden, wählen Sie aus, auf welches Sie den Boot schreiben möchten: <span font='16' foreground='LightSkyBlue'>Wählen Sie die gewünschte Option:</span>
        
Die Wiederherstellung kann auf 3 Arten durchgeführt werden (<span foreground='gray'>Einfach, Mittel oder Komplett</span>), im Zweifelsfall versuchen Sie die erste Option, starten Sie den Computer neu und sehen Sie, ob das Problem behoben ist.

Wenn das Problem weiterhin besteht, versuchen Sie die anderen Optionen. Vollständig, führt die Zwischenwiederherstellungsschritte durch, aktualisiert das System und überprüft, ob der LTS-Kernel installiert ist. Abgeschlossen! Beschreibung Festplatte Interaktiv, öffnet ein Terminal im ausgewählten System. Interaktiv, öffnet das Steuerzentrum im ausgewählten System. Interaktiv, öffnet den Paketmanager pamac-manager im ausgewählten System. Intermediate, installiert das grub-Paket auf der Partition neu, regeneriert die Konfiguration und aktualisiert das initrd. Name Keine EFI-Partition ausgewählt, Vorgang abgebrochen. Keine Linux-Installation auf diesem Computer gefunden, Vorgang abgebrochen. Keine Partition ausgewählt, Vorgang abgebrochen. Option Partitionstabelle Bitte warten... Boot, Grub und initrd wiederherstellen Einfach, schreibt den Grub erneut am Anfang der Festplatte. Größe Der Boot im Live-Modus verwendet den EFI-Modus, aber <span foreground='red'>keine EFI-Partition</span> wurde auf diesem Computer gefunden, 
höchstwahrscheinlich wird die Grub-Wiederherstellung nicht funktionieren. 

Versuchen Sie, neu zu starten und im Legacy- oder BIOS-Modus über das BIOS des Computers zu booten.

Möchten Sie es trotz einer geringen Erfolgswahrscheinlichkeit versuchen? Der Boot im Live-Modus verwendet den Legacy-Modus, auch als BIOS bezeichnet, 
<span foreground='red'>aber mindestens eine EFI-Partition wurde</span> auf diesem Computer gefunden, 
höchstwahrscheinlich wird die Grub-Wiederherstellung nicht funktionieren. 

Versuchen Sie, neu zu starten und im EFI-Modus über das BIOS des Computers zu booten.

Möchten Sie es trotz einer geringen Erfolgswahrscheinlichkeit versuchen? Dieses Dienstprogramm sollte nur im Live-Modus verwendet werden! Ihr Computer ist nicht mit dem Internet verbunden, die Optionen 2 und 3 erfordern eine Internetverbindung, um zu funktionieren. 