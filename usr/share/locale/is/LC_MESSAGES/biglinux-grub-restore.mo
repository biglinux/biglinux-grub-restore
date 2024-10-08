��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   c  �   �  �   �  m    r   �  
   �     
       1     >   K  J   �  �   �     j     o  A   �  &   �  	   �               %  ;   C       *  �  Z  �   7   "  X   E"                                     
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
 <span font='12'>Þetta verkfæri ætti að nota í LIVE MODE til að endurheimta BOOT BigLinux sem er uppsett á HD eða SSD.</span>

<span font='12' foreground='red'>Ef uppsetta kerfið er að ræsa rétt, eru engin boot vandamál, svo það er betra að halda ekki áfram með þetta verkfæri.</span>
<span font='10' foreground='gray'>Það gæti einnig virkað með öðrum Linux dreifingum.</span>

Viltu halda áfram? <span font='16' foreground='LightSkyBlue'>Staðfesta gögnin:</span>
    
<span font='11' foreground='gray'>Ræsistilling:</span> EFI
<span font='11' foreground='gray'>EFI skiptimynd:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Valin skiptimynd:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valið kerfi:</span> $SELECTED_OS
<span font='11' foreground='gray'>Skiptimyndarsnið:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID skiptimyndar:</span> $UUID_PARTITION

Viltu halda áfram? <span font='16' foreground='LightSkyBlue'>Staðfesta gögnin:</span>    

<span font='11' foreground='gray'>Ræsistilling:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valin diskur:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskaskiptingartafla:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Stærð disks:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valin skipting:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valið kerfi:</span> $SELECTED_OS
<span font='11' foreground='gray'>Skiptingarform:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID skiptingar:</span> $UUID_PARTITION

Viltu halda áfram? <span font='16' foreground='LightSkyBlue'>Veldu valkost:</span>

Fundust fleiri en eina EFI skiptingu, veldu hvaða á að nota: <span font='16' foreground='LightSkyBlue'>Veldu valkost:</span>

Fundust fleiri en eina Linux uppsetningu á þessum tölvu, veldu hvaða á að endurheimta ræsingu: <span font='16' foreground='LightSkyBlue'>Veldu valkost:</span>

Fleiri en einn geymslutæki fannst, veldu hvaða einn á að skrifa upphafið á: <span font='16' foreground='LightSkyBlue'>Veldu þá valkost sem þú vilt:</span>
        
Endurheimtin er hægt að framkvæma á 3 vegu (<span foreground='gray'>Einfaldur, Millistig, eða Fullkominn</span>), ef þú ert í vafa, reyndu fyrsta valkostinn, endurræstu tölvuna og sjáðu hvort það leysist.

Ef vandamálið heldur áfram, reyndu aðra valkosti. Fullnæging, framkvæmir millistig endurheimtarskref, uppfærir kerfið og athugar hvort LTS kjarni sé uppsettur. Completed! Lýsing Diskur Interactive, opnar terminal inn í valda kerfið. Interactive, opnar stjórnmiðstöðina innan valda kerfisins. Interactive, opnar pakka stjórnunina pamac-manager innan valda kerfisins. מדיום, מתקין מחדש את חבילת grub על המחיצה, מייצר מחדש את הקונפיגורציה, ומעדכן את initrd. Nafn Engin EFI valin, ferlið hætt. Engin Linux uppsetning fannst á þessum tölvu, ferlið aflýst. Engin valin ekki valin, ferlið hætt. Valkostur skiptöflur Vinsamlegast bíðu... Endurðu Boot, Grub og initrd Einfach, schreibt den Grub erneut am Anfang der Festplatte. stærð Boot í lifham í notkun EFI ham, en <span foreground='red'>engin EFI skiptiskipting</span> fannst á þessum tölvu, 
sennilega mun Grub endurheimt ekki virka. 

Reyndu að endurræsa og boot í Legacy eða BIOS ham í gegnum BIOS tölvunnar.

Viltu reyna jafnvel með lága líkurnar á árangri? Boot í lifham í notkun er að nota Legacy ham, einnig kallað BIOS, 
<span foreground='red'>en að minnsta kosti einn EFI skiptipartur fannst</span> á þessum tölvu, 
flest líklegt að Grub endurheimt mun ekki virka. 

Reyndu að endurræsa og boot í EFI ham í gegnum BIOS tölvunnar.

Viltu reyna jafnvel með lága líkurnar á árangri? Þetta verkfæri ætti aðeins að nota í lifandi ham! Þinn tölva er ekki tengd internetinu, valkostir 2 og 3 krafist internet til að virka. 