Þ            )   ü           ¡    2  ®  E     ô  ¦   x	     
  >  ¶
  q   õ  
   g     r     ~  9     A   ½  P   ÿ  r   P     Ã  ,   È  ?   õ  (   5     ^     e     u       @   £     ä  1  é  F    .   b  Y       ë  '  ú    "  N  £  Ì   ò  õ   ¿  á   µ  Ú       r                 #   Z   0   i      y   õ      o!     õ!  l   ü!     i"  i   ó"     ]#  !   m#     #  1   ¨#  L   Ú#  	   '$  º  1$  »  ì%  ]   ¨'  ª   (                                     
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
 <span font='12'>ãã®ãã¼ã«ã¯ãHDã¾ãã¯SSDã«ã¤ã³ã¹ãã¼ã«ãããBigLinuxã®ãã¼ããå¾©åããããã«LIVEã¢ã¼ãã§ä½¿ç¨ããå¿è¦ãããã¾ãã</span>

<span font='12' foreground='red'>ã¤ã³ã¹ãã¼ã«ãããã·ã¹ãã ãæ­£å¸¸ã«ãã¼ããã¦ããå ´åããã¼ãã®åé¡ã¯ãªãããããã®ãã¼ã«ãä½¿ç¨ããªãæ¹ãè¯ãã§ãã</span>
<span font='10' foreground='gray'>ä»ã®Linuxãã£ã¹ããªãã¥ã¼ã·ã§ã³ã§ãåä½ããå¯è½æ§ãããã¾ãã</span>

ç¶è¡ãã¾ããï¼ <span font='16' foreground='LightSkyBlue'>ãã¼ã¿ãç¢ºèªãã¦ãã ããï¼</span>
    
<span font='11' foreground='gray'>ãã¼ãã¢ã¼ãï¼</span> EFI
<span font='11' foreground='gray'>EFIãã¼ãã£ã·ã§ã³ï¼</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>é¸æãããã¼ãã£ã·ã§ã³ï¼</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>é¸æããã·ã¹ãã ï¼</span> $SELECTED_OS
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ãã©ã¼ãããï¼</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³UUIDï¼</span> $UUID_PARTITION

ç¶è¡ãã¾ããï¼ <span font='16' foreground='LightSkyBlue'>ãã¼ã¿ãç¢ºèªãã¦ãã ããï¼</span>    

<span font='11' foreground='gray'>ãã¼ãã¢ã¼ãï¼</span>  LEGACY/BIOS
<span font='11' foreground='gray'>é¸æããããã£ã¹ã¯ï¼</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>ãã£ã¹ã¯ãã¼ãã£ã·ã§ã³ãã¼ãã«ï¼</span> $DISK_TABLE
    
<span font='11' foreground='gray'>ãã£ã¹ã¯ãµã¤ãºï¼</span> $DISK_SIZE
   
<span font='11' foreground='gray'>é¸æããããã¼ãã£ã·ã§ã³ï¼</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>é¸æãããã·ã¹ãã ï¼</span> $SELECTED_OS
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ãã©ã¼ãããï¼</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³UUIDï¼</span> $UUID_PARTITION

ç¶è¡ãã¾ããï¼ <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æãã¦ãã ããï¼</span>

è¤æ°ã®EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ãããä½¿ç¨ãããã®ãé¸æãã¦ãã ããï¼ <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æãã¦ãã ããï¼</span>

ãã®ã³ã³ãã¥ã¼ã¿ã«ã¯è¤æ°ã®Linuxã¤ã³ã¹ãã¼ã«ãè¦ã¤ããã¾ããããã¼ããå¾©åãããã®ãé¸æãã¦ãã ããï¼ <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æãã¦ãã ããï¼</span>

è¤æ°ã®ã¹ãã¬ã¼ã¸ããã¤ã¹ãè¦ã¤ããã¾ããããã¼ããæ¸ãè¾¼ãããã¤ã¹ãé¸æãã¦ãã ããï¼ <span font='16' foreground='LightSkyBlue'>å¸æãããªãã·ã§ã³ãé¸æãã¦ãã ããï¼</span>
        
å¾©åã¯3ã¤ã®æ¹æ³ã§è¡ããã¨ãã§ãã¾ãï¼<span foreground='gray'>ç°¡åãä¸­éãã¾ãã¯å®å¨</span>ï¼ãè¿·ã£ãå ´åã¯ãæåã®ãªãã·ã§ã³ãè©¦ããã³ã³ãã¥ã¼ã¿ãåèµ·åãã¦åé¡ãè§£æ±ºããããç¢ºèªãã¦ãã ããã

åé¡ãè§£æ±ºããªãå ´åã¯ãä»ã®ãªãã·ã§ã³ãè©¦ãã¦ãã ããã å®äºããä¸­éå¾©åæé ãå®è¡ããã·ã¹ãã ãæ´æ°ããLTSã«ã¼ãã«ãã¤ã³ã¹ãã¼ã«ããã¦ããããç¢ºèªãã¾ãã å®äºãã¾ããï¼ èª¬æ ãã£ã¹ã¯ ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã«ã¿ã¼ããã«ãéãã¾ãã ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã®ã³ã³ãã­ã¼ã«ã»ã³ã¿ã¼ãéãã¾ãã ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã§pamac-managerããã±ã¼ã¸ããã¼ã¸ã£ã¼ãéãã¾ãã ä¸­ç´ããã¼ãã£ã·ã§ã³ã«grubããã±ã¼ã¸ãåã¤ã³ã¹ãã¼ã«ããè¨­å®ãåçæããinitrdãæ´æ°ãã¾ãã åå EFIãã¼ãã£ã·ã§ã³ãé¸æããã¦ããªãããããã­ã»ã¹ã¯ã­ã£ã³ã»ã«ããã¾ããã ãã®ã³ã³ãã¥ã¼ã¿ã«Linuxã®ã¤ã³ã¹ãã¼ã«ãè¦ã¤ããã¾ããã§ããããã­ã»ã¹ã¯ã­ã£ã³ã»ã«ããã¾ããã ãã¼ãã£ã·ã§ã³ãé¸æããã¦ããªãããããã­ã»ã¹ã¯ã­ã£ã³ã»ã«ããã¾ããã ãªãã·ã§ã³ ãã¼ãã£ã·ã§ã³ãã¼ãã« ãå¾ã¡ãã ãã... ãã¼ããGrubãããã³initrdãå¾©åãã ã·ã³ãã«ã«ããã£ã¹ã¯ã®åé ­ã«Grubãååº¦æ¸ãè¾¼ã¿ã¾ãã ãµã¤ãº ã©ã¤ãã¢ã¼ãã§ã®ãã¼ãã¯EFIã¢ã¼ããä½¿ç¨ãã¦ãã¾ããããã®ã³ã³ãã¥ã¼ã¿ã«ã¯<span foreground='red'>EFIãã¼ãã£ã·ã§ã³</span>ãè¦ã¤ããã¾ããã§ãããããããGrubã®å¾©åã¯æ©è½ããªãã§ãããã

ã³ã³ãã¥ã¼ã¿ã®BIOSãéãã¦ã¬ã¬ã·ã¼ã¾ãã¯BIOSã¢ã¼ãã§åèµ·åãã¦ãã¼ããã¦ã¿ã¦ãã ããã

æåã®å¯è½æ§ãä½ãã¦ãè©¦ãã¦ã¿ã¾ããï¼ ã©ã¤ãã¢ã¼ãã§ã®ãã¼ãã¯ã¬ã¬ã·ã¼ã¢ã¼ãï¼BIOSã¨ãå¼ã°ããï¼ãä½¿ç¨ãã¦ãã¾ããããã®ã³ã³ãã¥ã¼ã¿ã«ã¯å°ãªãã¨ã1ã¤ã®EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ããããããããGrubã®å¾©åã¯æ©è½ããªãã§ãããã

ã³ã³ãã¥ã¼ã¿ã®BIOSãéãã¦EFIã¢ã¼ãã§åèµ·åãã¦ãã¼ããã¦ã¿ã¦ãã ããã

æåã®å¯è½æ§ãä½ãã¦ãè©¦ãã¦ã¿ã¾ããï¼ ãã®ã¦ã¼ãã£ãªãã£ã¯ã©ã¤ãã¢ã¼ãã§ã®ã¿ä½¿ç¨ããå¿è¦ãããã¾ãï¼ ããªãã®ã³ã³ãã¥ã¼ã¿ã¯ã¤ã³ã¿ã¼ãããã«æ¥ç¶ããã¦ãã¾ããããªãã·ã§ã³2ã¨3ã¯åä½ããããã«ã¤ã³ã¿ã¼ããããå¿è¦ã§ãã 