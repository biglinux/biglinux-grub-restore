��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   L  �   �  �   �  ]        ~  
   �     	       9     =   W  M   �  o   �     S  -   X  J   �  )   �  
   �            !   +  0   M     ~  G  �  P  �   1   "  `   Q"                                     
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
 <span font='12'>Detta verktyg bör användas i LIVE-LÄGE för att återställa BOOT av BigLinux installerat på HD eller SSD.</span>

<span font='12' foreground='red'>Om det installerade systemet startar korrekt, finns det inga startproblem, så det är bättre att inte fortsätta med detta verktyg.</span>
<span font='10' foreground='gray'>Det kan också fungera med andra Linux-distributioner.</span>

Vill du fortsätta? <span font='16' foreground='LightSkyBlue'>Bekräfta datan:</span>
    
<span font='11' foreground='gray'>Startläge:</span> EFI
<span font='11' foreground='gray'>EFI-partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Vald partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Vill du fortsätta? <span font='16' foreground='LightSkyBlue'>Bekräfta datan:</span>    

<span font='11' foreground='gray'>Startläge:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Vald disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskpartitionstabell:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Diskstorlek:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Vald partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Vill du fortsätta? <span font='16' foreground='LightSkyBlue'>Välj ett alternativ:</span>

Mer än en EFI-partition hittades, välj vilken som ska användas: <span font='16' foreground='LightSkyBlue'>Välj ett alternativ:</span>

Mer än en Linux-installation hittades på den här datorn, välj vilken som ska återställas till boot: <span font='16' foreground='LightSkyBlue'>Välj ett alternativ:</span>
    
Mer än en lagringsenhet hittades, välj vilken som ska skrivas till boot: <span font='16' foreground='LightSkyBlue'>Välj det önskade alternativet:</span>
        
Återställningen kan göras på 3 sätt (<span foreground='gray'>Enkel, Mellanliggande eller Komplett</span>), om du är osäker, prova det första alternativet, starta om datorn och se om det är löst.

Om problemet kvarstår, prova de andra alternativen. Slutför, utför de mellanliggande återställningsstegen, uppdaterar systemet och kontrollerar om LTS-kärnan är installerad. Slutfört! Beskrivning Diskett Interaktiv, öppnar en terminal inuti det valda systemet. Interaktiv, öppnar kontrollcentret inuti det valda systemet. Interaktiv, öppnar pamac-manager paketförvaltaren inuti det valda systemet. Mellanliggande, installerar om grub-paketet på partitionen, regenererar konfigurationen och uppdaterar initrd. Namn Ingen EFI-partition vald, processen avbruten. Ingen Linux-installation hittades på den här datorn, processen avbruten. Ingen partition vald, processen avbruten. Alternativ Partitionsschema Vänligen vänta... Återställ Boot, Grub och initrd Enkel, skriver bara om Grub i början av disken. Storlek Start i live-läge använder EFI-läge, men <span foreground='red'>ingen EFI-partition</span> hittades på den här datorn, 
troligtvis kommer Grub-återställningen inte att fungera. 

Försök att starta om och boota i Legacy- eller BIOS-läge genom datorns BIOS.

Vill du försöka även med låg sannolikhet för framgång? Start i live-läge använder Legacy-läge, även kallat BIOS, 
<span foreground='red'>men minst en EFI-partition hittades</span> på den här datorn, 
mest troligt kommer Grub-återställningen inte att fungera. 

Försök starta om och boota i EFI-läge genom datorns BIOS.

Vill du försöka även med låg sannolikhet för framgång? Detta verktyg bör endast användas i live-läge! Din dator är inte ansluten till internet, alternativ 2 och 3 kräver internet för att fungera. 