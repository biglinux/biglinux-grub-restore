Þ            )   ü           ¡    2  ®  E     ô  ¦   x	     
  >  ¶
  q   õ  
   g     r     ~  9     A   ½  P   ÿ  r   P     Ã  ,   È  ?   õ  (   5     ^     e     u       @   £     ä  1  é  F    .   b  Y       ë  +  ü  U  (  *  ~  Å   ©  Þ   o  Ë   N  ñ    {                    Z   ¨  l      [   p   e   Ì      2!  j   9!     ¤!  3   1"     e"  !   u"     "     °"  4   Î"  	   #  N  #  0  \$  ]   %     ë%                                     
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
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>ãã®ãã¼ã«ã¯ãHDã¾ãã¯SSDã«ã¤ã³ã¹ãã¼ã«ãããBigLinuxã®BOOTãå¾©åããããã«LIVEã¢ã¼ãã§ä½¿ç¨ããå¿è¦ãããã¾ãã</span>

<span font='12' foreground='red'>ã¤ã³ã¹ãã¼ã«ãããã·ã¹ãã ãæ­£å¸¸ã«èµ·åãã¦ããå ´åããã¼ãã®åé¡ã¯ããã¾ããã®ã§ããã®ãã¼ã«ãå®è¡ããªãæ¹ãè¯ãã§ãããã</span>
<span font='10' foreground='gray'>ä»ã®Linuxãã£ã¹ããªãã¥ã¼ã·ã§ã³ã§ãæ©è½ããå ´åãããã¾ãã</span>

ç¶è¡ãã¾ããï¼ <span font='16' foreground='LightSkyBlue'>ãã¼ã¿ãç¢ºèªãã¾ã:</span>

<span font='11' foreground='gray'>ãã¼ãã¢ã¼ã:</span> EFI
<span font='11' foreground='gray'>EFIãã¼ãã£ã·ã§ã³:</span> $EFI_PARTITION

<span font='11' foreground='gray'>é¸æãããã¼ãã£ã·ã§ã³:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>é¸æããã·ã¹ãã :</span> $SELECTED_OS
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³å½¢å¼:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³UUID:</span> $UUID_PARTITION

ç¶è¡ãã¾ããï¼ <span font='16' foreground='LightSkyBlue'>ãã¼ã¿ãç¢ºèªãã¾ã:</span>    

<span font='11' foreground='gray'>ãã¼ãã¢ã¼ã:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>é¸æãããã£ã¹ã¯:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>ãã£ã¹ã¯ãã¼ãã£ã·ã§ã³ãã¼ãã«:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>ãã£ã¹ã¯ãµã¤ãº:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>é¸æãããã¼ãã£ã·ã§ã³:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>é¸æããã·ã¹ãã :</span> $SELECTED_OS
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ãã©ã¼ããã:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³UUID:</span> $UUID_PARTITION

ç¶è¡ãã¾ããï¼ <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æ:</span>

è¤æ°ã®EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ãããä½¿ç¨ãããã¼ãã£ã·ã§ã³ãé¸æãã¦ãã ãã: <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æ:</span>

ãã®ã³ã³ãã¥ã¼ã¿ã¼ã«è¤æ°ã®Linuxã¤ã³ã¹ãã¼ã«ãè¦ã¤ããã¾ããããã¼ããå¾©åããLinuxãé¸æãã¦ãã ãã: <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æ:</span>

è¤æ°ã®ã¹ãã¬ã¼ã¸ããã¤ã¹ãè¦ã¤ããã¾ããããã¼ããæ¸ãè¾¼ãããã¤ã¹ãé¸æãã¦ãã ãã: <span font='16' foreground='LightSkyBlue'>é¸æããããªãã·ã§ã³ãé¸æãã¦ãã ãã:</span>

ãªã¹ãã¢ã¯3ã¤ã®æ¹æ³ã§è¡ããã¨ãã§ãã¾ãï¼<span foreground='gray'>ã·ã³ãã«ãä¸­ç´ãã¾ãã¯å®å¨</span>ï¼çåãããå ´åã¯ãæåã®ãªãã·ã§ã³ãè©¦ãã¦ãã³ã³ãã¥ã¼ã¿ã¼ãåèµ·åãã¦è§£æ±ºããã¦ãããã©ãããç¢ºèªãã¦ãã ããã

åé¡ãè§£æ±ºããªãå ´åã¯ãä»ã®ãªãã·ã§ã³ãè©¦ãã¦ãã ããã Completa, executa as etapas de restauraÃ§Ã£o intermediÃ¡ria, atualiza o sistema e verifica se o kernel LTS estÃ¡ instalado. ConcluÃ­do! èª¬æ ãã£ã¹ã¯ ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã§ã¿ã¼ããã«ãéãã¾ãã ã¤ã³ã¿ã©ã¯ãã£ãã§ãé¸æããã·ã¹ãã åã®ã³ã³ãã­ã¼ã«ã»ã³ã¿ã¼ãéãã¾ãã é¸æããã·ã¹ãã åã§pamac-managerããã±ã¼ã¸ããã¼ã¸ã£ãéãã¾ãã IntermediÃ¡rio, reinstala o pacote grub na partiÃ§Ã£o, regenera a configuraÃ§Ã£o e atualiza o initrd. åç§° EFI ãã¼ãã£ã·ã§ã³ãé¸æããã¦ãã¾ããããã­ã»ã¹ãã­ã£ã³ã»ã«ããã¾ããã ãã®ã³ã³ãã¥ã¼ã¿ã¼ã«Linuxã®ã¤ã³ã¹ãã¼ã«ãè¦ã¤ããã¾ããã§ããããã­ã»ã¹ãã­ã£ã³ã»ã«ããã¾ããã Nenhuma partiÃ§Ã£o selecionada, processo cancelado. ãªãã·ã§ã³ ãã¼ãã£ã·ã§ã³ãã¼ãã« ãå¾ã¡ãã ãã... Restaurar Boot, Grub e initrd Apenas escreva o Grub novamente no inÃ­cio do disco. ãµã¤ãº ãã®ã³ã³ãã¥ã¼ã¿ã¼ã§EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ããã§ãããããããGrubã®å¾©åã¯æ©è½ããªãã§ãããã

ã³ã³ãã¥ã¼ã¿ã¼ã®BIOSãä»ãã¦ã¬ã¬ã·ã¼ã¾ãã¯BIOSã¢ã¼ãã§åèµ·åãã¦èµ·åãã¦ã¿ã¦ãã ããã

æåç¢ºçãä½ãå ´åã§ãè©¦ãã¦ã¿ã¾ããï¼ ãã®ã³ã³ãã¥ã¼ã¿ã¼ã§EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ããããããããGrubã®å¾©åã¯æ©è½ããªãã§ããããã³ã³ãã¥ã¼ã¿ã¼ã®BIOSãä»ãã¦EFIã¢ã¼ãã§åèµ·åãã¦èµ·åãã¦ã¿ã¦ãã ããã

æåç¢ºçãä½ãå ´åã§ãè©¦ãã¦ã¿ã¾ããï¼ ãã®ã¦ã¼ãã£ãªãã£ã¯ã©ã¤ãã¢ã¼ãã§ã®ã¿ä½¿ç¨ããå¿è¦ãããã¾ãï¼ ã³ã³ãã¥ã¼ã¿ã¼ã¯ã¤ã³ã¿ã¼ãããã«æ¥ç¶ããã¦ãã¾ããããªãã·ã§ã³2ã¨3ã¯ã¤ã³ã¿ã¼ãããæ¥ç¶ãå¿è¦ã§ãã 