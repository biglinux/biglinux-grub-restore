��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  =  �  �   :  �    �   �  �   S  �     L  �  {   �     _     g     p  1   u  :   �  I   �  e   ,     �  8   �  B   �  %        9     A     N     ]  4   y     �  1  �  \  �  9   E   ^                                         
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
Language: is
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 Þessi tól ætti að nota í LIVE HAM til að endurheimta BOOT af BigLinux sett á HD eða SSD.

Ef uppsetta kerfið er að ræsa rétt, eru engin vandamál með ræsingu, þannig að það er betra að ekki halda áfram með þetta tól.
Það gæti líka virkað með öðrum Linux dreifingum.

Viltu halda áfram? Staðfestu gögnin:

Upphafsstilling: EFI
EFI skipting: $EFI_PARTITION

Valin skipting: $SELECTED_PARTITION
Valið kerfi: $SELECTED_OS
Skipting snið: $PARTITION_FORMAT
Skipting UUID: $UUID_PARTITION

Viltu halda áfram? <span font='16' foreground='LightSkyBlue'>Staðfestu gögnin:</span>    

<span font='11' foreground='gray'>Upphafsstilling:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valin diskur:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskaskiptingartöfla:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Diskastærð:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valin skipting:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valið kerfi:</span> $SELECTED_OS
<span font='11' foreground='gray'>Skipting snið:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Skipting UUID:</span> $UUID_PARTITION

Viltu halda áfram? <span font='16' foreground='LightSkyBlue'>בחר אפשרות:</span>

נמצאו יותר מפרטי EFI אחד, בחר איזה להשתמש: <span font='16' foreground='LightSkyBlue'>Veljaðu möguleika:</span>

Fannst meira en ein Linux uppsetning á þessum tölvu, veldu þá sem á að endurheimta ræsibúnaðinn: <span font='16' foreground='LightSkyBlue'>Veljaðu möguleika:</span>

Fannst meira en ein geymsla, veldu hvaða þú vilt skrifa ræsiskrá á: <span font='16' foreground='LightSkyBlue'>Veljið þátttöku:</span>

Endurheimt er hægt að gera á 3 vegu (<span foreground='gray'>Einfalt, Miðlungs eða Fullkominn</span>), ef þú ert í vafa, reyndu fyrsta valið, endurræstðu tölvuna og sjáðu hvort vandamálið sé leyst.

Ef vandamálið varir, reyndu aðra valkosti. Completo, executa as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Lokið! Leírás Disk Interaktív, opnar einn skel inni í valda kerfi. Interaktív, opnar stjórnborðið innan valins kerfisins. Interaktívur, opnar pamac-manager pakka stjórnanda inni í valda kerfi. Intermediário, reinstala o pacote grub na partição, regenera a configuração e atualiza o initrd. שם אין מחיצת EFI נבחרה, התהליך בוטל. Engin Linux uppsetning fannst ekki á þessum tölvu, ferli hætt. Engin valinnut osiota, ferlið hætt. Valmynd Töflaöflun Please wait... Endur Boot, Grub, og initrd Einfalt, bara skrifar Grub aftur í byrjun disksins. Stærð The boot in live mode is using EFI mode, but <span foreground='red'>no EFI partition</span> was found on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in Legacy or BIOS mode through the computer's BIOS.

Do you want to try even with a low probability of success? Käynnistys live-tilassa käyttää Legacy-tilaa, jota kutsutaan myös BIOS: ksi, mutta tällä tietokoneella löytyi vähintään yksi EFI-osio, todennäköisesti Grubin palautus ei toimi.

Yritä käynnistää uudelleen ja käynnistää EFI-tilassa tietokoneen BIOSin kautta.

Haluatko yrittää, vaikka onnistumisen todennäköisyys olisi pieni? Þessi tól ætti aðeins að vera notað í beinum hám! Tölvan þín er ekki tengd við netið, valmöguleikar 2 og 3 krefjast netsins til að virka. 