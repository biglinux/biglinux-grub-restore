��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   O  �   �  �   z  w    k   �     �     �       >     B   G  S   �  k   �     J  ,   O  F   |  '   �  
   �     �            9   7     q  \  v  w  �   5   K"  `   �"                                     
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
 <span font='12'>Tätä työkalua tulisi käyttää LIVE-MOODISSA palauttamaan BigLinuxin käynnistys, joka on asennettu HD:lle tai SSD:lle.</span>

<span font='12' foreground='red'>Jos asennettu järjestelmä käynnistyy oikein, käynnistysongelmia ei ole, joten on parempi olla jatkamatta tämän työkalun kanssa.</span>
<span font='10' foreground='gray'>Se voi myös toimia muiden Linux-jakeluiden kanssa.</span>

Haluatko jatkaa? <span font='16' foreground='LightSkyBlue'>Vahvista tiedot:</span>
    
<span font='11' foreground='gray'>Käynnistystila:</span> EFI
<span font='11' foreground='gray'>EFI-osio:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Valittu osio:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valittu järjestelmä:</span> $SELECTED_OS
<span font='11' foreground='gray'>Osion muoto:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Osion UUID:</span> $UUID_PARTITION

Haluatko jatkaa? <span font='16' foreground='LightSkyBlue'>Vahvista tiedot:</span>    

<span font='11' foreground='gray'>Käynnistystila:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valittu levy:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Levyosion taulukko:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Levykoon:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valittu osio:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valittu järjestelmä:</span> $SELECTED_OS
<span font='11' foreground='gray'>Osion muoto:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Osion UUID:</span> $UUID_PARTITION

Haluatko jatkaa? <span font='16' foreground='LightSkyBlue'>Valitse vaihtoehto:</span>

Löydettiin useampi kuin yksi EFI-osio, valitse käytettävä: <span font='16' foreground='LightSkyBlue'>Valitse vaihtoehto:</span>

Tältä tietokoneelta löytyi useampi Linux-asennus, valitse mikä palautetaan käynnistykseen: <span font='16' foreground='LightSkyBlue'>Valitse vaihtoehto:</span>
    
Löydettiin useampi tallennuslaite, valitse mihin kirjoitetaan käynnistys: <span font='16' foreground='LightSkyBlue'>Valitse haluamasi vaihtoehto:</span>
        
Palautus voidaan tehdä kolmella tavalla (<span foreground='gray'>Yksinkertainen, Keskitaso tai Täydellinen</span>), jos olet epävarma, kokeile ensimmäistä vaihtoehtoa, käynnistä tietokone uudelleen ja katso, onko ongelma ratkaistu.

Jos ongelma jatkuu, kokeile muita vaihtoehtoja. Valmis, suorittaa väli palautusvaiheet, päivittää järjestelmän ja tarkistaa, onko LTS-ydin asennettu. Valmis! Kuvaus Levy Interaktiivinen, avaa terminaalin valitussa järjestelmässä. Interaktiivinen, avaa ohjauskeskuksen valitussa järjestelmässä. Interaktiivinen, avaa pamac-manager-pakettienhallinnan valitussa järjestelmässä. Välikurssi, asentaa grub-paketin uudelleen osiolle, luo konfiguraation uudelleen ja päivittää initrd:n. Nimi Ei EFI-osioita valittu, prosessi peruutettu. Tätä tietokonetta ei löytynyt Linux-asennusta, prosessi peruutettu. Ei osiota valittu, prosessi peruutettu. Vaihtoehto Osio-taulukko Ole hyvä ja odota... Palauta Boot, Grub ja initrd Yksinkertainen, kirjoittaa Grubin uudelleen levyn alkuun. Koko Käynnistys live-tilassa käyttää EFI-tilaa, mutta <span foreground='red'>EFI-osioita</span> ei löytynyt tältä tietokoneelta, 
todennäköisesti Grubin palautus ei toimi. 

Yritä käynnistää uudelleen ja käynnistää Legacy- tai BIOS-tilassa tietokoneen BIOSin kautta.

Haluatko yrittää, vaikka menestymisen todennäköisyys on alhainen? Käynnistys live-tilassa käyttää Legacy-tilaa, jota kutsutaan myös BIOS:ksi, 
<span foreground='red'>mutta ainakin yksi EFI-osio löytyi</span> tästä tietokoneesta, 
todennäköisesti Grubin palautus ei toimi. 

Yritä käynnistää uudelleen ja käynnistää EFI-tilassa tietokoneen BIOSin kautta.

Haluatko yrittää, vaikka onnistumisen todennäköisyys on alhainen? Tätä työkalua tulisi käyttää vain live-tilassa! Tietokoneesi ei ole yhteydessä internetiin, vaihtoehdot 2 ja 3 vaativat internetin toimiakseen. 