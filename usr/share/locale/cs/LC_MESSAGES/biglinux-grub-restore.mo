��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   v  �     �   �  a  \  {   �     :     F     L  =   Q  F   �  T   �  j   +     �  8   �  E   �  /        L     U     f     {  2   �     �  D  �  F  !  =   _"  [   �"                                     
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
Language: cs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Tento nástroj by měl být používán v REŽIMU NAŽIVO k obnovení BOOTu BigLinuxu nainstalovaného na pevném disku nebo SSD.</span>

<span font='12' foreground='red'>Pokud nainstalovaný systém správně startuje a nejsou žádné problémy s bootováním, je lepší nepokračovat s tímto nástrojem.</span>
<span font='10' foreground='gray'>Může také fungovat s jinými distribucemi Linuxu.</span>

Chcete pokračovat? <span font='16' foreground='LightSkyBlue'>Potvrdit údaje:</span>

<span font='11' foreground='gray'>Režim spuštění:</span> EFI
<span font='11' foreground='gray'>EFI oddíl:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Vybraný oddíl:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddílu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddílu:</span> $UUID_PARTITION

Chcete pokračovat? <span font='16' foreground='LightSkyBlue'>Potvrďte data:</span>    

<span font='11' foreground='gray'>Režim spuštění:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Vybraný disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabulka oddílů disku:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Velikost disku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Vybraný oddíl:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddílu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddílu:</span> $UUID_PARTITION

Chcete pokračovat? <span font='16' foreground='LightSkyBlue'>Vyberte možnost:</span>

Bylo nalezeno více než jedno oddílování EFI, vyberte, které chcete použít: <span font='16' foreground='LightSkyBlue'>Vyberte možnost:</span>

Na tomto počítači bylo nalezeno více než jedno nainstalované Linux, vyberte, který chcete obnovit zavaděč: <span font='16' foreground='LightSkyBlue'>Vyberte možnost:</span>

Bylo nalezeno více než jedno úložiště, vyberte, kam chcete zapsat zavaděč: <span font='16' foreground='LightSkyBlue'>Vyberte požadovanou možnost:</span>

Obnovení lze provést 3 způsoby (<span foreground='gray'>Jednoduché, Střední nebo Úplné</span>), pokud máte pochybnosti, zkuste první možnost, restartujte počítač a zjistěte, zda je problém vyřešen.

Pokud problém přetrvává, zkuste ostatní možnosti. Completo, executa as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Concluído! Popis Disk Interaktivní, otevře terminál uvnitř vybraného systému. Interaktivní, otevře ovládací centrum uvnitř vybraného systému. Interaktivně otevře správce balíčků pamac-manager uvnitř vybraného systému. Intermediární, znovu nainstaluje balíček grub na oddílu, regeneruje konfiguraci a aktualizuje initrd. Jméno Není vybrána žádná EFI oddílu, proces byl zrušen. Nenhum sistema Linux encontrado neste computador, processo cancelado. Není vybrána žádná oddíl, proces zrušen. Možnost Tabulka oddílů Počkejte prosím... Obnovit Boot, Grub a initrd Jednoduše znovu zapište Grub na začátek disku. Velikost Spouštění v režimu live používá režim EFI, ale na tomto počítači nebyla nalezena žádná EFI oddíl, pravděpodobně obnova Grubu nebude fungovat.

Zkuste restartovat a spustit v režimu Legacy nebo BIOS prostřednictvím BIOSu počítače.

Chcete to zkusit i přesto, že je pravděpodobnost úspěchu nízká? Spouštění v režimu live používá Legacy režim, také nazývaný BIOS, 
ale na tomto počítači byla nalezena alespoň jedna EFI oddíl, 
nejspíše obnova Grubu nebude fungovat. 

Zkuste restartovat a spustit v režimu EFI přes BIOS počítače.

Chcete to zkusit i přesto, že je pravděpodobnost úspěchu nízká? Tento nástroj by měl být používán pouze v režimu live! Váš počítač není připojen k internetu, možnosti 2 a 3 vyžadují internet k práci. 