��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  7  �  $  4  �  Y  �   ,  �   �  �   �  �  :  �   �  
   p     {     �  @   �  I   �  X     t   n     �  :   �  Q   #  6   u     �     �     �  '   �  3   �     3   W  :   �  �!  4   #  ~   M#                                     
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
Language: hu
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 Ezt az eszközt a LIVE MÓDBAN kell használni a BigLinux telepített HD vagy SSD BOOT-jának helyreállításához.

Ha a telepített rendszer helyesen indul el, nincsenek boot problémák, ezért jobb, ha nem folytatja ezzel az eszközzel.
Ez más Linux disztribúciókkal is működhet.

Szeretné folytatni? <span font='16' foreground='LightSkyBlue'>Erősítse meg az adatokat:</span>

<span font='11' foreground='gray'>Indítási mód:</span> EFI
<span font='11' foreground='gray'>EFI partíció:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Kiválasztott partíció:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Kiválasztott rendszer:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partíció formátuma:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partíció UUID-je:</span> $UUID_PARTITION

Folytatja? <span font='16' foreground='LightSkyBlue'>Erősítse meg az adatokat:</span>    

<span font='11' foreground='gray'>Indítási mód:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Kiválasztott lemez:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Lemez partíciós tábla:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Lemez mérete:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Kiválasztott partíció:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Kiválasztott rendszer:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partíció formátuma:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partíció UUID:</span> $UUID_PARTITION

Folytatja? <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Több EFI partíció található, válassza ki, melyiket szeretné használni: <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Több Linux telepítés található ezen a számítógépen, válassza ki, melyiket szeretné helyreállítani a bootoláshoz: <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Több tárolóeszköz található, válassza ki, hogy melyikre írja a boot-ot: <span font='16' foreground='LightSkyBlue'>Válassza ki a kívánt lehetőséget:</span>

A helyreállítás három módon történhet (<span foreground='gray'>Egyszerű, Közepes vagy Teljes</span>), ha bizonytalan, próbálja ki az első lehetőséget, indítsa újra a számítógépet, és nézze meg, hogy megoldódik-e a probléma.

Ha a probléma továbbra is fennáll, próbálja ki a másik lehetőségeket. Teljesítse, hajtsa végre az átmeneti helyreállítási lépéseket, frissítse a rendszert, és ellenőrizze, hogy telepítve van-e az LTS kernel. Befejezve! Leírás Lemez Interaktív, egy terminált nyit meg a kiválasztott rendszeren. Interaktív, megnyitja a vezérlőközpontot a kiválasztott rendszerben. Interaktív, megnyitja a pamac-manager csomagkezelőt a kiválasztott rendszeren belül. Köztes, újratelepíti a grub csomagot a partíción, újragenerálja a konfigurációt, és frissíti az initrd-t. Név Nem választott ki EFI partíciót, folyamat megszakítva. Nem található Linux telepítés ezen a számítógépen, folyamat megszakítva. Nincs kiválasztott partíció, folyamat megszakítva. Opció Partíciós tábla Kérlek várj... Boot, Grub és initrd helyreállítása Egyszerűen írja újra a Grub-ot a lemez elejére. Méret A live módban történő indítás EFI módban történik, de ezen a számítógépen nem található EFI partíció, valószínűleg a Grub helyreállítása nem fog működni.

Próbálja újraindítani és a számítógép BIOS-án keresztül Legacy vagy BIOS módban indítani.

Szeretné megpróbálni még alacsony siker esélyével is? A live módban történő indítás Legacy módban történik, amit BIOS-nak is neveznek, de legalább egy EFI partíció található ezen a számítógépen, valószínűleg a Grub helyreállítása nem fog működni.

Próbálja újraindítani és az EFI módban történő indítást a számítógép BIOS-ában beállítani.

Szeretné megpróbálni még alacsony siker esélyével is? Ez a segédprogram csak élő módban használható! A számítógép nincs csatlakoztatva az internethez, a 2. és 3. lehetőség internetkapcsolatot igényelnek a működéshez. 