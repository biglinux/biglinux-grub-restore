��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �    Z  �  �     �   �  �   H     �  p   �     W     ^     j  /   p  7   �  Q   �  3   *  j   ^  <   �  ,         3   Y   8   K  �   F  �!     %#     2#  e   N#  D   �#     �#  
   $                                                                                  
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
Language: da
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Dette værktøj skal bruges i LIVE MODE og til at gendanne BigLinux BOOT 
installeret på HD eller SSD.</span> <span font='12' foreground='red'>Hvis det installerede system starter korrekt, er der ingen problemer i opstarten, så det er 
bedre ikke fortsætte brugen af dette værktøj.</span> <span font='10' foreground='gray'>Det fungerer sandsynligvis også med andre Linux-distributioner.</span>

Ønsker du at fortsætte?


 <span font='16' foreground='LightSkyBlue'>Bekræft data:</span>
    
<span font='11' foreground='gray'>Opstartstilstand:</span> EFI
<span font='11' foreground='gray'>EFI-partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partition valgt:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Ønsker du at fortsætte? <span font='16' foreground='LightSkyBlue'>Bekræft data:</span>    

<span font='11' foreground='gray'>Opstartstilstand:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valgt disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskpartitionstabel: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Disk størrelse:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partition valgt:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Ønsker du at fortsætte? <span font='16' foreground='LightSkyBlue'>Vælg den ønskede indstilling:</span>
        
Restaureringen kan udføres på 3 måder (<span foreground='gray'>Enkel, Mellemliggende eller Komplet</span>), i tvivlstilfælde, prøv den første 
genstart computeren og se, om den er løst.

Hvis problemet fortsætter, kan du prøve de andre muligheder. <span font='16' foreground='LightSkyBlue'>Vælg en indstilling:</span>

Jeg fandt mere end en Linux installeret på denne computer, vælg hvilken der skal gendanne boot: <span font='16' foreground='LightSkyBlue'>Vælg en indstilling:</span>

Jeg fandt mere end en EFI-partition, vælg hvilken der skal bruges: <span font='16' foreground='LightSkyBlue'>Vælg en indstilling:</span>
    
Jeg fandt mere end en lagerenhed, vælg på hvilken jeg skal optage boot: Vent... Afslut, udfør de foreløbige genoprettelsestrin, opgrader systemet og kontroller, at LTS-kernen er installeret. Gjort! Beskrivelse Skive Dette værktøj må kun bruges i live-tilstand! Interaktiv, åbner kontrolcenteret i det valgte system. Interaktiv, åbner pakkehåndteringsprogrammet pamac-manager i det valgte system. Interaktiv, åbner en terminal i det valgte system. Intermediate, geninstallerer grub-pakken på partitionen, regenererer konfigurationen og opdaterer initrd. Der er ikke valgt nogen EFI-partition, processen annulleres. Ingen partition valgt, processen annulleres. Navn Jeg kunne ikke finde nogen Linux installeret på denne computer, processen blev afbrudt.
 Opstarten i live-tilstand bruger EFI-tilstand, men jeg <span foreground='red'>har ikke fundet nogen EFI-partitioner på</span> denne computer,
grub gendannelse vil sandsynligvis ikke fungere. 

Prøv at genstarte og gennem din computers Bios-opstart i Legacy- eller BIOS-tilstand.

Vil du prøve selv med lidt bevis for at arbejde? Boot i live-tilstand bruger Legacy-tilstand, også kaldet bios, 
<span foreground='red'>men jeg fandt mindst en EFI-partition på denne computer</span>,
grub gendannelse vil sandsynligvis ikke fungere. 

Prøv at genstarte og gennem din computers Bios opstart i EFI-tilstand.

Vil du prøve selv med lidt bevis for at arbejde? Valgmulighed Gendan Boot, Grub og initrd Din computer er ikke forbundet til internettet, mulighed 2 og 3 har brug for internet for at fungere. Det er nemt, du skal bare skrive Grub tilbage til starten af disken. Partitioneringstabel Størrelse 