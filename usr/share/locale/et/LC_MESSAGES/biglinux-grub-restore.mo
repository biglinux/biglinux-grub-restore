��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �     �   �  N  7  m   �     �  	   �       1     7   E  B   }  Z   �       4      C   U  8   �     �     �     �     �  /        D  7  I  6  �   3   �!  Y   �!                                     
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
Language: et
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>See tööriist tuleks kasutada REŽIIMIS LIVE, et taastada BigLinuxi paigaldatud HD või SSD käivitus.</span>

<span font='12' foreground='red'>Kui paigaldatud süsteem käivitub korrektselt, puuduvad käivitamisprobleemid, seega on parem mitte jätkata selle tööriistaga.</span>
<span font='10' foreground='gray'>See võib samuti töötada teiste Linuxi distributsioonidega.</span>

Kas soovite jätkata? <span font='16' foreground='LightSkyBlue'>Kinnita andmed:</span>

<span font='11' foreground='gray'>Alglaadimisrežiim:</span> EFI
<span font='11' foreground='gray'>EFI partitsioon:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Valitud partitsioon:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valitud süsteem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitsiooni vorming:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitsiooni UUID:</span> $UUID_PARTITION

Kas soovite jätkata? <span font='16' foreground='LightSkyBlue'>Kinnita andmed:</span>    

<span font='11' foreground='gray'>Alglaadimisrežiim:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valitud ketas:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Ketta partitsioonitabel:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Ketta suurus:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valitud partitsioon:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valitud süsteem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitsiooni vorming:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitsiooni UUID:</span> $UUID_PARTITION

Kas soovite jätkata? <span font='16' foreground='LightSkyBlue'>Valige valik:</span>

Leiti rohkem kui üks EFI partitsioon, valige, millist kasutada: <span font='16' foreground='LightSkyBlue'>Valige valik:</span>

Selle arvuti kohta leiti rohkem kui üks Linuxi installimine, valige, millist taastada käivitus: <span font='16' foreground='LightSkyBlue'>Valige suvand:</span>

Leiti rohkem kui üks salvestusseade, valige, millisele käivitamise kirjutada: <span font='16' foreground='LightSkyBlue'>Valige soovitud valik:</span>

Taastamine saab teha 3 viisil (<span foreground='gray'>Lihtne, Keskmine või Täielik</span>), kui olete kahtleval seisukohal, proovige esimest valikut, taaskäivitage arvuti ja vaadake, kas see lahendab probleemi.

Kui probleem püsib, proovige teisi valikuid. Täielik, teostab vahepealse taastamise sammud, uuendab süsteemi ja kontrollib, kas LTS-tuum on installitud. Valmis! Kirjeldus Ketasalvesti Interaktiivne, avab valitud süsteemis terminali. Interaktiivne, avab valitud süsteemis juhtimiskeskuse. Interaktiivne, avab valitud süsteemis pamac-manageri pakihalduri. Keskmine, taastab grubipaketi partitsioonil, taastab konfiguratsiooni ja uuendab initrd-d. Nimi EFI partitsiooni pole valitud, protsess tühistatud. Linuxi installimist selles arvutis ei leitud, protsess tühistatud. Ühtegi partitsiooni pole valitud, protsess tühistatud. Valik Partitsioonitabel Palun oota... Taasta Boot, Grub ja initrd Lihtsalt kirjutage Grub uuesti ketta algusesse. Maht Käivitus elurežiimis kasutab EFI režiimi, kuid selle arvuti kohta <span foreground='red'>EFI partitsiooni</span> ei leitud, tõenäoliselt Grubi taastamine ei tööta.

Proovige arvuti BIOS-i kaudu taaskäivitada ja käivitada pärand- või BIOS-režiimis.

Kas soovite proovida isegi madala eduvõimalusega? Käivitus elurežiimis kasutab pärandrežiimi, mida nimetatakse ka BIOS-iks, kuid selle arvuti puhul leiti vähemalt üks EFI partitsioon, tõenäoliselt Grubi taastamine ei toimi.

Proovi arvuti BIOS-i kaudu taaskäivitada ja käivitada EFI režiimis.

Kas soovite proovida isegi madala eduvõimaluse korral? See utiliiti tuleks kasutada ainult otseühenduses! Teie arvuti pole internetiga ühendatud, valikud 2 ja 3 vajavad töötamiseks internetti. 