��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  @  �  �   �  �   c  �   
  >  �  �   �     �     �     �  s   �  �   2  �   �  r   D     �  F   �  t      M   {   
   �      �   *   �   )   !  K   I!     �!  [  �!  g  �#  .   f&  �   �&                                     
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
 <span font='12'>This tool should be used in LIVE MODE to restore the BOOT of the BigLinux installed on the HD or SSD.</span>

<span font='12' foreground='red'>If the installed system is booting correctly, there are no boot problems, so it's better not to proceed with this tool.</span>
<span font='10' foreground='gray'>It may also work with other Linux distributions.</span>

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Confirm the data:</span>
    
<span font='11' foreground='gray'>Boot mode:</span> EFI
<span font='11' foreground='gray'>EFI partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Selected partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Підтвердіть дані:</span>    

<span font='11' foreground='gray'>Режим завантаження:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Вибраний диск:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Таблиця розділів диска:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Розмір диска:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Вибраний розділ:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Вибрана система:</span> $SELECTED_OS
<span font='11' foreground='gray'>Формат розділу:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID розділу:</span> $UUID_PARTITION

Ви хочете продовжити? <span font='16' foreground='LightSkyBlue'>Select an option:</span>

More than one EFI partition was found, select which one to use: <span font='16' foreground='LightSkyBlue'>Select an option:</span>

More than one Linux installation was found on this computer, select which one to restore the boot: <span font='16' foreground='LightSkyBlue'>Select an option:</span>
    
More than one storage device was found, select which one to write the boot to: <span font='16' foreground='LightSkyBlue'>Select the desired option:</span>
        
The restore can be done in 3 ways (<span foreground='gray'>Simple, Intermediate, or Complete</span>), if in doubt, try the first option, restart the computer and see if it is resolved.

If the problem persists, try the other options. Завершено, виконує проміжні кроки відновлення, оновлює систему та перевіряє, чи встановлено ядро LTS. Завершено! Опис Диск Інтерактивний, відкриває термінал всередині вибраної системи. Інтерактивний, відкриває центр керування всередині вибраної системи. Інтерактивний, відкриває менеджер пакетів pamac-manager всередині вибраної системи. Intermediary, reinstalls the grub package on the partition, regenerates the configuration, and updates the initrd. Ім'я Не вибрано розділ EFI, процес скасовано. Не знайдено установку Linux на цьому комп'ютері, процес скасовано. Не вибрано жоден розділ, процес скасовано. Опція Таблиця розділів Будь ласка, зачекайте... Відновити Boot, Grub та initrd Просто знову записує Grub на початку диска. Розмір Завантаження в режимі живого середовища використовує режим EFI, але <span foreground='red'>не було знайдено EFI-розділу</span> на цьому комп'ютері, 
найімовірніше, відновлення Grub не спрацює. 

Спробуйте перезавантажити комп'ютер і завантажитися в режимі Legacy або BIOS через BIOS комп'ютера.

Чи хочете ви спробувати, навіть з низькою ймовірністю успіху? Завантаження в живому режимі використовує режим Legacy, також відомий як BIOS, 
<span foreground='red'>але на цьому комп'ютері знайдено принаймні один EFI-розділ</span>, 
найімовірніше, відновлення Grub не спрацює. 

Спробуйте перезавантажити комп'ютер і завантажитися в режимі EFI через BIOS комп'ютера.

Ви хочете спробувати, навіть з низькою ймовірністю успіху? This utility should only be used in live mode! Ваш комп'ютер не підключений до інтернету, варіанти 2 та 3 потребують інтернету для роботи. 