��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �     �   �  r  |  u   �     e     q     v  ;   {  =   �  U   �  c   K     �  +   �  L   �  '   .     V     \     l       <   �     �  b  �  �  F!  <   �"  r   #                                     
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
 <span font='12'>To narzędzie powinno być używane w TRYBIE NA ŻYWO, aby przywrócić BOOT BigLinux zainstalowanego na HD lub SSD.</span>

<span font='12' foreground='red'>Jeśli zainstalowany system uruchamia się poprawnie, nie ma problemów z uruchamianiem, więc lepiej nie kontynuować korzystania z tego narzędzia.</span>
<span font='10' foreground='gray'>Może również działać z innymi dystrybucjami Linuksa.</span>

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Potwierdź dane:</span>
    
<span font='11' foreground='gray'>Tryb rozruchu:</span> EFI
<span font='11' foreground='gray'>Partycja EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Wybrana partycja:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Wybrany system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partycji:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partycji:</span> $UUID_PARTITION

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Potwierdź dane:</span>    

<span font='11' foreground='gray'>Tryb rozruchu:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Wybrany dysk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela partycji dysku:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Rozmiar dysku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Wybrana partycja:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Wybrany system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partycji:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partycji:</span> $UUID_PARTITION

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znaleziono więcej niż jedną partycję EFI, wybierz, którą chcesz użyć: <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znaleziono więcej niż jedną instalację systemu Linux na tym komputerze, wybierz, którą chcesz przywrócić do rozruchu: <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>
    
Znaleziono więcej niż jedno urządzenie pamięci, wybierz, na którym chcesz zapisać rozruch: <span font='16' foreground='LightSkyBlue'>Wybierz żądaną opcję:</span>
        
Przywracanie można wykonać na 3 sposoby (<span foreground='gray'>Prosty, Średni lub Pełny</span>), w razie wątpliwości spróbuj pierwszej opcji, uruchom ponownie komputer i sprawdź, czy problem został rozwiązany.

Jeśli problem będzie się utrzymywał, spróbuj innych opcji. Ukończono, wykonuje pośrednie kroki przywracania, aktualizuje system i sprawdza, czy jądro LTS jest zainstalowane. Ukończono! Opis Dysk Interaktywny, otwiera terminal wewnątrz wybranego systemu. Interaktywny, otwiera centrum sterowania w wybranym systemie. Interaktywny, otwiera menedżera pakietów pamac-manager wewnątrz wybranego systemu. Średni, ponownie instaluje pakiet grub na partycji, regeneruje konfigurację i aktualizuje initrd. Nazwa Nie wybrano partycji EFI, proces anulowany. Nie znaleziono instalacji systemu Linux na tym komputerze, proces anulowany. Nie wybrano partycji, proces anulowany. Opcja Tabela partycji Proszę czekać... Przywróć Boot, Grub i initrd Prosto, po prostu zapisuje Grub ponownie na początku dysku. Rozmiar Uruchomienie w trybie na żywo korzysta z trybu EFI, ale <span foreground='red'>nie znaleziono partycji EFI</span> na tym komputerze, 
najprawdopodobniej przywracanie Gruba nie zadziała. 

Spróbuj ponownie uruchomić komputer i uruchomić w trybie Legacy lub BIOS przez BIOS komputera.

Czy chcesz spróbować mimo niskiego prawdopodobieństwa sukcesu? Uruchomienie w trybie na żywo korzysta z trybu Legacy, znanego również jako BIOS, 
<span foreground='red'>ale na tym komputerze znaleziono przynajmniej jedną partycję EFI</span>, 
najprawdopodobniej przywracanie Gruba nie zadziała. 

Spróbuj ponownie uruchomić i uruchomić w trybie EFI przez BIOS komputera.

Czy chcesz spróbować, mimo niskiego prawdopodobieństwa sukcesu? To narzędzie powinno być używane tylko w trybie na żywo! Twój komputer nie jest połączony z internetem, opcje 2 i 3 wymagają połączenia z internetem, aby działały. 