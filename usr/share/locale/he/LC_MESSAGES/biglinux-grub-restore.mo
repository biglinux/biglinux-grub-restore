Þ            )   ü           ¡    2  ®  E     ô  ¦   x	     
  >  ¶
  q   õ  
   g     r     ~  9     A   ½  P   ÿ  r   P     Ã  ,   È  ?   õ  (   5     ^     e     u       @   £     ä  1  é  F    .   b  Y       ë  í  ü  I  ê    4     9  º   É  ª     ¦  /     Ö     V  
   b     m  Q   v  ]   È  o   &  e        ü  6      H   8   4         ¶      Ã      Ù      ð   D   !     U!  k  ^!    Ê"  B   M$     $                                     
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
Language: he
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>××× ×× ×¦×¨×× ×××©×ª××© ×××¦× ×× ××× ××©×××¨ ××ª ×××ª××× ×©× BigLinux ××××ª×§× ×¢× ××××¡×§ ××§×©×× ×× SSD.</span>

<span font='12' foreground='red'>×× ×××¢×¨××ª ××××ª×§× ×ª ×××ª×××ª ××¨×××, ××× ××¢×××ª ××ª×××, ×× ×©×××× ×©×× ××××©×× ×¢× ××× ××.</span>
<span font='10' foreground='gray'>×× ×¢×©×× ×× ××¢××× ×¢× ××¤×¦××ª Linux ×××¨××ª.</span>

××× ××¨×¦×× × ××××©××? <span font='16' foreground='LightSkyBlue'>××©×¨ ××ª ×× ×ª×× ××:</span>

<span font='11' foreground='gray'>××¦× ×××¤×¢××:</span> EFI
<span font='11' foreground='gray'>××××¦×ª EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>×××××¦× ×©× ×××¨×:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>×××¢×¨××ª ×©× ×××¨×:</span> $SELECTED_OS
<span font='11' foreground='gray'>×¤××¨×× ×××××¦×:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID ×©× ×××××¦×:</span> $UUID_PARTITION

××× ××¨×¦×× × ××××©××? <span font='16' foreground='LightSkyBlue'>××©×¨ ××ª ×× ×ª×× ××:</span>    

<span font='11' foreground='gray'>××¦× ××¤×¢××:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>×××¡×§ ×©× ×××¨:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>××××ª ××××¦×ª ××××¡×§:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>×××× ××××¡×§:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>×××××¦× ×©× ×××¨×:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>×××¢×¨××ª ×©× ×××¨×:</span> $SELECTED_OS
<span font='11' foreground='gray'>×¤××¨×× ×××××¦×:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID ×©× ×××××¦×:</span> $UUID_PARTITION

××× ××¨×¦×× × ××××©××? <span font='16' foreground='LightSkyBlue'>×××¨ ××¤×©×¨××ª:</span>

× ××¦×× ×××ª×¨ ××¤×¨×× EFI ×××, ×××¨ ×××× ×××©×ª××©: <span font='16' foreground='LightSkyBlue'>×××¨ ××¤×©×¨××ª:</span>

× ××¦×× ×××ª×¨ ×××ª×§× ××ª ×××ª ×©× Linux ××××©× ××, ×××¨ ×××× ××©×××¨ ××ª ×××ª×××: <span font='16' foreground='LightSkyBlue'>×××¨ ××¤×©×¨××ª:</span>

× ××¦×× ×××ª×¨ ××××©××¨ ×××¡×× ×××, ×××¨ ××××× ×××ª×× ××ª ×××ª×××: <span font='16' foreground='LightSkyBlue'>×××¨ ××ª ×××¤×©×¨××ª ××¨×¦×××:</span>

××©××××¨ × ××ª× ××××¦××¢ ×-3 ××¨××× (<span foreground='gray'>×¤×©××, ××× ×× × ×× ×××</span>), ×× ××© ×¡×¤×§, × ×¡× ××ª ×××¤×©×¨××ª ××¨××©×× ×, ××¤×¢× ××××© ××ª ××××©× ×××××§ ××× ×××¢×× × ×¤×ª×¨×.

×× ×××¢×× ×××©×××, × ×¡× ××ª ×××¤×©×¨××××ª ××××¨××ª. Completar, executar as etapas de restauraÃ§Ã£o intermediÃ¡ria, atualizar o sistema e verificar se o kernel LTS estÃ¡ instalado. ×××©××! ×ª××××¨ ××× × ××× ××¨××§××××, ×¤××ª× ××¨××× × ××ª×× ×××¢×¨××ª ×©× ×××¨×. ××× ××¨××§××××, ×¤××ª× ××ª ××¨×× ×××§×¨× ××ª×× ×××¢×¨××ª ×©× ×××¨×. ××× ××¨××§××××, ×¤××ª× ××ª ×× ×× ×××××××ª pamac-manager ××ª×× ×××¢×¨××ª ×©× ×××¨×. IntermediÃ¡rio, reinstala o pacote grub na partiÃ§Ã£o, regenera a configuraÃ§Ã£o e atualiza o initrd. ×©× ×× × ×××¨× ××××¦×ª EFI, ××ª×××× ××××. ×× × ××¦×× ××ª×§× ×ª Linux ××××©× ××, ××ª×××× ××××. ××× ××××¦× × ×××¨×, ××ª×××× ××××. ××¤×©×¨××ª ××××ª ××××¦××ª ×××ª× ×××§×©×... ×©××××¨ Boot, Grub ×-initrd ×¤×©××, ×¨×§ ××ª×× ×©×× ××ª ×-Grub ××ª××××ª ××××¡×§. ×××× ×××ª××× ×××¦× ×× ××©×ª××© ×××¦× EFI, ×× <span foreground='red'>×× × ××¦×× ××××¦×ª EFI</span> ××××©× ××, ×× ×¨×× ×©×©××××¨ ×-Grub ×× ××¢×××.

× ×¡× ×××ª×× ××××© ××××¤×¢×× ×××¦× ×××¡××¨× ×× BIOS ××¨× BIOS ×©× ××××©×.

××× ××¨×¦×× × ×× ×¡××ª ×× ×¢× ×¡×××× × ××× ×××¦×××? ×××ª××× ×××¦× ×× ××©×ª××© ×××¦× ×××¡×, ×× ×§×¨× ×× BIOS, 
<span foreground='red'>×× × ××¦×× ××¤×××ª ××××¦×ª EFI ×××ª</span> ××××©× ××, 
×× ×¨×× ×©×©××××¨ ×-Grub ×× ××¢×××.

× ×¡× ×××ª×× ××××© ××××¤×¢×× ×××¦× EFI ××¨× BIOS ×©× ××××©×.

××× ××¨×¦×× × ×× ×¡××ª ×× ×¢× ×¡×××× × ××× ×××¦×××? ×××× ×× ×¦×¨×× ×××××ª ××©××××© ×¨×§ ×××¦× ××! ××××©× ×©×× ××× × ×××××¨ ×××× ××¨× ×, ×××¤×©×¨××××ª 2 ×-3 ×××¨×©××ª ×××××¨ ×××× ××¨× × ××× ××¢×××. 