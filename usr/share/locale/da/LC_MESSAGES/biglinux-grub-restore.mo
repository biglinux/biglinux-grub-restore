��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   W  �   �  �   �  \  >  z   �               +  >   0  ;   o  M   �  j   �     d  -   i  F   �  )   �               !     2  7   N  
   �  C  �  U  �   0   +"  a   \"                                     
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
 <span font='12'>Dette værktøj skal bruges i LIVE TILSTAND for at gendanne BOOT'en af BigLinux installeret på HD eller SSD.</span>

<span font='12' foreground='red'>Hvis det installerede system booter korrekt, er der ingen bootproblemer, så det er bedre ikke at fortsætte med dette værktøj.</span>
<span font='10' foreground='gray'>Det kan også fungere med andre Linux-distributioner.</span>

Vil du fortsætte? <span font='16' foreground='LightSkyBlue'>Bekræft dataene:</span>
    
<span font='11' foreground='gray'>Boot-tilstand:</span> EFI
<span font='11' foreground='gray'>EFI-partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Valgt partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Ønsker du at fortsætte? <span font='16' foreground='LightSkyBlue'>Bekræft dataene:</span>    

<span font='11' foreground='gray'>Boot-tilstand:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valgt disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskpartitionstabel:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Diskstørrelse:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valgt partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Vil du fortsætte? <span font='16' foreground='LightSkyBlue'>Vælg en mulighed:</span>

Der blev fundet mere end én EFI-partition, vælg hvilken der skal bruges: <span font='16' foreground='LightSkyBlue'>Vælg en mulighed:</span>

Der blev fundet mere end én Linux-installation på denne computer, vælg hvilken en der skal gendannes til opstart: <span font='16' foreground='LightSkyBlue'>Vælg en mulighed:</span>
    
Mere end én lagringsenhed blev fundet, vælg hvilken en der skal skrives til boot: <span font='16' foreground='LightSkyBlue'>Vælg den ønskede mulighed:</span>
        
Gendannelsen kan udføres på 3 måder (<span foreground='gray'>Simpel, Mellemliggende eller Fuld</span>), hvis du er i tvivl, så prøv den første mulighed, genstart computeren og se om det er løst.

Hvis problemet fortsætter, så prøv de andre muligheder. Fuldfører, udfører de mellemliggende gendannelsestrin, opdaterer systemet og kontrollerer, om LTS-kernen er installeret. Færdig! Beskrivelse Disk Interaktiv, åbner et terminalvindue inde i det valgte system. Interaktiv, åbner kontrolcentret inde i det valgte system. Interaktiv, åbner pamac-manager pakkehåndteringen inde i det valgte system. Mellemniveau, geninstallerer grub-pakken på partitionen, regenererer konfigurationen og opdaterer initrd. Navn Ingen EFI-partition valgt, proces annulleret. Ingen Linux-installation fundet på denne computer, proces annulleret. Ingen partition valgt, proces annulleret. Mulighed Partitionstabel Vent venligst... Gendan Boot, Grub og initrd Simpel, skriver bare Grub igen i begyndelsen af disken. Størrelse Boot i live-tilstand bruger EFI-tilstand, men <span foreground='red'>ingen EFI-partition</span> blev fundet på denne computer, 
mest sandsynligt vil Grub-gendannelse ikke fungere. 

Prøv at genstarte og boote i Legacy- eller BIOS-tilstand gennem computerens BIOS.

Vil du prøve, selv med en lav sandsynlighed for succes? Boot i live-tilstand bruger Legacy-tilstand, også kaldet BIOS, 
<span foreground='red'>men der blev fundet mindst én EFI-partition</span> på denne computer, 
mest sandsynligt vil Grub-gendannelsen ikke fungere. 

Prøv at genstarte og boote i EFI-tilstand gennem computerens BIOS.

Vil du prøve, selv med en lav sandsynlighed for succes? Dette værktøj bør kun bruges i live-tilstand! Din computer er ikke tilsluttet internettet, mulighederne 2 og 3 kræver internet for at fungere. 