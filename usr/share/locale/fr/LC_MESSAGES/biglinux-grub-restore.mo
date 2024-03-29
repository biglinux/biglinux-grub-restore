��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4  7    �  H  j  4  �   �  �   ^  �   �     �  �   �     Q     W     c  >   j  H   �  Z   �  =   M   r   �   7   �   3   6!     j!  N   n!  V  �!  i  #     ~$     �$  n   �$  ?   %     S%     f%                                                                                  
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
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Cet outil doit être utilisé en MODE LIVE et pour restaurer le BIGLinux BOOT 
installé sur le DISQUE ou le SSD.</span> <span font='12' foreground='red'>Si le système installé démarre correctement, il n’y a pas de problèmes dans le démarrage, il est donc 
mieux vaut ne pas continuer à utiliser cet outil.</span> <span font='10' foreground='gray'>Il fonctionne probablement aussi avec d’autres distributions Linux.</span>

Voulez-vous continuer?


 <span font='16' foreground='LightSkyBlue'>Confirmer les données:</span>
    
<span font='11' foreground='gray'>Mode de démarrage:</span> EFI
<span font='11' foreground='gray'>Partition EFI :</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partition sélectionnée :</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Système sélectionné :</span> $SELECTED_OS
<span font='11' foreground='gray'>Format de partition:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de partition :</span> $UUID_PARTITION

Voulez-vous continuer? <span font='16' foreground='LightSkyBlue'>Confirmer les données:</span>    

<span font='11' foreground='gray'>Mode de démarrage:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disque sélectionné :</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Table de partition de disque : $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Taille du disque:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partition sélectionnée :</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Système sélectionné :</span> $SELECTED_OS
<span font='11' foreground='gray'>Format de partition:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de partition :</span> $UUID_PARTITION

Voulez-vous continuer? <span font='16' foreground='LightSkyBlue'>Sélectionnez l’option souhaitée :</span>
        
La restauration peut se faire de 3 manières (<span foreground='gray'>Simple, Intermédiaire ou Complète</span>), en cas de doute, essayez la première 
redémarrez votre ordinateur et voyez si c’est résolu.

Si le problème persiste, essayez les autres options. <span font='16' foreground='LightSkyBlue'>Sélectionnez une option :</span>

J’ai trouvé plus d’un Linux installé sur cet ordinateur, sélectionnez lequel doit restaurer le démarrage: <span font='16' foreground='LightSkyBlue'>Sélectionnez une option :</span>

J’ai trouvé plus d’une partition EFI, sélectionnez celle à utiliser: <span font='16' foreground='LightSkyBlue'>Sélectionnez une option :</span>
    
J’ai trouvé plus d’un périphérique de stockage, sélectionnez sur lequel je dois enregistrer le démarrage: Attendez... Terminé, effectuez les étapes de restauration intermédiaire, mettez le système à niveau et vérifiez que le noyau LTS est installé. Fait! Description Disque Cet utilitaire doit être utilisé en mode direct uniquement ! Interactif, ouvre le centre de contrôle dans le système sélectionné. Interactif, ouvre le gestionnaire de paquets pamac-manager dans le système sélectionné. Interactif, ouvre un terminal dans le système sélectionné. Intermédiaire, réinstalle le paquet grub sur la partition, régénère la configuration et met à jour l'initrd. Aucune partition EFI sélectionnée, processus annulé. Aucune partition sélectionnée, processus annulé. Nom Je n'ai pas trouvé de Linux installé sur cet ordinateur, processus annulé.
 Le démarrage en mode live utilise le mode EFI, mais je <span foreground='red'>n’ai trouvé aucune partition EFI sur</span> cet ordinateur,
grub restore ne fonctionnera probablement pas. 

Essayez de redémarrer et de démarrer le Bios de votre ordinateur en mode Hérité ou BIOS.

Vous voulez essayer même avec peu de preuves de travail? Le démarrage en mode live utilise le mode Legacy, également appelé bios, 
<span foreground='red'>mais j’ai trouvé au moins une partition EFI sur cet ordinateur</span>,
grub restore ne fonctionnera probablement pas. 

Essayez de redémarrer et de démarrer le Bios de votre ordinateur en mode EFI.

Vous voulez essayer même avec peu de preuves de travail? Option Restaurer Boot, Grub et initrd Votre ordinateur n’est pas connecté à Internet, les options 2 et 3 nécessitent Internet pour fonctionner. C'est simple, il suffit de réécrire Grub au début du disque. Table de partition Taille 