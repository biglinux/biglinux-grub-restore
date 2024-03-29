��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4      �  
  R  �  �      �   �  �   B  	   �  ~   �     g     p     |  6   �  ;   �  G   �  5   =  l   s  ,   �  (         6   W   ;   P  �   P  �!  
   5#  "   @#  a   c#  8   �#     �#     $                                                                                  
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
Language: sv
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Detta verktyg ska användas i LIVE MODE och för att återställa BigLinux BOOT 
installerad på HD eller SSD.</span> <span font='12' foreground='red'>Om det installerade systemet startar ordentligt finns det inga problem i bagageutrymmet, så det är 
bättre att inte fortsätta använda det här verktyget.</span> <span font='10' foreground='gray'>Det fungerar förmodligen också med andra Linux-distributioner.</span>

Vill du gå vidare?


 <span font='16' foreground='LightSkyBlue'>Bekräfta data:</span> <span font='11' foreground='gray'>Startläge:</span> EFI
<span font='11' foreground='gray'>EFI-partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partition vald:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Vill du gå vidare?
    
 <span font='16' foreground='LightSkyBlue'>Bekräfta data:</span> <span font='11' foreground='gray'>Startläge:</span> LEGACY / BIOS
<span font='11' foreground='gray'>Vald skiva:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskpartitionstabell: $DISK</span>_TABLE
    
<span font='11' foreground='gray'>Diskstorlek:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partition vald:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valt system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Vill du gå vidare?    

 <span font='16' foreground='LightSkyBlue'>Välj det alternativ du vill ha:</span>
        
Restaureringen kan göras på 3 sätt (<span foreground='gray'>enkel, mellanliggande eller komplett</span>), i tveksamma fall, prova den första 
starta om datorn och se om det är löst.

Om problemet kvarstår kan du prova de andra alternativen. <span font='16' foreground='LightSkyBlue'>Välj ett alternativ:</span>

Jag hittade mer än en Linux installerad på den här datorn, välj vilken som ska återställa uppstarten: <span font='16' foreground='LightSkyBlue'>Välj ett alternativ:</span>

Jag hittade mer än en EFI-partition, välj vilken som ska användas: <span font='16' foreground='LightSkyBlue'>Välj ett alternativ:</span>
    
Jag hittade mer än en lagringsenhet, välj vilken jag ska spela in uppstarten: Vänta... Slutför, utför stegen för tillfällig återställning, uppgradera systemet och kontrollera att LTS-kärnan är installerad. Färdig! Beskrivning Skiva Det här verktyget får endast användas i live-läge! Interaktiv, öppnar kontrollcentralen i det valda systemet. Interaktiv, öppnar pakethanteraren pamac-manager i det valda systemet. Interaktiv, öppnar en terminal i det valda systemet. Intermediate, återinstallerar grub-paketet på partitionen, förnyar konfigurationen och uppdaterar initrd. Ingen EFI-partition vald, processen avbryts. Ingen partition vald, processen avbryts. Namn Jag kunde inte hitta något Linux installerat på den här datorn, processen avbröts.
 Uppstarten i live-läge använder EFI-läge, men jag <span foreground='red'>har inte hittat några EFI-partitioner på</span> den här datorn,
grub återställning kommer förmodligen inte att fungera. 

Försök starta om och genom datorns Bios-start i Legacy- eller BIOS-läge.

Vill du prova även med lite bevis på att du fungerar? Uppstarten i live-läge använder Legacy-läge, även kallat bios, 
<span foreground='red'>men jag hittade minst en EFI-partition på den här datorn</span>,
grub återställning kommer förmodligen inte att fungera. 

Försök starta om och genom datorns Bios-start i EFI-läge.

Vill du prova även med lite bevis på att du fungerar? Alternativ Återställa Boot, Grub och initrd Din dator är inte ansluten till internet, alternativ 2 och 3 behöver internet för att fungera. Enkelt, skriv bara tillbaka Grub till början av disken. Partitioneringstabell Storlek 