Þ            )   ü         º  ¡  #  \  Ó    U  T	  ¥   ª
     P  ¥   Ý  
     {        
          "  9   (  E   b  V   ¨  ;   ÿ  n   ;  7   ª  3   â       L     ]  h  q  Æ     8     @  h   `  ;   É              #  +  4    `  U  ó  Ë  I      Ï   !  Ñ   ñ     Ã   «   Ó      !     !     !  W   ©!  c   "  p   e"  K   Ö"     "#  f   ¨#  c   $     s$     z$  ¯  %  Í  Ç&     (  #   ¥(  ª   É(  L   t)  !   Á)  	   ã)                                                                                  
       	                                                <span font='12'>Esta ferramenta deve ser utilizada em MODO LIVE e para restaurar o BOOT do BigLinux 
instalado no HD ou SSD.</span>

<span font='12' foreground='red'>Se o sistema instalado estÃ¡ iniciando corretamente nÃ£o existem problemas no boot, portanto Ã© 
melhor nÃ£o prosseguir o uso desta ferramenta.</span>
<span font='10' foreground='gray'>Provavelmente funcione tambÃ©m com outras distribuiÃ§Ãµes Linux.</span>

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirme os dados:</span>
    
<span font='11' foreground='gray'>Modo de boot:</span> EFI
<span font='11' foreground='gray'>PartiÃ§Ã£o EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>PartiÃ§Ã£o selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partiÃ§Ã£o:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partiÃ§Ã£o:</span> $UUID_PARTITION

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirme os dados:</span>    

<span font='11' foreground='gray'>Modo de boot:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disco selecionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela de partiÃ§Ãµes do disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Tamanho do disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>PartiÃ§Ã£o selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partiÃ§Ã£o:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partiÃ§Ã£o:</span> $UUID_PARTITION

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Selecione a opÃ§Ã£o desejada:</span>
        
A restauraÃ§Ã£o pode ser feita de 3 formas (<span foreground='gray'>Simples, IntermediÃ¡ria ou Completa</span>), em caso de dÃºvidas, tente a primeira 
opÃ§Ã£o, reinicie o computador e veja se resolveu.

Se o problema persistir tente as outras opÃ§Ãµes. <span font='16' foreground='LightSkyBlue'>Selecione uma opÃ§Ã£o:</span>

Encontrei mais de um Linux instalado neste computador, selecione qual devo restaurar o boot: <span font='16' foreground='LightSkyBlue'>Selecione uma opÃ§Ã£o:</span>

Encontrei mais de uma partiÃ§Ã£o EFI, selecione qual devo utilizar: <span font='16' foreground='LightSkyBlue'>Selecione uma opÃ§Ã£o:</span>
    
Encontrei mais de um dispositivo de armazenamento, selecione em qual devo gravar o boot: Aguarde... Completa, executa as etapas da restauraÃ§Ã£o intermediÃ¡ria, atualiza o sistema e verifica se o kernel LTS estÃ¡ instalado. ConcluÃ­do! DescriÃ§Ã£o Disco Este utilitÃ¡rio deve ser utilizado somente no modo live! Interativa, abre a central de controle dentro do sistema selecionado. Interativa, abre o gerenciador de pacotes pamac-manager dentro do sistema selecionado. Interativa, abre um terminal dentro do sistema selecionado. IntermediÃ¡ria, reinstala o pacote do grub na partiÃ§Ã£o, gera novamente a configuraÃ§Ã£o e atualiza o initrd. Nenhuma partiÃ§Ã£o EFI selecionada, processo cancelado. Nenhuma partiÃ§Ã£o selecionada, processo cancelado. Nome NÃ£o encontrei nenhum Linux instalado neste computador, processo cancelado.
 O boot no modo live estÃ¡ utilizando o modo EFI, porÃ©m <span foreground='red'>nÃ£o encontrei nenhuma partiÃ§Ã£o EFI</span> neste computador,
provavelmente a restauraÃ§Ã£o do Grub nÃ£o irÃ¡ funcionar. 

Tente reiniciar e atravÃ©s da Bios do computador efetuar o boot em modo Legacy ou BIOS.

Deseja tentar mesmo com pouca provabilidade de funcionar? O boot no modo live estÃ¡ utilizando o modo Legacy, tambÃ©m chamado de BIOS, 
<span foreground='red'>porÃ©m encontrei pelo menos uma partiÃ§Ã£o EFI neste computador</span>,
provavelmente a restauraÃ§Ã£o do Grub nÃ£o irÃ¡ funcionar. 

Tente reiniciar e atravÃ©s da Bios do computador efetuar o boot em modo EFI.

Deseja tentar mesmo com pouca provabilidade de funcionar? OpÃ§Ã£o Restaurar o Boot, Grub e initrd Seu computador nÃ£o estÃ¡ conectado a internet, as opÃ§Ãµes 2 e 3 precisam de internet para funcionarem. Simples, apenas grava o Grub novamente no inÃ­cio do disco. Tabela de partiÃ§Ãµes Tamanho Project-Id-Version: biglinux-grub-restore
Report-Msgid-Bugs-To: 
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>ãã®ãã¼ã«ã¯ãã©ã¤ãã¢ã¼ãã§ä½¿ç¨ããBigLinux BOOTãå¾©åããå¿è¦ãããã¾ã
HDã¾ãã¯SSDã«ã¤ã³ã¹ãã¼ã«ããã¦ãã¾ãã</span>

<span font='12' foreground='red'>ã¤ã³ã¹ãã¼ã«ããã·ã¹ãã ãæ­£å¸¸ã«èµ·åãã¦ããå ´åã¯ããã¼ãã«åé¡ã¯ããã¾ããã®ã§ã
ãã®ãã¼ã«ã®ä½¿ç¨ãç¶ç¶ããªãæ¹ãè¯ãã§ãã</span>
<span font='10' foreground='gray'>ããããä»ã®Linuxãã£ã¹ããªãã¥ã¼ã·ã§ã³ã§ãåä½ãã¾ãã</span>

ç¶è¡ãã¾ãã? <span font='16' foreground='LightSkyBlue'>ãã¼ã¿ã®ç¢ºèª</span>:<span font='11' foreground='gray'>ãã¼ãã¢ã¼ã:</span>EFI
<span font='11' foreground='gray'>EFI ãã¼ãã£ã·ã§ã³:</span> $EFI_ãã¼ãã£ã·ã§ã³
    
<span font='11' foreground='gray'>é¸æããããã¼ãã£ã·ã§ã³:</span> $SELECTED_ãã¼ãã£ã·ã§ã³
<span font='11' foreground='gray'>é¸æããã·ã¹ãã :</span> $SELECTED_OS
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ãã©ã¼ããã:</span> $PARTITION_ãã©ã¼ããã
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ UUID:</span> $UUID_ãã¼ãã£ã·ã§ã³

ç¶è¡ãã¾ãã?
    
 <span font='16' foreground='LightSkyBlue'>ãã¼ã¿ã®ç¢ºèª</span>:<span font='11' foreground='gray'>ãã¼ãã¢ã¼ã:</span>ã¬ã¬ã·ã¼/BIOS
<span font='11' foreground='gray'>é¸æãããã£ã¹ã¯:</span> $DISK_é¸ææ¸ã¿
    
<span font='11' foreground='gray'>ãã£ã¹ã¯ãã¼ãã£ã·ã§ã³ãã¼ãã«: $DISK</span>_TABLE
    
<span font='11' foreground='gray'>ãã£ã¹ã¯ ãµã¤ãº:</span> $DISK_ãµã¤ãº
   
<span font='11' foreground='gray'>é¸æããããã¼ãã£ã·ã§ã³:</span> $SELECTED_ãã¼ãã£ã·ã§ã³
<span font='11' foreground='gray'>é¸æããã·ã¹ãã :</span> $SELECTED_OS
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ãã©ã¼ããã:</span> $PARTITION_ãã©ã¼ããã
<span font='11' foreground='gray'>ãã¼ãã£ã·ã§ã³ UUID:</span> $UUID_ãã¼ãã£ã·ã§ã³

ç¶è¡ãã¾ãã?    

 <span font='16' foreground='LightSkyBlue'>å¿è¦ãªãªãã·ã§ã³ãé¸æãã¾ãã</span>
        
å¾©åã¯3ã¤ã®æ¹æ³(<span foreground='gray'>ã·ã³ãã«ãä¸­ç´ãã¾ãã¯å®å¨</span>)ã§è¡ããã¨ãã§ãã¾ããçãããå ´åã¯ãæåã«è©¦ãã¦ã¿ã¦ãã ãã
ã³ã³ãã¥ã¼ã¿ãåèµ·åããè§£æ±ºãããã©ãããç¢ºèªãã¾ãã

åé¡ãè§£æ±ºããªãå ´åã¯ãä»ã®ãªãã·ã§ã³ãè©¦ãã¦ãã ããã <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æãã¾ãã</span>

ç§ã¯ãã®ã³ã³ãã¥ã¼ã¿ã«è¤æ°ã®Linuxãã¤ã³ã¹ãã¼ã«ããã¦ããã®ãè¦ã¤ãã¾ãããã©ãããã¼ããå¾©åããã¹ãããé¸æãã¦ãã ãã: <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æãã¾ãã</span>

è¤æ°ã®EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ããã®ã§ãä½¿ç¨ãããã¼ãã£ã·ã§ã³ãé¸æãã¾ãã <span font='16' foreground='LightSkyBlue'>ãªãã·ã§ã³ãé¸æãã¾ãã</span>
    
ç§ã¯è¤æ°ã®ã¹ãã¬ã¼ã¸ããã¤ã¹ãè¦ã¤ãããç§ã¯ãã¼ããè¨é²ããå¿è¦ãããã¾ãé¸æ: å¾ã¤ããã å®äºããä¸­éãªã¹ãã¢æé ãå®è¡ããã·ã¹ãã ãã¢ããã°ã¬ã¼ãããLTSã«ã¼ãã«ãã¤ã³ã¹ãã¼ã«ããã¦ãããã¨ãç¢ºèªãã¾ãã å®æã§ãï¼ ååèª¬æ ãã£ã¹ã¯ ãã®ã¦ã¼ãã£ãªãã£ã¯ãã©ã¤ãã¢ã¼ãã§ã®ã¿ä½¿ç¨ãã¦ãã ããã ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã®ã³ã³ãã­ã¼ã«ã»ã³ã¿ã¼ãéãã ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã§pamac-managerããã±ã¼ã¸ããã¼ã¸ã£ãéãã ã¤ã³ã¿ã©ã¯ãã£ããé¸æããã·ã¹ãã åã®ç«¯æ«ãéãã ä¸­éããã¼ãã£ã·ã§ã³ã«grubããã±ã¼ã¸ãåã¤ã³ã¹ãã¼ã«ããè¨­å®ãåçæããinitrdãæ´æ°ãã¾ãã EFIãã¼ãã£ã·ã§ã³ãé¸æããã¦ããªããããå¦çãã­ã£ã³ã»ã«ããã¾ããã ãã¼ãã£ã·ã§ã³ãé¸æããã¦ããªããããå¦çãã­ã£ã³ã»ã«ããã¾ããã åç§° ãã®ã³ã³ãã¥ã¼ã¿ã«ã¤ã³ã¹ãã¼ã«ããã¦ããLinuxã¯è¦ã¤ããã¾ããã§ããã®ã§ããã­ã»ã¹ã¯ã­ã£ã³ã»ã«ããã¾ããã
 ã©ã¤ãã¢ã¼ãã§ã®èµ·åã¯EFIã¢ã¼ããä½¿ç¨ãã¦ãã¾ããããã®ã³ã³ãã¥ã¼ã¿ã« <span foreground='red'>EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ããã¾ããã§ãã</span> ã
grubã®å¾©åã¯ããããåä½ãã¾ããã

åèµ·åãã¦ãã³ã³ãã¥ã¼ã¿ã®BIOSãã¬ã¬ã·ã¼ã¢ã¼ãã¾ãã¯BIOSã¢ã¼ãã§èµ·åãã¦ã¿ã¦ãã ããã

ä½æ¥­ã®è¨¼æ ãå°ãã§ãè©¦ãã¦ã¿ããã§ãã? ã©ã¤ãã¢ã¼ãã§ã®èµ·åã¯ãBIOSã¨ãå¼ã°ããã¬ã¬ã·ã¼ã¢ã¼ããä½¿ç¨ãã¦ãã¾ãã
<span foreground='red'>ããããç§ã¯ãã®ã³ã³ãã¥ã¼ã¿ä¸ã§å°ãªãã¨ã1ã¤ã®EFIãã¼ãã£ã·ã§ã³ãè¦ã¤ãã¾ãã</span>ã
grubã®å¾©åã¯ããããåä½ãã¾ããã

åèµ·åãã¦ãã³ã³ãã¥ã¼ã¿ã®BIOSãEFIã¢ã¼ãã§èµ·åãã¦ã¿ã¦ãã ããã

ä½æ¥­ã®è¨¼æ ãå°ãã§ãè©¦ãã¦ã¿ããã§ãã? ãªãã·ã§ã³ BootãGrubãinitrdã®ãªã¹ãã¢ ãä½¿ãã®ã³ã³ãã¥ã¼ã¿ã¯ã¤ã³ã¿ã¼ãããã«æ¥ç¶ããã¦ãã¾ããããªãã·ã§ã³2ã¨3ã¯åä½ããããã«ã¤ã³ã¿ã¼ããããå¿è¦ã§ãã ã·ã³ãã«ã«ãGrubããã£ã¹ã¯ã®æåã«æ¸ãæ»ãã ãã§ãã ãã¼ãã£ã·ã§ã³ãã¼ãã« ãµã¤ãº 