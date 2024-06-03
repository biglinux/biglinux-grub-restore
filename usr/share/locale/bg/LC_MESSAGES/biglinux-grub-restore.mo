��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  �  �  r  n  �   �    �    �    �  �   �      �!     �!     �!  ]   �!  n   6"  w   �"  �   #     �#  O   �#  |   $  G   �$  
   �$  *   �$     %  6   1%  T   h%     �%  (  �%  $  �'  u   *  �   �*                                     
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
Language: bg
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Този инструмент трябва да се използва в РЕЖИМ НА ЖИВО, за да се възстанови ЗАГРЕВАНЕТО на BigLinux, инсталирано на твърдия диск или SSD устройство.</span>

<span font='12' foreground='red'>Ако инсталираната система се стартира правилно и няма проблеми със стартирането, по-добре е да не продължавате с този инструмент.</span>
<span font='10' foreground='gray'>Той може да работи и с други дистрибуции на Linux.</span>

Искате ли да продължите? <span font='16' foreground='LightSkyBlue'>Потвърдете данните:</span>

<span font='11' foreground='gray'>Режим на зареждане:</span> EFI
<span font='11' foreground='gray'>EFI раздел:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Избран раздел:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Избрана операционна система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат на раздела:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID на раздела:</span> $UUID_PARTITION

Искате ли да продължите? <span font='16' foreground='LightSkyBlue'>Потвърдете данните:</span>    

<span font='11' foreground='gray'>Режим на стартиране:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Избран диск:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Таблица с разделите на диска:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Размер на диска:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Избран раздел:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Избрана операционна система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат на раздела:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID на раздела:</span> $UUID_PARTITION

Искате ли да продължите? <span font='16' foreground='LightSkyBlue'>Изберете опция:</span>

Бяха намерени повече от един EFI раздел, изберете кой да използвате: <span font='16' foreground='LightSkyBlue'>Изберете опция:</span>

Бяха намерени повече от една инсталации на Linux на този компютър, изберете коя да възстановите за стартиране: <span font='16' foreground='LightSkyBlue'>Изберете опция:</span>

Беше намерено повече от един устройство за съхранение, изберете на което да запишете стартиращия файл: <span font='16' foreground='LightSkyBlue'>Изберете желаната опция:</span>

Възстановяването може да се извърши по 3 начина (<span foreground='gray'>Прост, Среден или Пълен</span>), ако имате съмнения, опитайте първата опция, рестартирайте компютъра и вижте дали проблемът е решен.

Ако проблемът продължава, опитайте другите опции. Изпълнява средните стъпки за възстановяване, актуализира системата и проверява дали е инсталирано LTS ядро. Приключено! Описание диск Интерактивен, отваря терминал в избраната система. Интерактивно, отваря контролния център в избраната система. Интерактивно, отваря мениджъра на пакети pamac в избраната система. Intermediate, преинсталира пакета grub на раздела, регенерира конфигурацията и актуализира initrd. Име Липсва избран раздел EFI, процесът е отменен. Не е намерена инсталация на Linux на този компютър, процесът е отменен. Няма избран раздел, процесът е отменен. Опция Таблица с разделенията Моля, изчакайте... Възстановяване на Boot, Grub и initrd Просто запишете Grub отново в началото на диска. Размер Стартирането в режим на живо използва EFI режим, но <span foreground='red'>не беше намерен EFI раздел</span> на този компютър, 
най-вероятно възстановяването на Grub няма да работи.

Опитайте да рестартирате и стартирате в Легаси или BIOS режим чрез BIOS на компютъра.

Искате ли да опитате, въпреки ниската вероятност от успех? Стартирането в режим на живо използва Legacy режим, наречен също и BIOS, но е намерен поне един EFI раздел на този компютър, най-вероятно възстановяването на Grub няма да работи.

Опитайте да рестартирате и да стартирате в режим EFI чрез BIOS на компютъра.

Искате ли да опитате, въпреки ниската вероятност за успех? Тази помощна програма трябва да се използва само в реално време! Вашият компютър не е свързан с интернет, опциите 2 и 3 изискват интернет за работа. 