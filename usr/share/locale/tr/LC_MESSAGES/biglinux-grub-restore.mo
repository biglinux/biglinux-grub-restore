��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4      �    c  �  �   8  �   �  �   �     '  �   3     �  
   �     �  @   �  @     N   Z  9   �  s   �  .   W   )   �      �   L   �   U  !  u  Y"     �#  ,   �#  k   $  1   q$     �$     �$                                                                                  
       	                                                <span font='12'>Esta ferramenta deve ser utilizada em MODO LIVE e para restaurar o BOOT do BigLinux 
instalado no HD ou SSD.</span>

<span font='12' foreground='red'>Se o sistema instalado está iniciando corretamente não existem problemas no boot, portanto é 
melhor não prosseguir o uso desta ferramenta.</span>
<span font='10' foreground='gray'>Provavelmente funcione também com outras distribuições Linux.</span>

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirme os dados:</span>
    
<span font='11' foreground='gray'>Modo de boot:</span> EFI
<span font='11' foreground='gray'>Partição EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirme os dados:</span>    

<span font='11' foreground='gray'>Modo de boot:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disco selecionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela de partições do disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Tamanho do disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Selecione a opção desejada:</span>
        
A restauração pode ser feita de 3 formas (<span foreground='gray'>Simples, Intermediária ou Completa</span>), em caso de dúvidas, tente a primeira 
opção, reinicie o computador e veja se resolveu.

Se o problema persistir tente as outras opções. <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Encontrei mais de um Linux instalado neste computador, selecione qual devo restaurar o boot: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Encontrei mais de uma partição EFI, selecione qual devo utilizar: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>
    
Encontrei mais de um dispositivo de armazenamento, selecione em qual devo gravar o boot: Aguarde... Completa, executa as etapas da restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Concluído! Descrição Disco Este utilitário deve ser utilizado somente no modo live! Interativa, abre a central de controle dentro do sistema selecionado. Interativa, abre o gerenciador de pacotes pamac-manager dentro do sistema selecionado. Interativa, abre um terminal dentro do sistema selecionado. Intermediária, reinstala o pacote do grub na partição, gera novamente a configuração e atualiza o initrd. Nenhuma partição EFI selecionada, processo cancelado. Nenhuma partição selecionada, processo cancelado. Nome Não encontrei nenhum Linux instalado neste computador, processo cancelado.
 O boot no modo live está utilizando o modo EFI, porém <span foreground='red'>não encontrei nenhuma partição EFI</span> neste computador,
provavelmente a restauração do Grub não irá funcionar. 

Tente reiniciar e através da Bios do computador efetuar o boot em modo Legacy ou BIOS.

Deseja tentar mesmo com pouca provabilidade de funcionar? O boot no modo live está utilizando o modo Legacy, também chamado de BIOS, 
<span foreground='red'>porém encontrei pelo menos uma partição EFI neste computador</span>,
provavelmente a restauração do Grub não irá funcionar. 

Tente reiniciar e através da Bios do computador efetuar o boot em modo EFI.

Deseja tentar mesmo com pouca provabilidade de funcionar? Opção Restaurar o Boot, Grub e initrd Seu computador não está conectado a internet, as opções 2 e 3 precisam de internet para funcionarem. Simples, apenas grava o Grub novamente no início do disco. Tabela de partições Tamanho Project-Id-Version: biglinux-grub-restore
Report-Msgid-Bugs-To: 
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
Language: tr
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Bu araç CANLI MODDA ve BigLinux BOOT'u geri yüklemek için kullanılmalıdır. 
HD veya SSD'ye takılı.</span> <span font='12' foreground='red'>Yüklü sistem düzgün bir şekilde başlatılıyorsa, önyüklemede herhangi bir sorun yoktur, bu yüzden 
bu aracın kullanımına devam etmemek daha iyi.</span> <span font='10' foreground='gray'>Muhtemelen diğer Linux dağıtımlarıyla da çalışır.</span>

Devam etmek istiyor musunuz?


 <span font='16' foreground='LightSkyBlue'>Verileri onayla</span>:<span font='11' foreground='gray'>Önyükleme modu:</span> EFI
<span font='11' foreground='gray'>EFI bölümü:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Seçilen bölüm:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Seçilen sistem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Bölüm biçimi:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Bölüm UUID:</span> $UUID_PARTITION

Devam etmek istiyor musunuz?
    
 <span font='16' foreground='LightSkyBlue'>Verileri onayla</span>:<span font='11' foreground='gray'>Önyükleme modu:</span> LEGACY/BIOS
<span font='11' foreground='gray'>Seçilen disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Disk bölümleme tablosu: $DISK</span>_TABLE
    
<span font='11' foreground='gray'>Disk Boyutu:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Seçilen bölüm:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Seçilen sistem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Bölüm biçimi:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Bölüm UUID:</span> $UUID_PARTITION

Devam etmek istiyor musunuz?    

 <span font='16' foreground='LightSkyBlue'>İstediğiniz seçeneği belirleyin:</span>
        
Restorasyon 3 şekilde yapılabilir (<span foreground='gray'>Basit, Orta veya Tamamlandı</span>), şüphe durumunda ilkini deneyin 
bilgisayarınızı yeniden başlatın ve çözülüp çözülmediğine bakın.

Sorun devam ederse diğer seçenekleri deneyin. <span font='16' foreground='LightSkyBlue'>Bir seçenek belirleyin:</span>

Bu bilgisayarda yüklü birden fazla Linux buldum, hangisinin önyüklemeyi geri yüklemesi gerektiğini seçin: <span font='16' foreground='LightSkyBlue'>Bir seçenek belirleyin:</span>

Birden fazla EFI bölümü buldum, hangisini kullanacağımı seçin: <span font='16' foreground='LightSkyBlue'>Bir seçenek belirleyin:</span>
    
Birden fazla depolama cihazı buldum, önyüklemeyi kaydetmem gereken yeri seçin: Bekleyin... Tamamlayın, ara geri yükleme adımlarını gerçekleştirin, sistemi yükseltin ve LTS çekirdeğinin yüklü olduğunu doğrulayın. Yapılmış! Açıklama Disk Bu yardımcı program yalnızca canlı modda kullanılmalıdır! Etkileşimli, seçilen sistem içindeki kontrol merkezini açar. Etkileşimli, seçilen sistem içinde pamac-manager paket yöneticisini açar. Etkileşimli, seçilen sistem içinde bir terminal açar. Intermediate, grub paketini bölüme yeniden yükler, yapılandırmayı yeniden oluşturur ve initrd'yi günceller. EFI bölümü seçilmedi, işlem iptal edildi. Seçili bölüm yok, işlem iptal edildi. İsim Bu bilgisayarda yüklü herhangi bir Linux bulamadım, işlem iptal edildi.
 Canlı modda önyükleme EFI modunu kullanıyor, ancak bu <span foreground='red'>bilgisayarda herhangi bir EFI bölümü bulamadım</span> ,
grub geri yükleme muhtemelen çalışmaz. 

Eski veya BIOS modunda bilgisayarınızın Bios önyüklemesini yeniden başlatmayı deneyin.

Çok az çalışma kanıtı olsa bile denemek ister misiniz? Canlı modda önyükleme, bios olarak da adlandırılan Eski modu kullanıyor, 
<span foreground='red'>ancak bu bilgisayarda en az bir EFI bölümü buldum</span>,
grub geri yükleme muhtemelen çalışmaz. 

EFI modunda bilgisayarınızın Bios önyüklemesini yeniden başlatmayı ve aracılığıyla deneyin.

Çok az çalışma kanıtı olsa bile denemek ister misiniz? Seçenek Önyükleme, Grub ve initrd'yi Geri Yükleme Bilgisayarınız internete bağlı değil, seçenek 2 ve 3'ün çalışması için internete ihtiyacı var. Basit, sadece Grub'u diskin başına geri yazın. Bölme tablosu Boyut 