��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �   /  �   �  m  �  �        �  
   �     �  9   �  8   �  N   .  n   }     �  6   �  @   )  0   j     �     �     �  *   �  3   �     '   k  -   �  �!  @   #  l   ^#                                     
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
 <span font='12'>Bu araç, HD veya SSD'ye kurulu BigLinux'un BOOT'unu geri yüklemek için CANLI MODDA kullanılmalıdır.</span>

<span font='12' foreground='red'>Eğer kurulu sistem düzgün bir şekilde başlatılıyorsa, herhangi bir önyükleme sorunu yoktur, bu nedenle bu aracı kullanmaya devam etmemek daha iyidir.</span>
<span font='10' foreground='gray'>Diğer Linux dağıtımlarıyla da çalışabilir.</span>

Devam etmek istiyor musunuz? <span font='16' foreground='LightSkyBlue'>Verileri onaylayın:</span>
    
<span font='11' foreground='gray'>Başlatma modu:</span> EFI
<span font='11' foreground='gray'>EFI bölümü:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Seçilen bölüm:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Seçilen sistem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Bölüm formatı:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Bölüm UUID'si:</span> $UUID_PARTITION

Devam etmek istiyor musunuz? <span font='16' foreground='LightSkyBlue'>Verileri onaylayın:</span>    

<span font='11' foreground='gray'>Başlatma modu:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Seçilen disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Disk bölüm tablosu:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Disk boyutu:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Seçilen bölüm:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Seçilen sistem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Bölüm formatı:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Bölüm UUID'si:</span> $UUID_PARTITION

Devam etmek istiyor musunuz? <span font='16' foreground='LightSkyBlue'>Bir seçenek seçin:</span>

Birden fazla EFI bölümü bulundu, hangisini kullanmak istediğinizi seçin: <span font='16' foreground='LightSkyBlue'>Bir seçenek seçin:</span>

Bu bilgisayarda birden fazla Linux kurulumu bulundu, hangi kurulumun önyüklemesini geri yüklemek istediğinizi seçin: <span font='16' foreground='LightSkyBlue'>Bir seçenek seçin:</span>
    
Birden fazla depolama aygıtı bulundu, önyükleme yazmak için hangisini seçeceğinizi belirtin: <span font='16' foreground='LightSkyBlue'>İstenilen seçeneği seçin:</span>
        
Geri yükleme 3 şekilde yapılabilir (<span foreground='gray'>Basit, Orta veya Tam</span>), eğer şüpheniz varsa, ilk seçeneği deneyin, bilgisayarı yeniden başlatın ve sorunun çözülüp çözülmediğine bakın.

Eğer sorun devam ederse, diğer seçenekleri deneyin. Tamamlandı, ara geri yükleme adımlarını gerçekleştirir, sistemi günceller ve LTS çekirdeğinin kurulu olup olmadığını kontrol eder. Tamamlandı! Açıklama Disk Etkileşimli, seçilen sistem içinde bir terminal açar. Etkileşimli, seçilen sistemin kontrol merkezini açar. Etkileşimli, seçilen sistem içinde pamac-manager paket yöneticisini açar. Ara yüz, bölümde grub paketini yeniden kurar, yapılandırmayı yeniden oluşturur ve initrd'yi günceller. İsim Hiçbir EFI bölümü seçilmedi, işlem iptal edildi. Bu bilgisayarda Linux kurulumu bulunamadı, işlem iptal edildi. Hiçbir bölüm seçilmedi, işlem iptal edildi. Seçenek Bölüm Tablosu Lütfen bekleyin... Önyükleme, Grub ve initrd'yi Geri Yükle Basit, sadece diskin başında Grub'u tekrar yazar. Boyut Canlı modda önyükleme EFI modunu kullanıyor, ancak bu bilgisayarda <span foreground='red'>hiçbir EFI bölümü</span> bulunamadı, 
muhtemelen Grub geri yüklemesi çalışmayacak. 

Bilgisayarın BIOS'u aracılığıyla Legacy veya BIOS modunda yeniden başlatmayı ve önyüklemeyi deneyin.

Başarı olasılığı düşük olsa bile denemek ister misiniz? Canlı modda önyükleme, BIOS olarak da adlandırılan Legacy modunu kullanıyor, 
<span foreground='red'>ancak bu bilgisayarda en az bir EFI bölümü bulundu</span>, 
muhtemelen Grub geri yüklemesi çalışmayacaktır. 

Bilgisayarın BIOS'u aracılığıyla EFI modunda yeniden başlatmayı ve önyüklemeyi deneyin.

Başarı olasılığı düşük olsa bile denemek ister misiniz? Bu yardımcı program yalnızca canlı modda kullanılmalıdır! Bilgisayarınız internete bağlı değil, 2 ve 3. seçeneklerin çalışması için internete ihtiyaç var. 