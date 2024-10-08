��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �    �  �  �  �   �  �   @  �   �  `  �  s   	     }     �     �  C   �  M   �  Y   -  j   �     �  7   �  N   /  3   ~     �     �     �     �  >      
   D   f  O   v  �!  C   -#  `   q#                                     
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
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Questo strumento dovrebbe essere utilizzato in MODALITÀ LIVE per ripristinare il BOOT di BigLinux installato su HD o SSD.</span>

<span font='12' foreground='red'>Se il sistema installato si avvia correttamente, non ci sono problemi di avvio, quindi è meglio non procedere con questo strumento.</span>
<span font='10' foreground='gray'>Potrebbe funzionare anche con altre distribuzioni Linux.</span>

Vuoi procedere? <span font='16' foreground='LightSkyBlue'>Conferma i dati:</span>
    
<span font='11' foreground='gray'>Modalità di avvio:</span> EFI
<span font='11' foreground='gray'>Partizione EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partizione selezionata:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selezionato:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato partizione:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partizione:</span> $UUID_PARTITION

Vuoi procedere? <span font='16' foreground='LightSkyBlue'>Conferma i dati:</span>    

<span font='11' foreground='gray'>Modalità di avvio:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disco selezionato:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabella delle partizioni del disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Dimensione del disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partizione selezionata:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selezionato:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato della partizione:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID della partizione:</span> $UUID_PARTITION

Vuoi procedere? <span font='16' foreground='LightSkyBlue'>Seleziona un'opzione:</span>

È stata trovata più di una partizione EFI, seleziona quale utilizzare: <span font='16' foreground='LightSkyBlue'>Seleziona un'opzione:</span>

Sono state trovate più installazioni di Linux su questo computer, seleziona quale ripristinare il boot: <span font='16' foreground='LightSkyBlue'>Seleziona un'opzione:</span>
    
È stato trovato più di un dispositivo di archiviazione, seleziona quale utilizzare per scrivere il boot: <span font='16' foreground='LightSkyBlue'>Seleziona l'opzione desiderata:</span>
        
Il ripristino può essere effettuato in 3 modi (<span foreground='gray'>Semplice, Intermedio o Completo</span>), in caso di dubbi, prova la prima opzione, riavvia il computer e verifica se il problema è risolto.

Se il problema persiste, prova le altre opzioni. Completa, esegue i passaggi di ripristino intermedi, aggiorna il sistema e verifica se il kernel LTS è installato. Completato! Descrizione Disco Interattivo, apre un terminale all'interno del sistema selezionato. Interattivo, apre il centro di controllo all'interno del sistema selezionato. Interattivo, apre il gestore pacchetti pamac-manager all'interno del sistema selezionato. Intermedio, reinstalla il pacchetto grub sulla partizione, rigenera la configurazione e aggiorna l'initrd. Nome Nessuna partizione EFI selezionata, processo annullato. Nessuna installazione di Linux trovata su questo computer, processo annullato. Nessuna partizione selezionata, processo annullato. Opzione Tabella delle partizioni Attendere prego... Ripristina Boot, Grub e initrd Semplice, riscrive semplicemente il Grub all'inizio del disco. Dimensione L'avvio in modalità live utilizza la modalità EFI, ma <span foreground='red'>non è stata trovata alcuna partizione EFI</span> su questo computer, 
è molto probabile che il ripristino di Grub non funzioni. 

Prova a riavviare e avviare in modalità Legacy o BIOS attraverso il BIOS del computer.

Vuoi provare anche con una bassa probabilità di successo? L'avvio in modalità live utilizza la modalità Legacy, nota anche come BIOS, 
<span foreground='red'>ma è stata trovata almeno una partizione EFI</span> su questo computer, 
è molto probabile che il ripristino di Grub non funzioni. 

Prova a riavviare e avviare in modalità EFI attraverso il BIOS del computer.

Vuoi provare anche con una bassa probabilità di successo? Questo strumento dovrebbe essere utilizzato solo in modalità live! Il tuo computer non è connesso a Internet, le opzioni 2 e 3 richiedono Internet per funzionare. 