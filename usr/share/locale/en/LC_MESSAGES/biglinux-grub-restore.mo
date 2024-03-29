��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �  �  ?  �  �   �  �   x  �   �  
   �  q   �               !  ,   &  A   S  P   �  9   �  q      ,   �  (   �     �  I   �  (  7   2  `!     �"     �"  V   �"  :   #     J#     Z#                                                                                  
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
Language: en
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>This tool should be used in LIVE MODE and to restore the BigLinux BOOT 
installed on the HD or SSD.</span> <span font='12' foreground='red'>If the installed system is starting properly there are no problems in the boot, so it is 
better not continue the use of this tool.</span> <span font='10' foreground='gray'>It probably works also with other Linux distributions.</span>

Do you wish to proceed?


 <span font='16' foreground='LightSkyBlue'>Confirm data:</span>
    
<span font='11' foreground='gray'>Boot mode:</span> EFI
<span font='11' foreground='gray'>EFI partition:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partition selected:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you wish to proceed? <span font='16' foreground='LightSkyBlue'>Confirm data:</span>    

<span font='11' foreground='gray'>Boot mode:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Selected disc:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Disk partition table: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Disk Size:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partition selected:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Selected system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partition format:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partition UUID:</span> $UUID_PARTITION

Do you wish to proceed? <span font='16' foreground='LightSkyBlue'>Select the option you want:</span>
        
The restoration can be done in 3 ways (<span foreground='gray'>Simple, Intermediate or Complete</span>), in case of doubt, try the first 
restart your computer and see if it's resolved.

If the problem persists try the other options. <span font='16' foreground='LightSkyBlue'>Select an option:</span>

I found more than one Linux installed on this computer, select which one should restore the boot: <span font='16' foreground='LightSkyBlue'>Select an option:</span>

I found more than one EFI partition, select which one to use: <span font='16' foreground='LightSkyBlue'>Select an option:</span>
    
I found more than one storage device, select on which i should record the boot: Hold on... It completes, performs the interim restore steps, upgrades the system, and checks if the LTS kernel is installed. Done! Description Disc This utility must be used in live mode only! Interactive, opens the control center within the selected system. Interactive, opens the pamac-manager package manager within the selected system. Interactive, opens a terminal within the selected system. Intermediate, reinstalls the grub package on the partition, regenerates the configuration and updates the initrd. No EFI partition selected, process canceled. No partition selected, process canceled. Name I could not find any Linux installed on this computer, process canceled.
 The boot in live mode is using EFI mode, but I <span foreground='red'>have not found any EFI partitions on</span> this computer,
grub restore will probably not work. 

Try restarting and through your computer's Bios boot ing in Legacy or BIOS mode.

Want to try even with little proof of working? The boot in live mode is using Legacy mode, also called bios, 
<span foreground='red'>but I found at least one EFI partition on this computer</span>,
grub restore will probably not work. 

Try restarting and through your computer's Bios boot ing in EFI mode.

Want to try even with little proof of working? Option Restore Boot, Grub and initrd Your computer is not connected to the internet, options 2 and 3 need internet to work. Simple, just write Grub back to the beginning of the disk. Partition table Size 