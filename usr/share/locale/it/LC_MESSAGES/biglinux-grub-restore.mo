��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4  "  �  �    L  �  �   <  �   �  �   }     +  {   8     �     �     �  =   �  M     P   Y  C   �  j   �  O   Y   K   �      �   Z   �   J  U!  Y  �"     �#  !   $  f   $$  3   �$     �$  
   �$                                                                                  
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
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Questo strumento dovrebbe essere utilizzato in MODALITÀ LIVE e per ripristinare il BigLinux BOOT 
installato su HD o SSD.</span> <span font='12' foreground='red'>Se il sistema installato si avvia correttamente non ci sono problemi nell'avvio, quindi è 
meglio non continuare l'uso di questo strumento.</span> <span font='10' foreground='gray'>Probabilmente funziona anche con altre distribuzioni Linux.</span>

Vuoi procedere?


 <span font='16' foreground='LightSkyBlue'>Conferma dati:</span>
    
<span font='11' foreground='gray'>Modalità di avvio:</span> EFI
<span font='11' foreground='gray'>Partizione EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partizione selezionata:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selezionato:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato partizione:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID della partizione:</span> $UUID_PARTITION

Vuoi procedere? <span font='16' foreground='LightSkyBlue'>Conferma dati:</span>    

<span font='11' foreground='gray'>Modalità di avvio:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disco selezionato:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabella delle partizioni del disco: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Dimensione disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partizione selezionata:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selezionato:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato partizione:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID della partizione:</span> $UUID_PARTITION

Vuoi procedere? <span font='16' foreground='LightSkyBlue'>Seleziona l'opzione desiderata:</span>
        
Il restauro può essere fatto in 3 modi (<span foreground='gray'>Semplice, Intermedio o Completo</span>), in caso di dubbio, prova il primo 
riavvia il computer e verifica se è stato risolto.

Se il problema persiste, prova le altre opzioni. <span font='16' foreground='LightSkyBlue'>Seleziona un'opzione:</span>

Ho trovato più di un Linux installato su questo computer, selezionare quale dovrebbe ripristinare l'avvio: <span font='16' foreground='LightSkyBlue'>Seleziona un'opzione:</span>

Ho trovato più di una partizione EFI, selezionare quale utilizzare: <span font='16' foreground='LightSkyBlue'>Seleziona un'opzione:</span>
    
Ho trovato più di un dispositivo di archiviazione, selezionare su cui dovrei registrare l'avvio: Aspettare... Completare, eseguire le fasi di ripristino intermedio, aggiornare il sistema e verificare che il kernel LTS sia installato. Fatto! Descrizione Disco Questa utility deve essere utilizzata solo in modalità live! Interattivo, apre il centro di controllo all'interno del sistema selezionato. Interattivo, apre il gestore di pacchetti pamac-manager nel sistema selezionato. Interattivo, apre un terminale all'interno del sistema selezionato. Intermedio, reinstalla il pacchetto grub sulla partizione, rigenera la configurazione e aggiorna l'initrd. Non è stata selezionata alcuna partizione EFI, il processo è stato annullato. Non è stata selezionata alcuna partizione, il processo è stato annullato. Nome Non ho trovato alcun Linux installato su questo computer, il processo è stato annullato.
 L'avvio in modalità live utilizza la modalità EFI, ma <span foreground='red'>non ho trovato alcuna partizione EFI su</span> questo computer,
grub restore probabilmente non funzionerà. 

Provare a riavviare e tramite l'avvio del BIOS del computer in modalità Legacy o BIOS.

Vuoi provare anche con poche prove di funzionamento? L'avvio in modalità live utilizza la modalità Legacy, chiamata anche bios, 
<span foreground='red'>ma ho trovato almeno una partizione EFI su questo computer</span>,
grub restore probabilmente non funzionerà. 

Provare a riavviare e tramite l'avvio del BIOS del computer in modalità EFI.

Vuoi provare anche con poche prove di funzionamento? Opzione Ripristino di Boot, Grub e initrd Il tuo computer non è connesso a Internet, le opzioni 2 e 3 hanno bisogno di Internet per funzionare. Semplice, basta scrivere Grub all'inizio del disco. Tabella di partizione Dimensioni 