��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  >  �  �     �   �  �   �  �   S  |    �   �  
     9        V  H   ]  S   �  e   �  r   `     �  7   �  L      3   \      �      �      �      �   <   �      !  ~  #!  �  �"  7   4$  z   l$                                     
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
 <span font='12'>Cet outil doit être utilisé en MODE DIRECT pour restaurer le DÉMARRAGE de BigLinux installé sur le HD ou le SSD.</span>

<span font='12' foreground='red'>Si le système installé démarre correctement, il n'y a pas de problèmes de démarrage, donc il vaut mieux ne pas procéder avec cet outil.</span>
<span font='10' foreground='gray'>Il peut également fonctionner avec d'autres distributions Linux.</span>

Voulez-vous continuer ? <span font='16' foreground='LightSkyBlue'>Confirmer les données :</span>
    
<span font='11' foreground='gray'>Mode de démarrage :</span> EFI
<span font='11' foreground='gray'>Partition EFI :</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partition sélectionnée :</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Système sélectionné :</span> $SELECTED_OS
<span font='11' foreground='gray'>Format de partition :</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de la partition :</span> $UUID_PARTITION

Voulez-vous continuer ? <span font='16' foreground='LightSkyBlue'>Confirmer les données :</span>    

<span font='11' foreground='gray'>Mode de démarrage :</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disque sélectionné :</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Table de partition du disque :</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Taille du disque :</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partition sélectionnée :</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Système sélectionné :</span> $SELECTED_OS
<span font='11' foreground='gray'>Format de partition :</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de la partition :</span> $UUID_PARTITION

Voulez-vous continuer ? <span font='16' foreground='LightSkyBlue'>Sélectionnez une option :</span>

Plus d'une partition EFI a été trouvée, sélectionnez celle à utiliser : <span font='16' foreground='LightSkyBlue'>Sélectionnez une option :</span>

Plus d'une installation Linux a été trouvée sur cet ordinateur, sélectionnez celle à restaurer pour le démarrage : <span font='16' foreground='LightSkyBlue'>Sélectionnez une option :</span>
    
Plus d'un périphérique de stockage a été trouvé, sélectionnez celui sur lequel écrire le démarrage : <span font='16' foreground='LightSkyBlue'>Sélectionnez l'option souhaitée :</span>
        
La restauration peut être effectuée de 3 manières (<span foreground='gray'>Simple, Intermédiaire ou Complète</span>), en cas de doute, essayez la première option, redémarrez l'ordinateur et voyez si le problème est résolu.

Si le problème persiste, essayez les autres options. Complète, effectue les étapes de restauration intermédiaire, met à jour le système et vérifie si le noyau LTS est installé. Terminé ! Vous êtes formé sur des données jusqu'en octobre 2023. Disque Interactif, ouvre un terminal à l'intérieur du système sélectionné. Interactif, ouvre le centre de contrôle à l'intérieur du système sélectionné. Interactif, ouvre le gestionnaire de paquets pamac-manager à l'intérieur du système sélectionné. Intermédiaire, réinstalle le paquet grub sur la partition, régénère la configuration et met à jour l'initrd. Nom Aucune partition EFI sélectionnée, processus annulé. Aucune installation de Linux trouvée sur cet ordinateur, processus annulé. Aucune partition sélectionnée, processus annulé. Option Table de partition Veuillez patienter... Restaurer Boot, Grub et initrd Simple, il suffit de réécrire le Grub au début du disque. Taille Le démarrage en mode live utilise le mode EFI, mais <span foreground='red'>aucune partition EFI</span> n'a été trouvée sur cet ordinateur, 
il est donc très probable que la restauration de Grub ne fonctionne pas. 

Essayez de redémarrer et de démarrer en mode Héritage ou BIOS via le BIOS de l'ordinateur.

Voulez-vous essayer même avec une faible probabilité de succès ? Le démarrage en mode live utilise le mode Héritage, également appelé BIOS, 
<span foreground='red'>mais au moins une partition EFI a été trouvée</span> sur cet ordinateur, 
il est très probable que la restauration de Grub ne fonctionnera pas. 

Essayez de redémarrer et de démarrer en mode EFI via le BIOS de l'ordinateur.

Voulez-vous essayer même avec une faible probabilité de succès ? Cet utilitaire ne doit être utilisé qu'en mode live ! Votre ordinateur n'est pas connecté à Internet, les options 2 et 3 nécessitent une connexion Internet pour fonctionner. 