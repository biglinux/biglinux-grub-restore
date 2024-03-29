��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �  �  c  �  �   	  �   �  �   A     �  y   �     a     h  	   t  /   ~  :   �  G   �  5   1  o   g  0   �  ,         5   K   :   Q  �   I  �!     "#      )#  b   J#  7   �#     �#  
   �#                                                                                  
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
Language: no
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Dette verktøyet skal brukes i LIVE MODE og for å gjenopprette BigLinux BOOT 
installert på HD eller SSD.</span> <span font='12' foreground='red'>Hvis det installerte systemet starter som det skal, er det ingen problemer i oppstarten, så det er 
bedre ikke fortsette bruken av dette verktøyet.</span> <span font='10' foreground='gray'>Det fungerer sannsynligvis også med andre Linux-distribusjoner.</span>

Vil du fortsette?


 <span font='16' foreground='LightSkyBlue'>Bekreft data:</span>
    
<span font='11' foreground='gray'>Oppstartsmodus:</span> EFI
<span font='11' foreground='gray'>EFI-partisjon:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partisjon valgt:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partisjonsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partisjon UUID:</span> $UUID_PARTITION

Vil du fortsette? <span font='16' foreground='LightSkyBlue'>Bekreft data:</span>    

<span font='11' foreground='gray'>Oppstartsmodus:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valgt plate:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskpartisjonstabell: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Diskstørrelse:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partisjon valgt:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valgt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partisjonsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partisjon UUID:</span> $UUID_PARTITION

Vil du fortsette? <span font='16' foreground='LightSkyBlue'>Velg alternativet du vil bruke:</span>
        
Restaureringen kan gjøres på 3 måter (<span foreground='gray'>Enkel, Mellomliggende eller Fullstendig</span>), i tvilstilfeller, prøv den første 
start datamaskinen på nytt og se om den er løst.

Hvis problemet vedvarer, kan du prøve de andre alternativene. <span font='16' foreground='LightSkyBlue'>Velg et alternativ:</span>

Jeg fant mer enn en Linux installert på denne datamaskinen, velg hvilken som skal gjenopprette oppstarten: <span font='16' foreground='LightSkyBlue'>Velg et alternativ:</span>

Jeg fant mer enn én EFI-partisjon, velg hvilken jeg vil bruke: <span font='16' foreground='LightSkyBlue'>Velg et alternativ:</span>
    
Jeg fant mer enn en lagringsenhet, velg hvilken jeg skal spille inn støvelen: Vent litt... Fullfør, utfør de mellomliggende gjenopprettingstrinnene, oppdater systemet og kontroller at LTS-kjernen er installert. Gjort! Beskrivelse tallerken Dette verktøyet skal bare brukes i live-modus! Interaktiv, åpner kontrollsenteret i det valgte systemet. Interaktiv, åpner pamac-manager pakkebehandling i det valgte systemet. Interaktiv, åpner en terminal i det valgte systemet. Mellomliggende, installer grub-pakken på partisjonen på nytt, regenerere konfigurasjonen, og oppdater initrd. Ingen EFI-partisjon valgt, prosessen kansellert. Ingen partisjon valgt, prosessen kansellert. Navn Jeg fant ingen Linux installert på denne datamaskinen, prosessen avbrutt.
 Oppstarten i live-modus bruker EFI-modus, men jeg <span foreground='red'>har ikke funnet noen EFI-partisjoner på</span> denne datamaskinen,
grub gjenopprette vil sannsynligvis ikke fungere. 

Prøv å starte på nytt og gjennom datamaskinens Bios-oppstart i eldre modus eller BIOS-modus.

Vil du prøve selv med lite bevis på å jobbe? Oppstarten i live-modus bruker eldre modus, også kalt bios, 
<span foreground='red'>men jeg fant minst en EFI-partisjon på denne datamaskinen</span>,
grub gjenopprette vil sannsynligvis ikke fungere. 

Prøv å starte på nytt og gjennom datamaskinens Bios-oppstart i EFI-modus.

Vil du prøve selv med lite bevis på å jobbe? Opsjon Gjenopprett Boot, Grub og Initrd Datamaskinen din er ikke koblet til Internett, alternativ 2 og 3 trenger internett for å fungere. Enkelt, bare ta opp Grub igjen i begynnelsen av platen. Partisjon tabell størrelse 