��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �    n  �  �   4  �   �  �   �  	   .  w   8     �     �     �  K   �  ?     O   P  7   �  q   �  2   J   .   }      �   ]   �   B  !  h  T"     �#  &   �#  \   �#  @   J$     �$     �$                                                                                  
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
Language: cs
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Tento nástroj by měl být použit v LIVE MODE a obnovit BigLinux BOOT 
nainstalované na HD nebo SSD.</span> <span font='12' foreground='red'>Pokud se nainstalovaný systém spouští správně, nejsou při zavádění žádné problémy, takže je 
lepší není pokračovat v používání tohoto nástroje.</span> <span font='10' foreground='gray'>Pravděpodobně funguje i s jinými distribucemi Linuxu.</span>

Chcete pokračovat?


 <span font='16' foreground='LightSkyBlue'>Potvrdit data:</span>
    
<span font='11' foreground='gray'>Spouštěcí režim:</span> EFI
<span font='11' foreground='gray'>Oddíl EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Vybraný oddíl:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddílu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddílu:</span> $UUID_PARTITION

Chcete pokračovat? <span font='16' foreground='LightSkyBlue'>Potvrdit data:</span>    

<span font='11' foreground='gray'>Režim spouštění:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Vybraný disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabulka diskových oddílů: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Velikost disku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Vybraný oddíl:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddílu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID oddílu:</span> $UUID_PARTITION

Chcete pokračovat? <span font='16' foreground='LightSkyBlue'>Vyberte požadovanou možnost:</span>
        
Restaurování lze provést 3 způsoby (<span foreground='gray'>jednoduché, středně pokročilé nebo úplné</span>), v případě pochybností zkuste první 
restartujte počítač a zjistěte, zda je vyřešen.

Pokud problém přetrvává, vyzkoušejte další možnosti. <span font='16' foreground='LightSkyBlue'>Vyberte možnost:</span>

Našel jsem více než jeden Linux nainstalovaný v tomto počítači, vyberte, který z nich by měl obnovit boot: <span font='16' foreground='LightSkyBlue'>Vyberte možnost:</span>

Našel jsem více než jeden oddíl EFI, vyberte, který z nich chcete použít: <span font='16' foreground='LightSkyBlue'>Vyberte možnost:</span>
    
Našel jsem více než jedno paměťové zařízení, vyberte, na kterém bych měl zaznamenat boot: Vydrž... Dokončete, proveďte kroky přechodného obnovení, aktualizujte systém a ověřte, zda je nainstalováno jádro LTS. Hotový! Popis Disk Tento nástroj musí být používán pouze v režimu živého vysílání! Interaktivní, otevře řídicí centrum ve vybraném systému. Interaktivní, otevře správce balíčků pamac-manager ve vybraném systému. Interaktivní, otevře terminál ve vybraném systému. Intermediate, znovu nainstaluje balíček grub na diskový oddíl, přegeneruje konfiguraci a aktualizuje initrd. Není vybrán žádný oddíl EFI, proces zrušen. Není vybrán žádný oddíl, proces zrušen. Název V tomto počítači jsem nenašel žádný nainstalovaný systém Linux, proces byl zrušen.
 Spuštění v živém režimu používá režim EFI, ale <span foreground='red'>na tomto počítači jsem nenašel žádné oddíly EFI</span> ,
grub restore pravděpodobně nebude fungovat. 

Zkuste restartovat a spustit systém BIOS počítače v režimu Legacy nebo BIOS.

Chcete to zkusit i s malým důkazem o práci? Spuštění v živém režimu používá režim Legacy, nazývaný také bios, 
<span foreground='red'>ale našel jsem alespoň jeden oddíl EFI v tomto počítači</span>,
grub restore pravděpodobně nebude fungovat. 

Zkuste restartovat a prostřednictvím spuštění systému BIOS počítače v režimu EFI.

Chcete to zkusit i s malým důkazem o práci? Možnost Obnovení systému Boot, Grub a initrd Váš počítač není připojen k internetu, možnosti 2 a 3 potřebují internet k práci. Je to jednoduché, stačí zapsat Grub zpět na začátek disku. Tabulka rozdělení Velikost 