��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �    p  �  �   :  �   �  �   v  
     w   (     �     �     �  7   �  B   �  O   6  ;   �  u   �  3   8   *   l      �   N   �   [  �   r  G"     �#     �#  ]   �#  ?   ;$     {$     �$                                                                                  
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
Language: nl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Deze tool moet worden gebruikt in LIVE MODE en om de BigLinux BOOT te herstellen 
geïnstalleerd op de HD of SSD.</span> <span font='12' foreground='red'>Als het geïnstalleerde systeem correct start, zijn er geen problemen bij het opstarten, dus het is 
beter niet doorgaan met het gebruik van deze tool.</span> <span font='10' foreground='gray'>Het werkt waarschijnlijk ook met andere Linux-distributies.</span>

Wilt u verder?


 <span font='16' foreground='LightSkyBlue'>Gegevens bevestigen:</span>
    
<span font='11' foreground='gray'>Opstartmodus:</span> EFI
<span font='11' foreground='gray'>EFI-partitie:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partitie geselecteerd:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Geselecteerd systeem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitie formaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitie UUID:</span> $UUID_PARTITION

Wilt u verder? <span font='16' foreground='LightSkyBlue'>Gegevens bevestigen:</span>    

<span font='11' foreground='gray'>Opstartmodus:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Geselecteerde schijf:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Schijfpartitietabel: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Schijfgrootte:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partitie geselecteerd:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Geselecteerd systeem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitie formaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitie UUID:</span> $UUID_PARTITION

Wilt u verder? <span font='16' foreground='LightSkyBlue'>Selecteer de gewenste optie:</span>
        
De restauratie kan op 3 manieren worden gedaan (<span foreground='gray'>eenvoudig, gemiddeld of voltooid</span>), probeer in geval van twijfel de eerste 
start de computer opnieuw op en kijk of deze is opgelost.

Als het probleem zich blijft voordoen, probeer dan de andere opties. <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>

Ik vond meer dan één Linux geïnstalleerd op deze computer, selecteer welke de boot moet herstellen: <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>

Ik vond meer dan één EFI-partitie, selecteer welke ik wil gebruiken: <span font='16' foreground='LightSkyBlue'>Selecteer een optie:</span>
    
Ik heb meer dan één opslagapparaat gevonden, selecteer waarop ik de opstart moet opnemen: Wachten... Voltooi, voer de tussentijdse herstelstappen uit, upgrade het systeem en controleer of de LTS kernel geïnstalleerd is. Klaar! Beschrijving Schijf Dit hulpmiddel mag alleen in live mode gebruikt worden! Interactief, opent het controlecentrum binnen het gekozen systeem. Interactief, opent de pamac-manager pakketbeheerder binnen het gekozen systeem. Interactief, opent een terminal binnen het gekozen systeem. Intermediate, installeert het grub pakket opnieuw op de partitie, regenereert de configuratie en werkt de initrd bij. Geen EFI-partitie geselecteerd, proces geannuleerd. Geen partitie gekozen, proces geannuleerd. Naam Ik kon geen Linux geïnstalleerd op deze computer vinden, proces geannuleerd.
 Het opstarten in de live-modus gebruikt de EFI-modus, maar ik <span foreground='red'>heb geen EFI-partities op</span> deze computer gevonden,
grub restore zal waarschijnlijk niet werken. 

Probeer opnieuw op te starten en via het Bios van uw computer op te starten in legacy- of BIOS-modus.

Wil je het zelfs proberen met weinig bewijs van werken? Het opstarten in live-modus is met behulp van legacy-modus, ook wel bios genoemd, 
<span foreground='red'>maar ik vond ten minste één EFI-partitie op deze computer</span>,
grub restore zal waarschijnlijk niet werken. 

Probeer opnieuw op te starten en via het bios van uw computer op te starten in de EFI-modus.

Wil je het zelfs proberen met weinig bewijs van werken? Optie Herstel Boot, Grub en initrd Uw computer is niet verbonden met internet, opties 2 en 3 hebben internet nodig om te werken. Simpel, schrijf Grub gewoon terug naar het begin van de schijf. Scheidingstabel Maat 