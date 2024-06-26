��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  	  �  �  �  �   c  �   �  �   �  b  :  {   �  
        $     0  ;   5  ?   q  O   �  h        j  -   o  J   �  )   �  
             .      @  1   a  
   �  E  �  0  �   .   "  a   D"                                     
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
Language: no
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Denne verktøyet bør brukes i LIVE-MODUS for å gjenopprette BOOT av BigLinux installert på HD eller SSD.</span>

<span font='12' foreground='red'>Hvis det installerte systemet starter riktig, er det ingen oppstartsproblemer, så det er bedre å ikke fortsette med dette verktøyet.</span>
<span font='10' foreground='gray'>Det kan også fungere med andre Linux-distribusjoner.</span>

Ønsker du å fortsette? <span font='16' foreground='LightSkyBlue'>Bekreft dataene:</span>

<span font='11' foreground='gray'>Oppstartmodus:</span> EFI
<span font='11' foreground='gray'>EFI-partisjon:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Valgt partisjon:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partisjonsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partisjons UUID:</span> $UUID_PARTITION

Ønsker du å fortsette? <span font='16' foreground='LightSkyBlue'>Bekreft dataene:</span>    

<span font='11' foreground='gray'>Oppstartmodus:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valgt disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskpartisjonstabell:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Diskstørrelse:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valgt partisjon:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partisjonsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partisjons UUID:</span> $UUID_PARTITION

Ønsker du å fortsette? <span font='16' foreground='LightSkyBlue'>Velg et alternativ:</span>

Mer enn én EFI-partisjon ble funnet, velg hvilken du vil bruke: <span font='16' foreground='LightSkyBlue'>Velg et alternativ:</span>

Mer enn én Linux-installasjon ble funnet på denne datamaskinen, velg hvilken du vil gjenopprette oppstarten for: <span font='16' foreground='LightSkyBlue'>Velg et alternativ:</span>

Mer enn én lagringsenhet ble funnet, velg hvilken du vil skrive oppstarten til: <span font='16' foreground='LightSkyBlue'>Velg ønsket alternativ:</span>

Gjenopprettingen kan gjøres på 3 måter (<span foreground='gray'>Enkel, Mellomliggende eller Fullstendig</span>), hvis du er i tvil, prøv det første alternativet, start datamaskinen på nytt og se om problemet er løst.

Hvis problemet vedvarer, prøv de andre alternativene. Completo, executa as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Fullført! Beskrivelse Disk Interaktive, åpner en terminal inne i det valgte systemet. Interaktiv, åpner kontrollsenteret inne i det valgte systemet. Interaktive, åpner pakkehåndtereren pamac-manager inne i det valgte systemet. Intermediær, installerer grub-pakken på partisjonen, regenererer konfigurasjonen og oppdaterer initrd. Navn Ingen EFI-partisjon valgt, prosessen avbrutt. Ingen Linux-installasjon funnet på denne datamaskinen, prosessen avbrutt. Ingen partisjon valgt, prosessen avbrutt. Alternativ Partisjonstabell Vennligst vent... Gjenopprett Boot, Grub og initrd Enkelt, skriv Grub igjen i begynnelsen av disken. Størrelse Oppstart i live-modus bruker EFI-modus, men <span foreground='red'>ingen EFI-partisjon</span> ble funnet på denne datamaskinen, 
sannsynligvis vil ikke Grub-gjenopprettingen fungere.

Prøv å starte på nytt og starte i Legacy- eller BIOS-modus via datamaskinens BIOS.

Vil du prøve selv med lav sannsynlighet for suksess? Oppstart i live-modus bruker Legacy-modus, også kalt BIOS, men minst én EFI-partisjon ble funnet på denne datamaskinen, mest sannsynlig vil ikke Grub-gjenopprettingen fungere.

Prøv å starte på nytt og start i EFI-modus via datamaskinens BIOS.

Vil du prøve selv med lav sannsynlighet for suksess? Denne verktøyet bør kun brukes i live-modus! Din datamaskin er ikke tilkoblet internett, alternativene 2 og 3 krever internett for å fungere. 