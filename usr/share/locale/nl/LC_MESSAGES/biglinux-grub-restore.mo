��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   {  �     �   �  Y  i  {   �  	   ?     I     V  ;   ]  D   �  V   �  w   5     �  3   �  E   �  /   ,     \     b     p       F   �     �  h  �  Q  T!  6   �"  Y   �"                                     
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
Language: nl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Deze tool moet worden gebruikt in LIVE MODUS om het BOOT van de BigLinux geïnstalleerd op de HD of SSD te herstellen.</span>

<span font='12' foreground='red'>Als het geïnstalleerde systeem correct opstart, zijn er geen opstartproblemen, dus is het beter om niet verder te gaan met deze tool.</span>
<span font='10' foreground='gray'>Het kan ook werken met andere Linux-distributies.</span>

Wilt u doorgaan? <span font='16' foreground='LightSkyBlue'>Bevestig de gegevens:</span>

<span font='11' foreground='gray'>Opstartmodus:</span> EFI
<span font='11' foreground='gray'>EFI-partitie:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Geselecteerde partitie:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Geselecteerd systeem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitie-indeling:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitie UUID:</span> $UUID_PARTITION

Wilt u doorgaan? <span font='16' foreground='LightSkyBlue'>Bevestig de gegevens:</span>    

<span font='11' foreground='gray'>Opstartmodus:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Geselecteerde schijf:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Schijf partitietabel:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Schijfgrootte:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Geselecteerde partitie:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Geselecteerd systeem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitieformaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitie UUID:</span> $UUID_PARTITION

Wilt u doorgaan? <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de uma partição EFI foi encontrada, selecione qual deseja usar: <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>

Meer dan één Linux-installatie is gevonden op deze computer, selecteer welke u wilt herstellen om op te starten: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de um dispositivo de armazenamento foi encontrado, selecione em qual escrever o boot: <span font='16' foreground='LightSkyBlue'>Selecteer de gewenste optie:</span>

De herstel kan op 3 manieren worden uitgevoerd (<span foreground='gray'>Eenvoudig, Gemiddeld of Compleet</span>), bij twijfel, probeer de eerste optie, start de computer opnieuw op en kijk of het is opgelost.

Als het probleem aanhoudt, probeer dan de andere opties. Completo, realiza as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Voltooid! Beschrijving Schijf Interativo, abre um terminal dentro do sistema selecionado. Interativo, abre o centro de controle dentro do sistema selecionado. Interativo, abre o gerenciador de pacotes pamac-manager dentro do sistema selecionado. Tussenliggend, herinstalleert het grub-pakket op de partitie, genereert de configuratie opnieuw en werkt de initrd bij. Naam Geen EFI-partitie geselecteerd, proces geannuleerd. Geen Linux-installatie gevonden op deze computer, proces geannuleerd. Geen partitie geselecteerd, proces geannuleerd. Optie Partitietabel Even geduld... Herstel Boot, Grub en initrd Eenvoudig, schrijf gewoon de Grub opnieuw aan het begin van de schijf. Grootte De inicialização no modo ao vivo está usando o modo EFI, mas <span foreground='red'>nenhuma partição EFI</span> foi encontrada neste computador, 
provavelmente a restauração do Grub não funcionará. 

Tente reiniciar e inicializar no modo Legacy ou BIOS através do BIOS do computador.

Você deseja tentar mesmo com uma baixa probabilidade de sucesso? De opstart in de live-modus gebruikt Legacy-modus, ook wel BIOS genoemd, maar er is ten minste één EFI-partitie gevonden op deze computer, waarschijnlijk zal het Grub-herstel niet werken.

Probeer opnieuw op te starten en op te starten in EFI-modus via het BIOS van de computer.

Wil je het proberen, zelfs met een lage kans op succes? Deze tool mag alleen worden gebruikt in de live modus! Uw computer is niet verbonden met internet, opties 2 en 3 vereisen internet om te werken. 