Þ            )   ü           ¡    2  ®  E     ô  ¦   x	     
  >  ¶
  q   õ  
   g     r     ~  9     A   ½  P   ÿ  r   P     Ã  ,   È  ?   õ  (   5     ^     e     u       @   £     ä  1  é  F    .   b  Y       ë  Ø  ú  ,  Ó  Þ     ª   ß  Ä     µ   O              )     @  	   G  @   Q  D     X   ×  s   0     ¤  O   «  c   û  K   _      «      ²       Æ       ç   K   !     T!    [!  Å  ì"  E   ²$     ø$                                     
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
 <span font='12'>ì´ ëêµ¬ë HD ëë SSDì ì¤ì¹ë BigLinuxì ë¶í¸ë¥¼ ë³µìíê¸° ìí´ ë¼ì´ë¸ ëª¨ëìì ì¬ì©í´ì¼ í©ëë¤.</span>

<span font='12' foreground='red'>ì¤ì¹ë ìì¤íì´ ì ìì ì¼ë¡ ë¶íëê³  ìë¤ë©´ ë¶í¸ ë¬¸ì ë ìì¼ë¯ë¡ ì´ ëêµ¬ë¥¼ ì§ííì§ ìë ê²ì´ ì¢ìµëë¤.</span>
<span font='10' foreground='gray'>ë¤ë¥¸ ë¦¬ëì¤ ë°°í¬íììë ìëí  ì ììµëë¤.</span>

ì§ííìê² ìµëê¹? <span font='16' foreground='LightSkyBlue'>ë°ì´í°ë¥¼ íì¸íì­ìì¤:</span>
    
<span font='11' foreground='gray'>ë¶í ëª¨ë:</span> EFI
<span font='11' foreground='gray'>EFI íí°ì:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>ì íí íí°ì:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>ì íí ìì¤í:</span> $SELECTED_OS
<span font='11' foreground='gray'>íí°ì íì:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>íí°ì UUID:</span> $UUID_PARTITION

ê³ìíìê² ìµëê¹? <span font='16' foreground='LightSkyBlue'>ë°ì´í°ë¥¼ íì¸íì­ìì¤:</span>    

<span font='11' foreground='gray'>ë¶í ëª¨ë:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>ì íí ëì¤í¬:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>ëì¤í¬ íí°ì íì´ë¸:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>ëì¤í¬ í¬ê¸°:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>ì íí íí°ì:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>ì íí ìì¤í:</span> $SELECTED_OS
<span font='11' foreground='gray'>íí°ì íì:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>íí°ì UUID:</span> $UUID_PARTITION

ê³ìíìê² ìµëê¹? <span font='16' foreground='LightSkyBlue'>ìµìì ì ííì¸ì:</span>

ì¬ë¬ ê°ì EFI íí°ìì´ ë°ê²¬ëììµëë¤. ì¬ì©í  íí°ìì ì ííì¸ì: <span font='16' foreground='LightSkyBlue'>ìµìì ì ííì¸ì:</span>

ì´ ì»´í¨í°ìì ì¬ë¬ ê°ì Linux ì¤ì¹ê° ë°ê²¬ëììµëë¤. ë¶íì ë³µìí  í­ëª©ì ì ííì¸ì: <span font='16' foreground='LightSkyBlue'>ìµìì ì ííì¸ì:</span>
    
ì¬ë¬ ê°ì ì ì¥ ì¥ì¹ê° ë°ê²¬ëììµëë¤. ë¶í¸ë¥¼ ê¸°ë¡í  ì¥ì¹ë¥¼ ì ííì¸ì: <span font='16' foreground='LightSkyBlue'>ìíë ìµìì ì ííì¸ì:</span>
        
ë³µìì 3ê°ì§ ë°©ë²ì¼ë¡ ìíí  ì ììµëë¤ (<span foreground='gray'>ê°ë¨, ì¤ê° ëë ìì </span>), íì¤íì§ ìì ê²½ì° ì²« ë²ì§¸ ìµìì ìëíê³  ì»´í¨í°ë¥¼ ì¬ììíì¬ ë¬¸ì ê° í´ê²°ëìëì§ íì¸íì¸ì.

ë¬¸ì ê° ì§ìëë©´ ë¤ë¥¸ ìµìì ìëíì¸ì. ìë£ëë©´ ì¤ê° ë³µì ë¨ê³ë¥¼ ìííê³ , ìì¤íì ìë°ì´í¸íë©°, LTS ì»¤ëì´ ì¤ì¹ëì´ ìëì§ íì¸í©ëë¤. ìë£ëììµëë¤! ì¤ëª ëì¤í¬ ëíí, ì íí ìì¤í ë´ìì í°ë¯¸ëì ì½ëë¤. ëíí, ì íí ìì¤í ë´ìì ì ì´ ì¼í°ë¥¼ ì½ëë¤. ëíí, ì íí ìì¤í ë´ìì pamac-manager í¨í¤ì§ ê´ë¦¬ìë¥¼ ì½ëë¤. ì¤ê°, íí°ìì grub í¨í¤ì§ë¥¼ ì¬ì¤ì¹íê³ , êµ¬ì±ì ì¬ìì±íë©°, initrdë¥¼ ìë°ì´í¸í©ëë¤. ì´ë¦ ì íë EFI íí°ìì´ ììµëë¤. íë¡ì¸ì¤ê° ì·¨ìëììµëë¤. ì´ ì»´í¨í°ìì Linux ì¤ì¹ë¥¼ ì°¾ì ì ììµëë¤. íë¡ì¸ì¤ê° ì·¨ìëììµëë¤. ì íë íí°ìì´ ììµëë¤. íë¡ì¸ì¤ê° ì·¨ìëììµëë¤. ìµì íí°ì íì´ë¸ ì ìë§ ê¸°ë¤ë ¤ ì£¼ì¸ì... ë¶í¸, ê·¸ë½ ë° initrd ë³µì ê°ë¨íê², ëì¤í¬ì ìì ë¶ë¶ì Grubì ë¤ì ìì±í©ëë¤. í¬ê¸° ë¼ì´ë¸ ëª¨ëìì ë¶íì EFI ëª¨ëë¥¼ ì¬ì©íê³  ìì§ë§, ì´ ì»´í¨í°ìì <span foreground='red'>EFI íí°ì</span>ì´ ë°ê²¬ëì§ ìììµëë¤. 
ëë¶ë¶ì ê²½ì° Grub ë³µìì´ ìëíì§ ìì ê²ìëë¤. 

ì»´í¨í°ì BIOSë¥¼ íµí´ ë ê±°ì ëë BIOS ëª¨ëë¡ ë¤ì ììíê³  ë¶íí´ ë³´ì­ìì¤.

ì±ê³µ íë¥ ì´ ë®ëë¼ë ìëíìê² ìµëê¹? ë¼ì´ë¸ ëª¨ëìì ë¶íì ë ê±°ì ëª¨ëë¥¼ ì¬ì©íê³  ìì¼ë©°, ì´ë BIOSë¼ê³ ë í©ëë¤. 
<span foreground='red'>íì§ë§ ì´ ì»´í¨í°ìì ì ì´ë íëì EFI íí°ìì´ ë°ê²¬ëììµëë¤.</span> 
ëë¶ë¶ì ê²½ì° Grub ë³µêµ¬ê° ìëíì§ ìì ê²ìëë¤. 

ì»´í¨í°ì BIOSë¥¼ íµí´ EFI ëª¨ëë¡ ì¬ììíê³  ë¶íí´ ë³´ì­ìì¤.

ì±ê³µ íë¥ ì´ ë®ììë ë¶êµ¬íê³  ìëíìê² ìµëê¹? ì´ ì í¸ë¦¬í°ë ë¼ì´ë¸ ëª¨ëììë§ ì¬ì©í´ì¼ í©ëë¤! ê·íì ì»´í¨í°ë ì¸í°ë·ì ì°ê²°ëì´ ìì§ ìì¼ë©°, ìµì 2ì 3ì ìëíë ¤ë©´ ì¸í°ë·ì´ íìí©ëë¤. 