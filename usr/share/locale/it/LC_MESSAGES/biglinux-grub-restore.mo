��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  %  �  �  �  �   �  �   @  �   �  Y  �  {   �  	   g     q     }  C   �  D   �  V     e   c     �  7   �  N     3   U     �     �  
   �     �  9   �  
      b     `  y!  C   �"  l   #                                     
                                                   	                                                 <span font='12'>This tool should be used in LIVE MODE to restore the BOOT of the BigLinux installed on the HD or SSD.</span>

<span font='12' foreground='red'>If the installed system is booting correctly, there are no boot problems, so it's better not to proceed with this tool.</span>
<span font='10' foreground='gray'>It may also work with other Linux distributions.</span>

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Confirm the data:</span>
    
<span font='11' foreground='gray'>Boot mode:</span> EFI
<span font='11' foreground='gray'>EFI partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Selected partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Confirm the data:</span>    

<span font='11' foreground='gray'>Boot mode:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Selected disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Disk partition table:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Disk size:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Selected partition:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you want to proceed? <span font='16' foreground='LightSkyBlue'>Select an option:</span>

More than one EFI partition was found, select which one to use: <span font='16' foreground='LightSkyBlue'>Select an option:</span>

More than one Linux installation was found on this computer, select which one to restore the boot: <span font='16' foreground='LightSkyBlue'>Select an option:</span>
    
More than one storage device was found, select which one to write the boot to: <span font='16' foreground='LightSkyBlue'>Select the desired option:</span>
        
The restore can be done in 3 ways (<span foreground='gray'>Simple, Intermediate, or Complete</span>), if in doubt, try the first option, restart the computer and see if it is resolved.

If the problem persists, try the other options. Complete, performs the intermediate restore steps, updates the system, and checks if the LTS kernel is installed. Completed! Description Disk Interactive, opens a terminal inside the selected system. Interactive, opens the control center inside the selected system. Interactive, opens the pamac-manager package manager inside the selected system. Intermediate, reinstalls the grub package on the partition, regenerates the configuration, and updates the initrd. Name No EFI partition selected, process canceled. No Linux installation found on this computer, process canceled. No partition selected, process canceled. Option Partition Table Please wait... Restore Boot, Grub, and initrd Simple, just writes the Grub again at the beginning of the disk. Size The boot in live mode is using EFI mode, but <span foreground='red'>no EFI partition</span> was found on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in Legacy or BIOS mode through the computer's BIOS.

Do you want to try even with a low probability of success? The boot in live mode is using Legacy mode, also called BIOS, 
<span foreground='red'>but at least one EFI partition was found</span> on this computer, 
most likely the Grub restore will not work. 

Try restarting and booting in EFI mode through the computer's BIOS.

Do you want to try even with a low probability of success? This utility should only be used in live mode! Your computer is not connected to the internet, options 2 and 3 require internet to work. Project-Id-Version: biglinux-grub-restore
Report-Msgid-Bugs-To: 
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language-Team: LANGUAGE <LL@li.org>
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Questo strumento deve essere utilizzato in MODALITÀ LIVE per ripristinare il BOOT del BigLinux installato sull'HD o SSD.</span>

<span font='12' foreground='red'>Se il sistema installato si avvia correttamente, non ci sono problemi di avvio, quindi è meglio non procedere con questo strumento.</span>
<span font='10' foreground='gray'>Potrebbe funzionare anche con altre distribuzioni Linux.</span>

Vuoi procedere? <span font='16' foreground='LightSkyBlue'>Conferir os dados:</span>

<span font='11' foreground='gray'>Modo de inicialização:</span> EFI
<span font='11' foreground='gray'>Partição EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Deseja continuar? <span font='16' foreground='LightSkyBlue'>Conferir os dados:</span>    

<span font='11' foreground='gray'>Modo de inicialização:</span> LEGACY/BIOS
<span font='11' foreground='gray'>Disco selecionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela de partição do disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Tamanho do disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Deseja continuar? <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de uma partição EFI foi encontrada, selecione qual deseja usar: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de uma instalação do Linux foi encontrada neste computador, selecione qual restaurar o boot: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de um dispositivo de armazenamento foi encontrado, selecione em qual escrever o boot: <span font='16' foreground='LightSkyBlue'>Seleziona l'opzione desiderata:</span>

Il ripristino può essere effettuato in 3 modi (<span foreground='gray'>Semplice, Intermedio o Completo</span>), in caso di dubbio, prova la prima opzione, riavvia il computer e verifica se il problema è risolto.

Se il problema persiste, prova le altre opzioni. Completa, executa as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Concluso! Descrizione Disco Interattivo, apre un terminale all'interno del sistema selezionato. Interativo, abre o centro de controle dentro do sistema selecionado. Interativo, abre o gerenciador de pacotes pamac-manager dentro do sistema selecionado. Intermediário, reinstala o pacote grub na partição, regenera a configuração e atualiza o initrd. Nome Nessuna partizione EFI selezionata, processo annullato. Nessuna installazione di Linux trovata su questo computer, processo annullato. Nessuna partizione selezionata, processo annullato. Opzione Tabela de Partições Aguarde... Ripristina Boot, Grub e initrd Semplice, scrive nuovamente il Grub all'inizio del disco. Dimensione Il boot in modalità live è in modalità EFI, ma <span foreground='red'>nessuna partizione EFI</span> è stata trovata su questo computer, molto probabilmente il ripristino di Grub non funzionerà.

Prova a riavviare e a fare il boot in modalità Legacy o BIOS attraverso il BIOS del computer.

Vuoi provare anche con una bassa probabilità di successo? Il boot in modalità live sta utilizzando la modalità Legacy, anche chiamata BIOS, ma è stata trovata almeno una partizione EFI su questo computer, molto probabilmente il ripristino di Grub non funzionerà.

Prova a riavviare e fare il boot in modalità EFI attraverso il BIOS del computer.

Vuoi provare anche con una bassa probabilità di successo? Questo strumento dovrebbe essere utilizzato solo in modalità live! Il computer non è connesso a Internet, le opzioni 2 e 3 richiedono una connessione Internet per funzionare. 