��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �     �   �  b    x   �     [     h     n  6   s  <   �  K   �  c   3     �  8   �  J   �  4      	   U     _     q     �  2   �  	   �  M  �  Z  -!  ?   �"  q   �"                                     
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
Language: sk
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Tento nástroj by mal byť použitý v REŽIME NAŽIVO na obnovenie BOOTu nainštalovaného BigLinuxu na pevnom disku alebo SSD.</span>

<span font='12' foreground='red'>Ak sa nainštalovaný systém spúšťa správne a nevyskytujú sa žiadne problémy s bootovaním, je lepšie nepokračovať s týmto nástrojom.</span>
<span font='10' foreground='gray'>Môže tiež fungovať s inými distribúciami Linuxu.</span>

Chcete pokračovať? <span font='16' foreground='LightSkyBlue'>Potvrďte údaje:</span>

<span font='11' foreground='gray'>Režim spustenia:</span> EFI
<span font='11' foreground='gray'>EFI oddiel:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Vybraný oddiel:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddielu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddielu:</span> $UUID_PARTITION

Chcete pokračovať? <span font='16' foreground='LightSkyBlue'>Potvrďte údaje:</span>    

<span font='11' foreground='gray'>Režim spustenia:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Vybratý disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabuľka diskových oddielov:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Veľkosť disku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Vybratý oddiel:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybratý systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddielu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddielu:</span> $UUID_PARTITION

Chcete pokračovať? <span font='16' foreground='LightSkyBlue'>Vyberte možnosť:</span>

Bolo nájdených viac ako jedno EFI oddelenie, vyberte, ktoré použiť: <span font='16' foreground='LightSkyBlue'>Vyberte možnosť:</span>

Na tomto počítači bolo nájdených viacero inštalácií Linuxu, vyberte, ktorú chcete obnoviť pre spustenie: <span font='16' foreground='LightSkyBlue'>Vyberte možnosť:</span>

Bol nájdený viac ako jeden úložný zariadenie, vyberte, na ktorý z nich chcete zapísať zavádzanie: <span font='16' foreground='LightSkyBlue'>Vyberte požadovanú možnosť:</span>

Obnovenie je možné vykonať 3 spôsobmi (<span foreground='gray'>Jednoduchý, Stredný alebo Úplný</span>), ak máte pochybnosti, skúste prvú možnosť, reštartujte počítač a pozrite, či sa problém vyrieši.

Ak problém pretrváva, skúste ostatné možnosti. Dokončite, vykonajte kroky stredného obnovenia, aktualizujte systém a skontrolujte, či je nainštalované jadro LTS. Dokončené! Popis Disk Interaktívne, otvorí terminál vo vybranom systéme. Interaktívne otvorí ovládací panel vo vybranom systéme. Interaktívne otvorí správcu balíkov pamac-manager vo vybranom systéme. Stredný, znovu nainštaluje balík grub na oddieli, regeneruje konfiguráciu a aktualizuje initrd. Meno Nebola vybraná žiadna EFI partícia, proces zrušený. Nainštalovanie Linuxu na tomto počítači sa nenašlo, proces zrušený. Žiadna partícia nebola vybraná, proces zrušený. Možnosť Tabuľka oddielov Čakajte prosím... Obnoviť Boot, Grub a initrd Jednoducho znovu zapíše Grub na začiatok disku. Veľkosť Spustenie v režime live používa režim EFI, ale na tomto počítači nebol nájdený <span foreground='red'>žiadny EFI oddiel</span>, 
pravdepodobne obnova Grub nebude fungovať. 

Skúste reštartovať a spustiť v režime Legacy alebo BIOS cez BIOS počítača.

Chcete to skúsiť aj napriek nízkej pravdepodobnosti úspechu? Spustenie v režime live používa Legacy režim, nazývaný aj BIOS, 
<span foreground='red'>ale na tomto počítači bol nájdený aspoň jeden EFI oddiel</span>, 
pravdepodobne obnova Grub nebude fungovať. 

Skúste reštartovať a spustiť v režime EFI cez BIOS počítača.

Chcete to skúsiť aj napriek nízkej pravdepodobnosti úspechu? Táto pomôcka by mala byť používaná iba v režime naživo! Váš počítač nie je pripojený k internetu, možnosti 2 a 3 vyžadujú internetové pripojenie na fungovanie. 