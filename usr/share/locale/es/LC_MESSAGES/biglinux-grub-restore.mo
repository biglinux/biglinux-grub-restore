��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  &  �  �  �  �   �  �   ;  �   �  J  �  {   �     W     c     p  ;   v  D   �  V   �  e   N     �  <   �  U   �  3   N     �     �     �     �  >   �        R     f  l!  :   �"  c   #                                     
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
Language: es
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Esta ferramenta deve ser usada no MODO AO VIVO para restaurar o BOOT do BigLinux instalado no HD ou SSD.</span>

<span font='12' foreground='red'>Se o sistema instalado estiver inicializando corretamente, sem problemas de inicialização, é melhor não prosseguir com esta ferramenta.</span>
<span font='10' foreground='gray'>Também pode funcionar com outras distribuições Linux.</span>

Deseja prosseguir? <span font='16' foreground='LightSkyBlue'>Confirmar os dados:</span>

<span font='11' foreground='gray'>Modo de inicialização:</span> EFI
<span font='11' foreground='gray'>Partição EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Deseja continuar? <span font='16' foreground='LightSkyBlue'>Confirmar os dados:</span>    

<span font='11' foreground='gray'>Modo de inicialização:</span> LEGACY/BIOS
<span font='11' foreground='gray'>Disco selecionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela de partição do disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Tamanho do disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partição selecionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema selecionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato da partição:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID da partição:</span> $UUID_PARTITION

Deseja continuar? <span font='16' foreground='LightSkyBlue'>Selecione uma opção:</span>

Mais de uma partição EFI foi encontrada, selecione qual deseja usar: <span font='16' foreground='LightSkyBlue'>Seleccionar una opción:</span>

Mais de uma instalação do Linux foi encontrada neste computador, selecione qual restaurar o boot: <span font='16' foreground='LightSkyBlue'>Seleccionar una opción:</span>

Mais de um dispositivo de armazenamento foi encontrado, selecione em qual escrever o boot: <span font='16' foreground='LightSkyBlue'>Seleccione la opción deseada:</span>

La restauración se puede hacer de 3 formas (<span foreground='gray'>Simple, Intermedia o Completa</span>), si tiene dudas, pruebe la primera opción, reinicie la computadora y vea si se resuelve.

Si el problema persiste, pruebe las otras opciones. Completa, executa as etapas de restauração intermediária, atualiza o sistema e verifica se o kernel LTS está instalado. Completado! Descripción Disco Interativo, abre um terminal dentro do sistema selecionado. Interativo, abre o centro de controle dentro do sistema selecionado. Interativo, abre o gerenciador de pacotes pamac-manager dentro do sistema selecionado. Intermediário, reinstala o pacote grub na partição, regenera a configuração e atualiza o initrd. Nombre No se seleccionó ninguna partición EFI, proceso cancelado. No se encontró ninguna instalación de Linux en esta computadora, proceso cancelado. Ninguna partición seleccionada, proceso cancelado. Opción Tabla de particiones Por favor, espere... Restaurar Boot, Grub e initrd Simplemente escribe el Grub nuevamente al principio del disco. Tamaño El arranque en modo live está utilizando el modo EFI, pero no se encontró ninguna partición EFI en esta computadora, lo más probable es que la restauración de Grub no funcione.

Intente reiniciar y arrancar en modo Legacy o BIOS a través de la BIOS de la computadora.

¿Desea intentarlo incluso con una baja probabilidad de éxito? El arranque en modo live está utilizando el modo Legacy, también llamado BIOS, pero al menos se encontró una partición EFI en esta computadora, lo más probable es que la restauración de Grub no funcione.

Intente reiniciar y arrancar en modo EFI a través de la BIOS de la computadora.

¿Quieres intentarlo incluso con una baja probabilidad de éxito? ¡Este utilitario solo debe ser utilizado en modo en vivo! Tu computadora no está conectada a internet, las opciones 2 y 3 requieren internet para funcionar. 