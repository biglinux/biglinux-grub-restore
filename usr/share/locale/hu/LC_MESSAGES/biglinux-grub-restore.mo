��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  2  �  �  �  �   �  �   P  �     �  �  �   ^     �     �     �  9      I   :  R   �  {   �     S  ;   X  I   �  8   �                 1   '   F   6   n      �   �  �   �  9"  /   �#  |   $                                     
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
 <span font='12'>Ezt az eszközt ÉLŐ MÓDBAN kell használni a BigLinux HD-n vagy SSD-n történő BOOT-jának helyreállításához.</span>

<span font='12' foreground='red'>Ha a telepített rendszer helyesen bootol, nincsenek boot problémák, ezért jobb, ha nem folytatja ezzel az eszközzel.</span>
<span font='10' foreground='gray'>Más Linux disztribúciókkal is működhet.</span>

Szeretné folytatni? <span font='16' foreground='LightSkyBlue'>Erősítse meg az adatokat:</span>
    
<span font='11' foreground='gray'>Indítási mód:</span> EFI
<span font='11' foreground='gray'>EFI partíció:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Kiválasztott partíció:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Kiválasztott rendszer:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partíció formátum:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partíció UUID:</span> $UUID_PARTITION

Folytatni szeretné? <span font='16' foreground='LightSkyBlue'>Erősítse meg az adatokat:</span>    

<span font='11' foreground='gray'>Indítási mód:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Kiválasztott lemez:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Lemezpartíció táblázat:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Lemez mérete:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Kiválasztott partíció:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Kiválasztott rendszer:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partíció formátum:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partíció UUID:</span> $UUID_PARTITION

Folytatni szeretné? <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Több mint egy EFI partíciót találtunk, válassza ki, melyiket szeretné használni: <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Több Linux telepítést találtunk ezen a számítógépen, válassza ki, melyiket szeretné helyreállítani a boot-ot: <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>
    
Több tárolóeszközt találtunk, válassza ki, melyikre szeretné írni a bootot: <span font='16' foreground='LightSkyBlue'>Válaszd ki a kívánt lehetőséget:</span>
        
A visszaállítás 3 módon végezhető el (<span foreground='gray'>Egyszerű, Közepes vagy Teljes</span>), ha kétségeid vannak, próbáld ki az első lehetőséget, indítsd újra a számítógépet, és nézd meg, hogy megoldódott-e.

Ha a probléma továbbra is fennáll, próbáld ki a többi lehetőséget. Befejezi, végrehajtja a köztes visszaállítási lépéseket, frissíti a rendszert, és ellenőrzi, hogy az LTS kernel telepítve van-e. Kész! Leírás Lemez Interaktív, terminált nyit a kiválasztott rendszerben. Interaktív, megnyitja a vezérlőközpontot a kiválasztott rendszerben. Interaktív, megnyitja a pamac-manager csomagkezelőt a kiválasztott rendszerben. Középhaladó, újratelepíti a grub csomagot a partíción, újragenerálja a konfigurációt, és frissíti az initrd-t. Név Nincs kiválasztva EFI partíció, a folyamat megszakítva. Nincs Linux telepítés ezen a számítógépen, a folyamat megszakítva. Nincs kiválasztott partíció, a folyamat megszakítva. Opció Partíciós tábla Kérjük, várjon... Boot, Grub és initrd helyreállítása Egyszerű, csak újraírja a Grub-ot a lemez elejére. Méret A live módban való indítás EFI módban történik, de <span foreground='red'>nem található EFI partíció</span> ezen a számítógépen, 
valószínűleg a Grub helyreállítás nem fog működni. 

Próbálja meg újraindítani és indítani a Legacy vagy BIOS módban a számítógép BIOS-án keresztül.

Szeretné megpróbálni, még alacsony sikerességi valószínűség mellett is? A live módban történő indítás Legacy módban történik, más néven BIOS, 
<span foreground='red'>de legalább egy EFI partíciót találtunk</span> ezen a számítógépen, 
valószínűleg a Grub helyreállítás nem fog működni. 

Próbálja meg újraindítani és EFI módban indítani a számítógép BIOS-án keresztül.

Szeretné megpróbálni, még alacsony sikerességi valószínűség mellett is? Ez az eszköz csak éles módban használható! A számítógépe nincs csatlakoztatva az internethez, a 2. és 3. lehetőség internetkapcsolatot igényel a működéshez. 