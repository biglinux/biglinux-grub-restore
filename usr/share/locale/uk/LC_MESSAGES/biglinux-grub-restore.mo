��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  �  �  =  [  �   �    �  �   �  8  �  �   �   
   f!     q!     }!  d   �!  q   �!  �   Y"  r   �"     P#  ,   X#  ?   �#  B   �#     $     $     $     .$  @   M$     �$  1  �$  F  �%  .   '  Y   C'                                     
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
Language: uk
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Цей інструмент слід використовувати в РЕЖИМІ РЕАЛЬНОГО ЧАСУ для відновлення ЗАГРУЗКИ BigLinux, встановленого на жорсткий диск або SSD.</span>

<span font='12' foreground='red'>Якщо встановлена система завантажується правильно, проблем з завантаженням немає, тому краще не продовжувати роботу з цим інструментом.</span>
<span font='10' foreground='gray'>Також може працювати з іншими дистрибутивами Linux.</span>

Ви хочете продовжити? <span font='16' foreground='LightSkyBlue'>Підтвердіть дані:</span>

<span font='11' foreground='gray'>Режим завантаження:</span> EFI
<span font='11' foreground='gray'>Розділ EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Вибраний розділ:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Вибрана операційна система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат розділу:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID розділу:</span> $UUID_PARTITION

Чи бажаєте продовжити? <span font='16' foreground='LightSkyBlue'>Підтвердіть дані:</span>    

<span font='11' foreground='gray'>Режим завантаження:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Вибраний диск:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Таблиця розділів диска:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Розмір диска:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Вибраний розділ:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Вибрана система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат розділу:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID розділу:</span> $UUID_PARTITION

Бажаєте продовжити? <span font='16' foreground='LightSkyBlue'>Виберіть опцію:</span>

Було знайдено більше однієї роздільної партіції EFI, виберіть, яку використовувати: <span font='16' foreground='LightSkyBlue'>Виберіть опцію:</span>

Було знайдено більше однієї установки Linux на цьому комп'ютері, виберіть, яку саме відновити завантаження: <span font='16' foreground='LightSkyBlue'>Виберіть опцію:</span>

Було знайдено більше одного пристрою зберігання, виберіть, на який записати завантаження: <span font='16' foreground='LightSkyBlue'>Виберіть потрібний варіант:</span>

Відновлення може бути здійснене 3 способами (<span foreground='gray'>Простий, Середній або Повний</span>), якщо у вас є сумніви, спробуйте перший варіант, перезапустіть комп'ютер і переконайтеся, що проблема вирішена.

Якщо проблема залишається, спробуйте інші варіанти. Complete, vykonuje проміжні кроки відновлення, оновлює систему та перевіряє, чи встановлено ядро LTS. Completed! Description Disk Interactive, відкриває термінал всередині вибраної системи. Interactive, відкриває центр керування всередині вибраної системи. Interactive, відкриває менеджер пакунків pamac-manager всередині вибраної системи. Intermediate, reinstalls the grub package on the partition, regenerates the configuration, and updates the initrd. Ім'я No EFI partition selected, process canceled. No Linux installation found on this computer, process canceled. No розділ вибраний, процес скасовано. Option Partition Table Please wait... Restore Boot, Grub, and initrd Simple, just writes the Grub again at the beginning of the disk. Розмір The boot in live mode is using EFI mode, but <span foreground='red'>no EFI partition</span> was found on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in Legacy or BIOS mode through the computer's BIOS.

Do you want to try even with a low probability of success? The boot in live mode is using Legacy mode, also called BIOS, 
<span foreground='red'>but at least one EFI partition was found</span> on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in EFI mode through the computer's BIOS.

Do you want to try even with a low probability of success? This utility should only be used in live mode! Your computer is not connected to the internet, options 2 and 3 require internet to work. 