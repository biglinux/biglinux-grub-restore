��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   c  �   �  �   �  f  `  {   �     C     O     T  3   Y  =   �  L   �  e        ~  -   �  L   �  )   �     )     /     ?     R  :   p     �  Y  �  q  !  <   "  s   �"                                     
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
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Este utilitário deve ser usado no MODO AO VIVO para restaurar o BOOT do BigLinux instalado no HD ou SSD.</span>

<span font='12' foreground='red'>Se o sistema instalado estiver inicializando corretamente, sem problemas de inicialização, é melhor não prosseguir com este utilitário.</span>
<span font='10' foreground='gray'>Também pode funcionar com outras distribuições Linux.</span>

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Potwierdź dane:</span>

<span font='11' foreground='gray'>Tryb rozruchu:</span> EFI
<span font='11' foreground='gray'>Partycja EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Wybrana partycja:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Wybrany system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partycji:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partycji:</span> $UUID_PARTITION

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Potwierdź dane:</span>    

<span font='11' foreground='gray'>Tryb rozruchu:</span> LEGACY/BIOS
<span font='11' foreground='gray'>Wybrany dysk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela partycji dysku:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Rozmiar dysku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Wybrana partycja:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Wybrany system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partycji:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partycji:</span> $UUID_PARTITION

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znaleziono więcej niż jedną partycję EFI, wybierz, którą chcesz użyć: <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znaleziono więcej niż jedną instalację systemu Linux na tym komputerze, wybierz, którą chcesz przywrócić do uruchamiania: <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znaleziono więcej niż jedno urządzenie przechowywania, wybierz, na którym z nich zapisać rozruch: <span font='16' foreground='LightSkyBlue'>Wybierz pożądaną opcję:</span>

Przywracanie można wykonać na 3 sposoby (<span foreground='gray'>Prosty, Pośredni lub Pełny</span>), w razie wątpliwości spróbuj pierwszej opcji, zrestartuj komputer i sprawdź, czy problem został rozwiązany.

Jeśli problem nadal występuje, spróbuj pozostałych opcji. Completo, realiza as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Concluído! Opis Dysk Interaktywne, otwiera terminal w wybranym systemie. Interaktywne, otwiera centrum sterowania w wybranym systemie. Interaktywne, otwiera menedżer pakietów pamac-manager w wybranym systemie. Intermediário, reinstala o pacote grub na partição, regenera a configuração e atualiza o initrd. Nazwa Brak wybranej partycji EFI, proces anulowany. Nie znaleziono instalacji systemu Linux na tym komputerze, proces anulowany. Brak wybranej partycji, proces anulowany. Opcja Tabela partycji Proszę czekać... Restaurar Boot, Grub e initrd Simplesmente escreva o Grub novamente no início do disco. Rozmiar O boot no modo live está usando o modo EFI, mas <span foreground='red'>nenhuma partição EFI</span> foi encontrada neste computador, 
provavelmente a restauração do Grub não funcionará.

Tente reiniciar e fazer o boot no modo Legacy ou BIOS através da BIOS do computador.

Você deseja tentar mesmo com uma baixa probabilidade de sucesso? Rozruch w trybie live jest wykonywany w trybie Legacy, zwany również BIOS, 
<span foreground='red'>ale na tym komputerze znaleziono co najmniej jedną partycję EFI</span>, 
najprawdopodobniej przywracanie Gruba nie zadziała. 

Spróbuj ponownie uruchomić i uruchomić w trybie EFI przez BIOS komputera.

Czy chcesz spróbować nawet przy niskiej szansie na sukces? To narzędzie powinno być używane tylko w trybie na żywo! Twój komputer nie jest podłączony do internetu, opcje 2 i 3 wymagają połączenia internetowego, aby działać. 