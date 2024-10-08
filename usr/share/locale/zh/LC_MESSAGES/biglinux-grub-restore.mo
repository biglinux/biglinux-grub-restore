��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  z  �    u  �  �  �   4  �   �  �   Q  @  �  W        v     �     �  -   �  3   �  B   �  X   6     �  '   �  ;   �  $   �       	   &     0     =  .   \     �    �  /  �  *   �   T   	!                                     
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
 <span font='12'>此工具应在实时模式下使用，以恢复安装在硬盘或固态硬盘上的 BigLinux 的引导。</span>

<span font='12' foreground='red'>如果已安装的系统正常启动，则没有引导问题，因此最好不要使用此工具。</span>
<span font='10' foreground='gray'>它也可能适用于其他 Linux 发行版。</span>

您想继续吗？ <span font='16' foreground='LightSkyBlue'>确认数据：</span>
    
<span font='11' foreground='gray'>启动模式：</span> EFI
<span font='11' foreground='gray'>EFI 分区：</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>选择的分区：</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>选择的系统：</span> $SELECTED_OS
<span font='11' foreground='gray'>分区格式：</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>分区 UUID：</span> $UUID_PARTITION

您想继续吗？ <span font='16' foreground='LightSkyBlue'>确认数据：</span>    

<span font='11' foreground='gray'>启动模式：</span>  传统/BIOS
<span font='11' foreground='gray'>选择的磁盘：</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>磁盘分区表：</span> $DISK_TABLE
    
<span font='11' foreground='gray'>磁盘大小：</span> $DISK_SIZE
   
<span font='11' foreground='gray'>选择的分区：</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>选择的系统：</span> $SELECTED_OS
<span font='11' foreground='gray'>分区格式：</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>分区 UUID：</span> $UUID_PARTITION

您想继续吗？ <span font='16' foreground='LightSkyBlue'>选择一个选项：</span>

发现多个 EFI 分区，请选择要使用的分区： <span font='16' foreground='LightSkyBlue'>选择一个选项：</span>

在此计算机上发现了多个Linux安装，请选择要恢复引导的安装： <span font='16' foreground='LightSkyBlue'>选择一个选项：</span>
    
发现多个存储设备，请选择要写入启动的设备： <span font='16' foreground='LightSkyBlue'>选择所需的选项：</span>
        
恢复可以通过三种方式进行（<span foreground='gray'>简单、中级或完整</span>），如果有疑问，请尝试第一个选项，重启计算机并查看是否解决。

如果问题仍然存在，请尝试其他选项。 完成，执行中间恢复步骤，更新系统，并检查是否安装了LTS内核。 已完成！ 描述 磁盘 交互式，在所选系统内打开终端。 交互式，打开所选系统内的控制中心。 交互式，在所选系统内打开 pamac-manager 包管理器。 中级，重新安装分区上的grub软件包，重新生成配置，并更新initrd。 名称 未选择EFI分区，过程已取消。 未在此计算机上找到Linux安装，过程已取消。 未选择分区，过程已取消。 选项 分区表 请稍候... 恢复引导、Grub 和 initrd 简单地在磁盘的开头重新写入Grub。 大小 在实时模式下启动使用EFI模式，但在此计算机上未找到<span foreground='red'>EFI分区</span>，最有可能的是Grub恢复将无法工作。

尝试重新启动并通过计算机的BIOS以传统或BIOS模式启动。

您想尝试即使成功的概率很低吗？ 在此计算机上以实时模式启动使用的是传统模式，也称为BIOS， 
<span foreground='red'>但至少发现了一个EFI分区</span>， 
很可能Grub恢复将无法工作。 

尝试重新启动并通过计算机的BIOS以EFI模式启动。

您想尝试即使成功的概率很低吗？ 此工具仅应在实时模式下使用！ 您的计算机未连接到互联网，选项 2 和 3 需要互联网才能工作。 