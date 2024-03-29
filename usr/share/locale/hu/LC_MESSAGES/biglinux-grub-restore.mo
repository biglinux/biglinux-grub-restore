��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4  8  �  �  6  �    �   �  �   �  �   /     �  �   �     �     �     �  @   �  O   �  X   6   F   �   y   �   :   P!  6   �!     �!  [   �!  �  #"  �  �#     h%  '   o%  r   �%  7   
&     B&     U&                                                                                  
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
Language: hu
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Ezt az eszközt ÉLŐ MÓDBAN kell használni, és vissza kell állítani a BigLinux BOOT-ot 
telepítve van a HD vagy SSD.</span> <span font='12' foreground='red'>Ha a telepített rendszer megfelelően indul, nincs probléma a rendszerindításban, tehát 
jobb, ha nem folytatja az eszköz használatát.</span> <span font='10' foreground='gray'>Valószínűleg más Linux disztribúciókkal is működik.</span>

Szeretnéd folytatni?


 <span font='16' foreground='LightSkyBlue'>Adatok megerősítése:</span>
    
<span font='11' foreground='gray'>Rendszerindítási mód:</span> EFI
<span font='11' foreground='gray'>EFI partíció:</span> $EFI_PARTÍCIÓ
    
<span font='11' foreground='gray'>Partíció kiválasztva:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Kiválasztott rendszer:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partíció formátuma:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partíció:</span> $UUID_PARTITION

Szeretnéd folytatni? <span font='16' foreground='LightSkyBlue'>Adatok megerősítése:</span>    

<span font='11' foreground='gray'>Rendszerindítási mód:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Kiválasztott lemez:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Lemezpartíciós tábla: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Lemez mérete:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Kiválasztott partíció:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Kiválasztott rendszer:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partíció formátuma:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partíció:</span> $UUID_PARTITION

Szeretnéd folytatni? <span font='16' foreground='LightSkyBlue'>Válassza ki a kívánt lehetőséget:</span>
        
A helyreállítás 3 módon (<span foreground='gray'>egyszerű, középhaladó vagy teljes</span>) történhet, kétség esetén próbálja ki az elsőt 
indítsa újra a számítógépet, és ellenőrizze, hogy megoldódott-e.

Ha a probléma továbbra is fennáll, próbálkozzon a többi lehetőséggel. <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Egynél több Linuxot találtam telepítve erre a számítógépre, válassza ki, melyiknek kell visszaállítania a rendszerindítást: <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>

Egynél több EFI partíciót találtam, és válassza ki, melyiket szeretné használni: <span font='16' foreground='LightSkyBlue'>Válasszon egy lehetőséget:</span>
    
Egynél több tárolóeszközt találtam, válassza ki, hogy melyiken rögzítsem a rendszerindítást: Vár... Végezze el, hajtsa végre az ideiglenes visszaállítási lépéseket, frissítse a rendszert, és ellenőrizze, hogy az LTS rendszermag telepítve van-e. Kész! Leírás Lemez Ezt a segédprogramot csak élő üzemmódban szabad használni! Interaktív, megnyitja a vezérlőközpontot a kiválasztott rendszeren belül. Interaktív, megnyitja a pamac-manager csomagkezelőt a kiválasztott rendszeren belül. Interaktív, megnyit egy terminált a kiválasztott rendszeren belül. Intermediate, újra telepíti a grub csomagot a partícióra, újratelepíti a konfigurációt és frissíti az initrd-t. Nincs kiválasztott EFI partíció, a folyamat megszakadt. Nincs kiválasztott partíció, a folyamat megszakadt. Név Nem találtam semmilyen Linuxot telepítve ezen a számítógépen, a folyamat megszakadt.
 Az élő módban történő rendszerindítás EFI módot használ, de <span foreground='red'>nem találtam EFI partíciót ezen a</span> számítógépen,
a grub visszaállítása valószínűleg nem fog működni. 

Próbálja meg újraindítani és a számítógép Bios rendszerindításán keresztül Legacy vagy BIOS módban.

Szeretné kipróbálni még akkor is, ha kevés bizonyíték van a munkára? Az élő módban történő rendszerindítás Legacy módot használ, más néven bios, 
<span foreground='red'>de találtam legalább egy EFI partíciót ezen a számítógépen</span>,
a grub visszaállítása valószínűleg nem fog működni. 

Próbálja meg újraindítani és a számítógép Bios rendszerindításán keresztül EFI módban.

Szeretné kipróbálni még akkor is, ha kevés bizonyíték van a munkára? Opció Boot, Grub és initrd visszaállítása A számítógép nem csatlakozik az internethez, a 2. és 3. lehetőség működéséhez internetre van szükség. Egyszerű, csak írja vissza a Grubot a lemez elejére. Partíciós tábla Méret 