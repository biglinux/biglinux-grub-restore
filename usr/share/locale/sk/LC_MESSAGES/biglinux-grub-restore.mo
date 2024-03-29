��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4      �    u  �  �   T  �     �   �  
   v  s   �     �     �       7   	  =   A  L     6   �  a      6   e   2   �      �   T   �   T  +!  U  �"  	   �#  &   �#  b   $  D   j$     �$  	   �$                                                                                  
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
Language: sk
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Tento nástroj by sa mal používať v ŽIVOM REŽIME a na obnovenie BigLinux BOOT 
inštalované na HD alebo SSD.</span> <span font='12' foreground='red'>Ak sa nainštalovaný systém spúšťa správne, v zavádzaní nie sú žiadne problémy, takže je 
radšej nepokračujte v používaní tohto nástroja.</span> <span font='10' foreground='gray'>Pravdepodobne funguje aj s inými linuxovými distribúciami.</span>

Prajete si pokračovať?


 <span font='16' foreground='LightSkyBlue'>Potvrďte údaje:</span>
    
<span font='11' foreground='gray'>Zavádzací režim:</span> EFI
<span font='11' foreground='gray'>Oddiel EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Vybratá oblasť:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddielu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Oddiel UUID:</span> $UUID_PARTITION

Prajete si pokračovať? <span font='16' foreground='LightSkyBlue'>Potvrďte údaje:</span>    

<span font='11' foreground='gray'>Zavádzací režim:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Vybratý disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabuľka diskových oddielov: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Veľkosť disku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Vybratá oblasť:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Vybraný systém:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formát oddielu:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Oddiel UUID:</span> $UUID_PARTITION

Prajete si pokračovať? <span font='16' foreground='LightSkyBlue'>Vyberte požadovanú možnosť:</span>
        
Reštaurovanie je možné vykonať 3 spôsobmi (<span foreground='gray'>jednoduchým, stredným alebo úplným</span>), v prípade pochybností vyskúšajte prvý 
reštartujte počítač a skontrolujte, či sa to vyriešilo.

Ak problém pretrváva, vyskúšajte ostatné možnosti. <span font='16' foreground='LightSkyBlue'>Vyberte niektorú z možností:</span>

Našiel som viac ako jeden Linux nainštalovaný v tomto počítači, vyberte, ktorý z nich by mal obnoviť bootovanie: <span font='16' foreground='LightSkyBlue'>Vyberte niektorú z možností:</span>

Našiel som viac ako jeden oddiel EFI, vyberte, ktorý z nich sa má použiť: <span font='16' foreground='LightSkyBlue'>Vyberte niektorú z možností:</span>
    
Našiel som viac ako jedno úložné zariadenie, vyberte, na ktoré mám zaznamenať zavedenie: Počkaj... Dokončite, vykonajte kroky dočasného obnovenia, aktualizujte systém a overte, či je nainštalované jadro LTS. Robené! Popis Disk Tento nástroj sa musí používať len v režime Live! Interaktívne, otvorí riadiace centrum vo vybranom systéme. Interaktívne, otvorí správcu balíkov pamac-manager vo vybranom systéme. Interaktívne, otvorí terminál vo vybranom systéme. Intermediate, preinštaluje balík grub na oddiel, regeneruje konfiguráciu a aktualizuje initrd. Nie je vybraný žiadny oddiel EFI, proces sa zrušil. Nie je vybraný žiadny oddiel, proces sa zrušil. Názov V tomto počítači som nenašiel žiadny nainštalovaný Linux, proces sa zrušil.
 Bootovanie v živom režime používa režim EFI, ale na tomto počítači som <span foreground='red'>nenašiel žiadne oddiely EFI</span> ,
obnovenie grubu pravdepodobne nebude fungovať. 

Skúste reštartovať a spustiť systém Bios počítača v staršom režime alebo v režime BIOS.

Chcete to skúsiť aj s malým dôkazom o práci? Bootovanie v živom režime používa starší režim, nazývaný aj bios, 
<span foreground='red'>ale na tomto počítači som našiel aspoň jeden oddiel EFI</span>,
obnovenie grubu pravdepodobne nebude fungovať. 

Skúste reštartovať a spustiť systém Bios počítača v režime EFI.

Chcete to skúsiť aj s malým dôkazom o práci? Možnosť Obnovenie systému Boot, Grub a initrd Váš počítač nie je pripojený na internet, možnosti 2 a 3 potrebujú na fungovanie internet. Je to jednoduché, stačí zapísať Grub späť na začiatok disku. Tabuľka rozdelenia Veľkosť 