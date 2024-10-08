��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  y  �  D  %  �   j    /  �   E  Q  ;  �   �      W!     k!     |!  o   �!  ~   �!  �   t"  �   #     �#  D   �#  o   $  @   q$  
   �$     �$  +   �$  ;   	%  M   E%     �%    �%  J  �'     *  �   �*                                     
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
 <span font='12'>Этот инструмент следует использовать в РЕАЛЬНОМ РЕЖИМЕ для восстановления ЗАГРУЗКИ BigLinux, установленного на HDD или SSD.</span>

<span font='12' foreground='red'>Если установленная система загружается корректно, проблем с загрузкой нет, поэтому лучше не продолжать с этим инструментом.</span>
<span font='10' foreground='gray'>Он также может работать с другими дистрибутивами Linux.</span>

Вы хотите продолжить? <span font='16' foreground='LightSkyBlue'>Подтвердите данные:</span>
    
<span font='11' foreground='gray'>Режим загрузки:</span> EFI
<span font='11' foreground='gray'>EFI раздел:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Выбранный раздел:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Выбранная система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат раздела:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID раздела:</span> $UUID_PARTITION

Вы хотите продолжить? <span font='16' foreground='LightSkyBlue'>Подтвердите данные:</span>    

<span font='11' foreground='gray'>Режим загрузки:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Выбранный диск:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Таблица разделов диска:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Размер диска:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Выбранный раздел:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Выбранная система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат раздела:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID раздела:</span> $UUID_PARTITION

Вы хотите продолжить? <span font='16' foreground='LightSkyBlue'>Выберите вариант:</span>

Найдено более одного раздела EFI, выберите, какой использовать: <span font='16' foreground='LightSkyBlue'>Выберите вариант:</span>

На этом компьютере обнаружено более одной установки Linux, выберите, какую из них восстановить для загрузки: <span font='16' foreground='LightSkyBlue'>Выберите вариант:</span>
    
Найдено более одного устройства хранения, выберите, на какое из них записать загрузку: <span font='16' foreground='LightSkyBlue'>Выберите желаемый вариант:</span>
        
Восстановление можно выполнить тремя способами (<span foreground='gray'>Простой, Промежуточный или Полный</span>), если вы сомневаетесь, попробуйте первый вариант, перезагрузите компьютер и посмотрите, решена ли проблема.

Если проблема сохраняется, попробуйте другие варианты. Завершает, выполняет промежуточные шаги восстановления, обновляет систему и проверяет, установлен ли ядро LTS. Завершено! Описание Диск Интерактивный, открывает терминал внутри выбранной системы. Интерактивный, открывает центр управления внутри выбранной системы. Интерактивный, открывает менеджер пакетов pamac-manager внутри выбранной системы. Промежуточный, переустанавливает пакет grub на разделе, регенерирует конфигурацию и обновляет initrd. Имя Не выбрана EFI-раздел, процесс отменен. На этом компьютере не найдена установка Linux, процесс отменен. Не выбрана раздел, процесс отменен. Опция Таблица разделов Пожалуйста, подождите... Восстановить загрузчик, Grub и initrd Просто снова записывает Grub в начале диска. Размер Загрузка в живом режиме осуществляется в режиме EFI, но <span foreground='red'>EFI-раздел</span> не найден на этом компьютере, 
скорее всего, восстановление Grub не сработает. 

Попробуйте перезагрузить и загрузиться в режиме Legacy или BIOS через BIOS компьютера.

Хотите попробовать, даже с низкой вероятностью успеха? Загрузка в живом режиме использует режим Legacy, также называемый BIOS, 
<span foreground='red'>но на этом компьютере была найдена как минимум одна EFI-раздел</span>, 
скорее всего, восстановление Grub не сработает. 

Попробуйте перезагрузить и загрузиться в режиме EFI через BIOS компьютера.

Хотите попробовать, даже с низкой вероятностью успеха? Эта утилита должна использоваться только в режиме реального времени! Ваш компьютер не подключен к интернету, варианты 2 и 3 требуют подключения к интернету для работы. 