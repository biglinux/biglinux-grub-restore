��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   ^  �   �  �   �  j  N  c   �  
        (     -  7   2  ?   j  N   �  ^   �     X  ,   \  E   �  ,   �     �               +  2   F  	   y  G  �  g  �   9   3"  U   m"                                     
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
 <span font='12'>Ovaj alat treba koristiti u ŽIVOM MODU za vraćanje BOOT-a BigLinux-a instaliranog na HD-u ili SSD-u.</span>

<span font='12' foreground='red'>Ako instalirani sustav ispravno pokreće, nema problema s pokretanjem, pa je bolje ne nastaviti s ovim alatom.</span>
<span font='10' foreground='gray'>Može također raditi s drugim Linux distribucijama.</span>

Želite li nastaviti? <span font='16' foreground='LightSkyBlue'>Potvrdite podatke:</span>
    
<span font='11' foreground='gray'>Način pokretanja:</span> EFI
<span font='11' foreground='gray'>EFI particija:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Odabrana particija:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Odabrani sustav:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format particije:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID particije:</span> $UUID_PARTITION

Želite li nastaviti? <span font='16' foreground='LightSkyBlue'>Potvrdite podatke:</span>    

<span font='11' foreground='gray'>Način pokretanja:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Odabrani disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tablica particija diska:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Veličina diska:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Odabrana particija:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Odabrani sustav:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format particije:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID particije:</span> $UUID_PARTITION

Želite li nastaviti? <span font='16' foreground='LightSkyBlue'>Odaberite opciju:</span>

Pronađeno je više od jedne EFI particije, odaberite koju želite koristiti: <span font='16' foreground='LightSkyBlue'>Odaberite opciju:</span>

Pronađena su više od jedne Linux instalacije na ovom računalu, odaberite koju želite vratiti za pokretanje: <span font='16' foreground='LightSkyBlue'>Odaberite opciju:</span>
    
Pronađeno je više od jednog uređaja za pohranu, odaberite na koji želite zapisati pokretanje: <span font='16' foreground='LightSkyBlue'>Odaberite željenu opciju:</span>
        
Obnova se može izvršiti na 3 načina (<span foreground='gray'>Jednostavno, Srednje ili Potpuno</span>), ako niste sigurni, pokušajte s prvom opcijom, ponovo pokrenite računalo i provjerite je li problem riješen.

Ako problem i dalje postoji, pokušajte s ostalim opcijama. Završava, izvršava međufaze vraćanja, ažurira sustav i provjerava je li LTS kernel instaliran. Završeno! Opis Disk Interaktivno, otvara terminal unutar odabranog sustava. Interaktivno, otvara kontrolni centar unutar odabranog sustava. Interaktivno, otvara upravitelj paketa pamac-manager unutar odabranog sustava. Srednji, ponovo instalira grub paket na particiji, regenerira konfiguraciju i ažurira initrd. Ime Nema odabrane EFI particije, proces otkazan. Nema instalacije Linuxa pronađene na ovom računalu, proces otkazan. Nema odabranih particija, proces je otkazan. Opcija Tablica particija Molimo pričekajte... Obnovi Boot, Grub i initrd Jednostavno, ponovno piše Grub na početak diska. Veličina Pokretanje u live načinu koristi EFI način, ali <span foreground='red'>nije pronađena EFI particija</span> na ovom računalu, 
najvjerojatnije obnova Gruba neće raditi. 

Pokušajte ponovno pokrenuti i pokrenuti u Legacy ili BIOS načinu putem BIOS-a računala.

Želite li pokušati čak i s malom vjerojatnošću uspjeha? Pokretanje u načinu rada uživo koristi Legacy način, također nazvan BIOS, 
<span foreground='red'>ali barem jedna EFI particija pronađena je</span> na ovom računalu, 
najvjerojatnije obnova Gruba neće raditi. 

Pokušajte ponovno pokrenuti i pokrenuti u EFI načinu putem BIOS-a računala.

Želite li pokušati čak i s niskom vjerojatnošću uspjeha? Ova alatka se smije koristiti samo u režimu rada uživo! Vaše računalo nije povezano s internetom, opcije 2 i 3 zahtijevaju internet za rad. 