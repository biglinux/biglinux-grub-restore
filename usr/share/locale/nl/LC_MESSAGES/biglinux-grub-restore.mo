��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �     �   �  ]    u   �  	   S     ]     j  A   q  J   �  U   �  w   T     �  3   �  E     /   K     {     �     �     �  G   �        i     {  u!  3   �"  ]   %#                                     
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
 <span font='12'>Deze tool moet worden gebruikt in LIVE MODUS om de BOOT van de BigLinux die op de HD of SSD is geïnstalleerd te herstellen.</span>

<span font='12' foreground='red'>Als het geïnstalleerde systeem correct opstart, zijn er geen opstartproblemen, dus het is beter om niet verder te gaan met deze tool.</span>
<span font='10' foreground='gray'>Het kan ook werken met andere Linux-distributies.</span>

Wilt u doorgaan? <span font='16' foreground='LightSkyBlue'>Bevestig de gegevens:</span>
    
<span font='11' foreground='gray'>Opstartmodus:</span> EFI
<span font='11' foreground='gray'>EFI-partitie:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Geselecteerde partitie:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Geselecteerd systeem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitieformaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitie UUID:</span> $UUID_PARTITION

Wilt u doorgaan? <span font='16' foreground='LightSkyBlue'>Bevestig de gegevens:</span>    

<span font='11' foreground='gray'>Opstartmodus:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Geselecteerde schijf:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Schijfpartitietabel:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Schijfgrootte:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Geselecteerde partitie:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Geselecteerd systeem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitieformaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitie UUID:</span> $UUID_PARTITION

Wilt u doorgaan? <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>

Er is meer dan één EFI-partitie gevonden, selecteer welke u wilt gebruiken: <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>

Er zijn meer dan één Linux-installatie op deze computer gevonden, selecteer welke je wilt herstellen: <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>
    
Er is meer dan één opslagapparaat gevonden, selecteer welke je wilt gebruiken om de opstart te schrijven: <span font='16' foreground='LightSkyBlue'>Selecteer de gewenste optie:</span>
        
De herstel kan op 3 manieren worden uitgevoerd (<span foreground='gray'>Eenvoudig, Tussenliggend of Compleet</span>), bij twijfel, probeer de eerste optie, herstart de computer en kijk of het is opgelost.

Als het probleem aanhoudt, probeer dan de andere opties. Voltooid, voert de tussenherstelstappen uit, werkt het systeem bij en controleert of de LTS-kernel is geïnstalleerd. Voltooid! Beschrijving Schijf Interactief, opent een terminal binnen het geselecteerde systeem. Interactief, opent het bedieningscentrum binnen het geselecteerde systeem. Interactief, opent de pamac-manager pakketbeheerder binnen het geselecteerde systeem. Tussenliggend, herinstalleert het grub-pakket op de partitie, genereert de configuratie opnieuw en werkt de initrd bij. Naam Geen EFI-partitie geselecteerd, proces geannuleerd. Geen Linux-installatie gevonden op deze computer, proces geannuleerd. Geen partitie geselecteerd, proces geannuleerd. Optie Partitietabel Even geduld... Herstel Boot, Grub en initrd Eenvoudig, schrijft gewoon de Grub opnieuw aan het begin van de schijf. Grootte De opstart in live-modus maakt gebruik van de EFI-modus, maar <span foreground='red'>er is geen EFI-partitie</span> op deze computer gevonden, 
waarschijnlijk zal het herstellen van Grub niet werken. 

Probeer opnieuw op te starten en op te starten in Legacy- of BIOS-modus via de BIOS van de computer.

Wilt u het toch proberen, ondanks de lage kans op succes? De opstart in live-modus maakt gebruik van Legacy-modus, ook wel BIOS genoemd, 
<span foreground='red'>maar er is ten minste één EFI-partitie gevonden</span> op deze computer, 
waarschijnlijk zal het Grub-herstel niet werken. 

Probeer opnieuw op te starten en op te starten in EFI-modus via de BIOS van de computer.

Wil je het toch proberen, ook al is de kans op succes laag? Deze tool mag alleen in live-modus worden gebruikt! Uw computer is niet verbonden met het internet, opties 2 en 3 vereisen internet om te werken. 