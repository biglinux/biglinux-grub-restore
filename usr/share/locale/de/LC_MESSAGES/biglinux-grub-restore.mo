��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4      �  5  �    �   �  �   u  �        �  �   �     u     }     �  4   �  L   �  P      E   e   z   �   5   &!  1   \!     �!  _   �!  x  �!  �  l#     �$  &   �$  q   $%  N   �%     �%     �%                                                                                  
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
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Dieses Tool sollte im LIVE-MODUS und zur Wiederherstellung des BigLinux BOOT verwendet werden 
auf der HD oder SSD installiert.</span> <span font='12' foreground='red'>Wenn das installierte System ordnungsgemäß startet, gibt es keine Probleme beim Booten, also ist es 
Verwenden Sie dieses Tool besser nicht weiter.</span> <span font='10' foreground='gray'>Es funktioniert wahrscheinlich auch mit anderen Linux-Distributionen.</span>

Möchten Sie fortfahren?


 <span font='16' foreground='LightSkyBlue'>Daten bestätigen:</span>
    
<span font='11' foreground='gray'>Boot-Modus:</span> EFI
<span font='11' foreground='gray'>EFI-Partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Ausgewählte Partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Ausgewähltes System:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitions-UUID:</span> $UUID_PARTITION

Möchten Sie fortfahren? <span font='16' foreground='LightSkyBlue'>Daten bestätigen</span>:<span font='11' foreground='gray'>Boot-Modus:</span> LEGACY/BIOS
<span font='11' foreground='gray'>Ausgewählte Disc:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Festplattenpartitionstabelle: $DISK</span>_TABLE
    
<span font='11' foreground='gray'>Datenträgergröße:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Ausgewählte Partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Ausgewähltes System:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitionsformat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitions-UUID:</span> $UUID_PARTITION

Möchten Sie fortfahren?    

 <span font='16' foreground='LightSkyBlue'>Wählen Sie die gewünschte Option aus:</span>
        
Die Wiederherstellung kann auf 3 Arten durchgeführt werden (<span foreground='gray'>einfach, mittel oder vollständig</span>), im Zweifelsfall versuchen Sie die erste 
Starten Sie Ihren Computer neu und prüfen Sie, ob das Problem behoben ist.

Wenn das Problem weiterhin besteht, versuchen Sie es mit den anderen Optionen. <span font='16' foreground='LightSkyBlue'>Wählen Sie eine Option:</span>

Ich habe mehr als ein Linux auf diesem Computer installiert, wählen Sie aus, welches den Bootvorgang wiederherstellen soll: <span font='16' foreground='LightSkyBlue'>Wählen Sie eine Option:</span>

Ich habe mehr als eine EFI-Partition gefunden, wählen Sie aus, welche verwendet werden soll: <span font='16' foreground='LightSkyBlue'>Wählen Sie eine Option:</span>
    
Ich habe mehr als ein Speichergerät gefunden, wählen Sie aus, auf dem ich den Start aufzeichnen soll: Abwarten... Führen Sie die Schritte zur Zwischenwiederherstellung durch, aktualisieren Sie das System und überprüfen Sie, ob der LTS-Kernel installiert ist. Fertig! Beschreibung Scheibe Dieses Tool darf nur im Live-Modus verwendet werden! Interaktiv, öffnet das Kontrollzentrum innerhalb des ausgewählten Systems. Interaktiv, öffnet den Paketmanager pamac-manager auf dem ausgewählten System. Interaktiv, öffnet ein Terminal innerhalb des ausgewählten Systems. Intermediate, installiert das grub-Paket auf der Partition neu, regeneriert die Konfiguration und aktualisiert die initrd. Keine EFI-Partition ausgewählt, Vorgang abgebrochen. Keine Partition ausgewählt, Vorgang abgebrochen. Name Ich konnte kein installiertes Linux auf diesem Computer finden, der Vorgang wurde abgebrochen.
 Der Start im Live-Modus verwendet den EFI-Modus, aber ich <span foreground='red'>habe keine EFI-Partitionen auf</span> diesem Computer gefunden,
grub restore wird wahrscheinlich nicht funktionieren. 

Versuchen Sie, den Computer neu zu starten und über das Bios Ihres Computers im Legacy- oder BIOS-Modus zu starten.

Möchten Sie es auch mit wenig Arbeitsnachweis versuchen? Der Start im Live-Modus verwendet den Legacy-Modus, auch Bios genannt. 
<span foreground='red'>aber ich habe mindestens eine EFI-Partition auf diesem Computer gefunden</span>,
grub restore wird wahrscheinlich nicht funktionieren. 

Versuchen Sie, den Computer neu zu starten und über das Bios Ihres Computers im EFI-Modus zu starten.

Möchten Sie es auch mit wenig Arbeitsnachweis versuchen? Option Boot, Grub und initrd wiederherstellen Ihr Computer ist nicht mit dem Internet verbunden, die Optionen 2 und 3 benötigen Internet, um zu funktionieren. Ganz einfach: Schreiben Sie Grub einfach an den Anfang der Festplatte zurück. Partitionstabelle Größe 