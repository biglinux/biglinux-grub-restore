��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �     �     �   �  {  u  p   �     b     o     u  @   z  I   �  L     ]   R     �  8   �  T   �  4   E  	   z     �     �     �  ?   �  	   	   U     d  i!  :   �"  b   	#                                     
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
 <span font='12'>Tento nástroj by mal byť použitý v REŽIME NAŽIVO na obnovenie ZAVÁDANIA BigLinux nainštalovaného na HD alebo SSD.</span>

<span font='12' foreground='red'>Ak nainštalovaný systém správne bootuje, nie sú žiadne problémy so zavádzaním, takže je lepšie s týmto nástrojom nepokračovať.</span>
<span font='10' foreground='gray'>Môže to fungovať aj s inými distribúciami Linuxu.</span>

Chcete pokračovať? <span font='16' foreground='LightSkyBlue'>Potvrďte údaje:</span>
    
<span font='11' foreground='gray'>Režim spustenia:</span> EFI
<span font='11' foreground='gray'>EFI oddiel:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Vybraný oddiel:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddielu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddielu:</span> $UUID_PARTITION

Chcete pokračovať? <span font='16' foreground='LightSkyBlue'>Potvrďte údaje:</span>    

<span font='11' foreground='gray'>Režim spustenia:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Vybraný disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabuľka oddielov disku:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Veľkosť disku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Vybraný oddiel:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddielu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddielu:</span> $UUID_PARTITION

Chcete pokračovať? <span font='16' foreground='LightSkyBlue'>Vyberte možnosť:</span>

Bolo nájdených viac ako jedna EFI partícia, vyberte, ktorú chcete použiť: <span font='16' foreground='LightSkyBlue'>Vyberte možnosť:</span>

Na tomto počítači bolo nájdených viac ako jedna inštalácia Linuxu, vyberte, ktorú chcete obnoviť: <span font='16' foreground='LightSkyBlue'>Vyberte možnosť:</span>
    
Bolo nájdených viac ako jedno úložné zariadenie, vyberte, na ktoré sa má zapísať spúšťanie: <span font='16' foreground='LightSkyBlue'>Vyberte požadovanú možnosť:</span>
        
Obnovenie môže byť vykonané 3 spôsobmi (<span foreground='gray'>Jednoduché, Stredné alebo Kompletné</span>), ak si nie ste istí, vyskúšajte prvú možnosť, reštartujte počítač a zistite, či je problém vyriešený.

Ak problém pretrváva, vyskúšajte ďalšie možnosti. Dokončuje, vykonáva medzistupne obnovenia, aktualizuje systém a kontroluje, či je nainštalované jadro LTS. Dokončené! Popis Disk Interaktívne, otvorí terminál vo vnútri vybraného systému. Interaktívne, otvorí ovládacie centrum vo vnútri vybraného systému. Interaktívne, otvorí správcu balíkov pamac-manager vo vybranom systéme. Stredne, preinštaluje balík grub na oddiele, regeneruje konfiguráciu a aktualizuje initrd. Názov Nebola vybraná žiadna EFI partícia, proces zrušený. Na tomto počítači nebola nájdená žiadna inštalácia Linuxu, proces zrušený. Žiadna partícia nebola vybraná, proces zrušený. Možnosť Tabuľka oddielov Prosím, počkajte... Obnoviť Boot, Grub a initrd Jednoduché, jednoducho znovu zapíše Grub na začiatok disku. Veľkosť Bootovanie v živom režime používa režim EFI, ale <span foreground='red'>nebola nájdená žiadna EFI partícia</span> na tomto počítači, 
pravdepodobne obnovenie Grubu nebude fungovať. 

Skúste reštartovať a bootovať v režime Legacy alebo BIOS cez BIOS počítača.

Chcete to skúsiť aj s nízkou pravdepodobnosťou úspechu? Bootovanie v živom režime používa režim Legacy, tiež nazývaný BIOS, 
<span foreground='red'>ale na tomto počítači bola nájdená aspoň jedna EFI partícia</span>, 
pravdepodobne obnovenie Grub nebude fungovať. 

Skúste reštartovať a bootovať v režime EFI cez BIOS počítača.

Chcete to skúsiť aj s nízkou pravdepodobnosťou úspechu? Tento nástroj by sa mal používať iba v živom režime! Váš počítač nie je pripojený na internet, možnosti 2 a 3 vyžadujú internet na fungovanie. 