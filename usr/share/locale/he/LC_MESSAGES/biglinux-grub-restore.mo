Þ            )   ü         º  ¡  #  \  Ó    U  T	  ¥   ª
     P  ¥   Ý  
     {        
          "  9   (  E   b  V   ¨  ;   ÿ  n   ;  7   ª  3   â       L     ]  h  q  Æ     8     @  h   `  ;   É              #  ú  4  9  /  ô  i    ^  Ê   ý     È  µ   e  	        %     ­  
   ¹     Ä  1   Ñ  ]      m   a   M   Ï      !  6   ¡!  2   Ø!     "  Y   "  v  j"    á#     g%  *   t%     %  H   &     h&     ~&                                                                                  
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
Language: he
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>××© ×××©×ª××© ×××× ×× ×××¦× LIVE ×××× ××©×××¨ ××ª ×××ª××× ×©× BigLinux 
×××ª×§× ×¢× HD ×× SSD.</span> <span font='12' foreground='red'>×× ×××¢×¨××ª ××××ª×§× ×ª ××ª×××× ××¨××× ××× ××¢×××ª ×××ª×××, ×××× ××× 
×¢×××£ ×× ××××©×× ××ª ××©××××© ×××× ××.</span> <span font='10' foreground='gray'>×× ×× ×¨×× ×¢××× ×× ×¢× ××¤×¦××ª ××× ××§×¡ ×××¨××ª.</span>

××× ××¨×¦×× × ××××©××?


 <span font='16' foreground='LightSkyBlue'>××©×¨ × ×ª×× ××:</span>
    
<span font='11' foreground='gray'>××¦× ××ª×××:</span> EFI
<span font='11' foreground='gray'>××××¦×ª EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>××××¦× ×©× ×××¨×:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>××¢×¨××ª × ×××¨×ª:</span> $SELECTED_OS
<span font='11' foreground='gray'>×ª×× ××ª ××××¦×:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>××××¦× UUID:</span> $UUID_PARTITION

××× ××¨×¦×× × ××××©××? <span font='16' foreground='LightSkyBlue'>××©×¨ × ×ª×× ××:</span>    

<span font='11' foreground='gray'>××¦× ××ª×××:</span>  ××××¨ ×§×××/BIOS
<span font='11' foreground='gray'>×××¡×§ × ×××¨:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>××××ª ××××¦×ª ×××¡×§: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>×××× ×××¡×§:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>××××¦× ×©× ×××¨×:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>××¢×¨××ª × ×××¨×ª:</span> $SELECTED_OS
<span font='11' foreground='gray'>×ª×× ××ª ××××¦×:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>××××¦× UUID:</span> $UUID_PARTITION

××× ××¨×¦×× × ××××©××? <span font='16' foreground='LightSkyBlue'>×××¨ ××ª ×××¤×©×¨××ª ××¨×¦×××:</span>
        
××©××××¨ ×××× ××××¢×©××ª ××©×××© ××¨××× (<span foreground='gray'>×¤×©××, ××× ×× × ×× ×©××</span>), ×××§×¨× ×©× ×¡×¤×§, × ×¡× ××ª ××¨××©×× 
××¤×¢× ××××© ××ª ××××©× ××¨×× ×× ××× × ×¤×ª×¨.

×× ×××¢×× × ××©××ª × ×¡× ××ª ×××¤×©×¨××××ª ××××¨××ª. <span font='16' foreground='LightSkyBlue'>×××¨ ××¤×©×¨××ª:</span>

××¦××ª× ×××ª×¨ ×××× ××§×¡ ××× ×××ª×§× ××××©× ××, ×××¨ ×××× ××× ×¦×¨×× ××©×××¨ ××ª ×××ª×××: <span font='16' foreground='LightSkyBlue'>×××¨ ××¤×©×¨××ª:</span>

××¦××ª× ×××ª×¨ ×××××¦××ª EFI ×××ª, ×××¨ ××××× ××× ×××©×ª××©: <span font='16' foreground='LightSkyBlue'>×××¨ ××¤×©×¨××ª:</span>
    
××¦××ª× ×××ª×¨ ×××ª×§× ×××¡×× ×××, ×××¨ ××××× ×¢×× ×××§××× ××ª ×××ª×××: ×××... ××©××, ××¦×¢ ××ª ×©××× ××©××××¨ ×××× ×× ×××, ×¢××× ××ª ×××¢×¨××ª ×××× ×× ××××ª ×- LTS ×××ª×§× ×ª. ××¢×©××ª! ×ª××××¨ ×¦×××××ª ××× ×× ××××¨ ××©××© ×¨×§ ×××¦× ××! ××× ××¨××§××××, ×¤××ª× ××ª ××¨×× ×××§×¨× ××ª×× ×××¢×¨××ª ×©× ×××¨×. ××× ××¨××§××××, ×¤××ª× ××ª ×× ×× ×××××× Pamac-manager ××ª×× ×××¢×¨××ª ×©× ×××¨×. ××× ××¨××§××××, ×¤××ª× ××¡××£ ××ª×× ×××¢×¨××ª ×©× ×××¨×. ××× ×××, ×××ª×§×× ××××© ××ª ×××××× grub ×¢× ×××××¦×, ××××© ××ª ××ª×¦××¨×, ×××¢××× ××ª initrd. ×× × ×××¨× ××××¦×ª EFI, ××ª×××× ××××. ×× × ×××¨× ××××¦×, ××ª×××× ××××. ×©× ×× ××¦××ª× ×©×× ××× ××§×¡ ×××ª×§× ×ª ××××©× ××, ××ª×××× ××××.
 ×××ª××× ×××¦× ×× ××©×ª××© ×××¦× EFI, ×× <span foreground='red'>×× ××¦××ª× ××××¦××ª EFI ××××©×</span> ××,
×©××××¨ grub ×× ×¨×× ×× ××¢×××. 

× ×¡× ×××¤×¢×× ××××© ×××¨× ××ª××× ×- Bios ×©× ××××©× ×©×× ×××¦× ××××¨ ×§××× ×× BIOS.

×¨××¦×× ×× ×¡××ª ××¤××× ×¢× ××¢× ××××××ª ××¢××××? ×××ª××× ×××¦× ×× ××©×ª××© ×××¦× ××××¨ ×§×××, ×× ×§×¨× ×× bios, 
<span foreground='red'>××× ××¦××ª× ××¤×××ª ××××¦×ª EFI ×××ª ××××©× ××</span>,
×©××××¨ grub ×× ×¨×× ×× ××¢×××. 

× ×¡× ×××¤×¢×× ××××© ×××¨× ××ª××× Bios ×©× ××××©× ×××¦× EFI.

×¨××¦×× ×× ×¡××ª ××¤××× ×¢× ××¢× ××××××ª ××¢××××? ××¤×©×¨××ª ×©××××¨ ××ª×××, ××¨××, × Initrd ××××©× ×©×× ××× × ×××××¨ ×××× ××¨× ×, ××¤×©×¨××××ª 2 × -3 ×¦×¨××××ª ××× ××¨× × ××× ××¢×××. ×¤×©××, ×¤×©×× ×××§××× ××¨×× ×©×× ××ª××××ª ××××¡×§. ××××ª ××××¦××ª ×××× 