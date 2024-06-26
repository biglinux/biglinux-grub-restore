��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �   -  �   �  q  �  �   �  
   �  	   �     �  7   �  K   �  N      n   o     �  .   �  @     *   S     ~     �     �      �  4   �  
      K     ]  e!  5   �"  j   �"                                     
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
Language: ro
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Acest instrument ar trebui folosit în MODUL LIVE pentru a restaura BOOT-ul BigLinux instalat pe HD sau SSD.</span>

<span font='12' foreground='red'>Dacă sistemul instalat pornește corect, nu există probleme de boot, deci este mai bine să nu procedați cu acest instrument.</span>
<span font='10' foreground='gray'>S-ar putea să funcționeze și cu alte distribuții Linux.</span>

Doriți să continuați? <span font='16' foreground='LightSkyBlue'>Confirmați datele:</span>

<span font='11' foreground='gray'>Mod de pornire:</span> EFI
<span font='11' foreground='gray'>Partiția EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Partiția selectată:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistemul selectat:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formatul partiției:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID-ul partiției:</span> $UUID_PARTITION

Doriți să continuați? <span font='16' foreground='LightSkyBlue'>Confirmați datele:</span>    

<span font='11' foreground='gray'>Mod de pornire:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disc selectat:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabel de partiții al discului:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Dimensiune disc:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partiția selectată:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistemul selectat:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partiție:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partiție:</span> $UUID_PARTITION

Doriți să continuați? <span font='16' foreground='LightSkyBlue'>Selectați o opțiune:</span>

Mai mult de o partiție EFI a fost găsită, selectați pe care să o utilizați: <span font='16' foreground='LightSkyBlue'>Selectați o opțiune:</span>

Mai multe instalări Linux au fost găsite pe acest computer, selectați pe care să o restaurați pentru boot: <span font='16' foreground='LightSkyBlue'>Selectați o opțiune:</span>

Mai mult de un dispozitiv de stocare a fost găsit, selectați pe care să scrieți boot-ul: <span font='16' foreground='LightSkyBlue'>Selectați opțiunea dorită:</span>

Restaurarea poate fi făcută în 3 moduri (<span foreground='gray'>Simplu, Intermediar sau Complet</span>), dacă aveți îndoieli, încercați prima opțiune, reporniți computerul și verificați dacă problema este rezolvată.

Dacă problema persistă, încercați celelalte opțiuni. Completați, efectuează pașii de restaurare intermediară, actualizează sistemul și verifică dacă kernelul LTS este instalat. Finalizat! Descriere Disc Interactiv, deschide un terminal în sistemul selectat. Interactiv, deschide centrul de control în interiorul sistemului selectat. Interactiv, deschide managerul de pachete pamac-manager în sistemul selectat. Intermediar, reinstalează pachetul grub pe partiție, regenerează configurația și actualizează initrd-ul. Nume Nicio partiție EFI selectată, proces anulat. Nicio instalare Linux găsită pe acest computer, proces anulat. Nicio partiție selectată, proces anulat. Opțiune Tabel de partiții Vă rugăm să așteptați... Restaurare Boot, Grub și initrd Simplu, rescrie Grub din nou la începutul discului. Dimensiune Pornirea în modul live se face folosind modul EFI, dar nu a fost găsită nicio partiție EFI pe acest computer, 
cel mai probabil restaurarea Grub nu va funcționa.

Încercați repornirea și pornirea în modul Legacy sau BIOS prin BIOS-ul computerului.

Doriți să încercați chiar și cu o probabilitate scăzută de succes? Pornirea în modul live se face folosind modul Legacy, numit și BIOS, dar a fost găsită cel puțin o partiție EFI pe acest computer, cel mai probabil restaurarea Grub nu va funcționa.

Încercați să reporniți și să porniți în modul EFI prin BIOS-ul computerului.

Doriți să încercați chiar și cu o probabilitate scăzută de succes? Acest utilitar ar trebui folosit doar în modul live! Calculatorul dvs. nu este conectat la internet, opțiunile 2 și 3 necesită internet pentru a funcționa. 