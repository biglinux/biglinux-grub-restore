��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  4  �  �  �  �   �  �   V  �   	  q  �  z         �     �     �  ;   �  D   �  V   :  e   �     �  7   �  N   4  3   �     �     �     �     �  =         F   ]  N   v  �!  4   ##  d   X#                                     
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
 <span font='12'>Esta ferramenta deve ser usada no MODO LIVE para restaurar o BOOT do BigLinux instalado no HD ou SSD.</span>

<span font='12' foreground='red'>Se o sistema instalado estiver inicializando corretamente, não há problemas de inicialização, então é melhor não prosseguir com esta ferramenta.</span>
<span font='10' foreground='gray'>Pode também funcionar com outras distribuições Linux.</span>

Você deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirme os dados:</span>
    
<span font='11' foreground='gray'>Modo de inicialização:</span> EFI
<span font='11' foreground='gray'>Partição EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Você deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirme os dados:</span>    

<span font='11' foreground='gray'>Modo de inicialização:</span>  LEGADO/BIOS
<span font='11' foreground='gray'>Disco selecionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela de partição do disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Tamanho do disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Você deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de uma partição EFI foi encontrada, selecione qual usar: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de uma instalação do Linux foi encontrada neste computador, selecione qual delas restaurar o boot: <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de um dispositivo de armazenamento foi encontrado, selecione qual deles gravar o boot: <span font='16' foreground='LightSkyBlue'>Selecione a opção desejada:</span>
        
A restauração pode ser feita de 3 maneiras (<span foreground='gray'>Simples, Intermediária ou Completa</span>), se tiver dúvidas, experimente a primeira opção, reinicie o computador e veja se o problema foi resolvido.

Se o problema persistir, experimente as outras opções. Conclui, executa os passos de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Concluído! Descrição Disco Interativo, abre um terminal dentro do sistema selecionado. Interativo, abre o centro de controle dentro do sistema selecionado. Interativo, abre o gerenciador de pacotes pamac-manager dentro do sistema selecionado. Intermediário, reinstala o pacote grub na partição, regenera a configuração e atualiza o initrd. Nome Nenhuma partição EFI selecionada, processo cancelado. Nenhuma instalação do Linux encontrada neste computador, processo cancelado. Nenhuma partição selecionada, processo cancelado. Opção Tabela de Partição Por favor, aguarde... Restaurar Boot, Grub e initrd Simples, apenas escreve o Grub novamente no início do disco. Tamanho O boot em modo live está usando o modo EFI, mas <span foreground='red'>nenhuma partição EFI</span> foi encontrada neste computador, 
é muito provável que a restauração do Grub não funcione. 

Tente reiniciar e inicializar em modo Legacy ou BIOS através do BIOS do computador.

Você quer tentar mesmo com uma baixa probabilidade de sucesso? O boot em modo live está usando o modo Legacy, também chamado de BIOS, 
<span foreground='red'>mas pelo menos uma partição EFI foi encontrada</span> neste computador, 
é muito provável que a restauração do Grub não funcione. 

Tente reiniciar e inicializar em modo EFI através do BIOS do computador.

Você quer tentar mesmo com uma baixa probabilidade de sucesso? Este utilitário deve ser usado apenas no modo live! Seu computador não está conectado à internet, as opções 2 e 3 requerem internet para funcionar. 