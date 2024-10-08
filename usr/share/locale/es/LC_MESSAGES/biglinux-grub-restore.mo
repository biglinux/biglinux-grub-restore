��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  +  �  �  �  �   �  �   =  �   �  T  �  {   �     p     ~     �  ?   �  G   �  V     i   p     �  <   �  S     <   r     �     �     �     �  >   �     =   q  E   �  �!  1   :#  c   l#                                     
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
 <span font='12'>Esta herramienta debe usarse en MODO EN VIVO para restaurar el BOOT de BigLinux instalado en el HD o SSD.</span>

<span font='12' foreground='red'>Si el sistema instalado está arrancando correctamente, no hay problemas de arranque, por lo que es mejor no proceder con esta herramienta.</span>
<span font='10' foreground='gray'>También puede funcionar con otras distribuciones de Linux.</span>

¿Desea continuar? <span font='16' foreground='LightSkyBlue'>Confirma los datos:</span>
    
<span font='11' foreground='gray'>Modo de arranque:</span> EFI
<span font='11' foreground='gray'>Partición EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partición seleccionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema seleccionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato de partición:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de partición:</span> $UUID_PARTITION

¿Deseas continuar? <span font='16' foreground='LightSkyBlue'>Confirma los datos:</span>    

<span font='11' foreground='gray'>Modo de arranque:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disco seleccionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabla de particiones del disco:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Tamaño del disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partición seleccionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema seleccionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato de partición:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de partición:</span> $UUID_PARTITION

¿Deseas continuar? <span font='16' foreground='LightSkyBlue'>Seleccione una opción:</span>

Se encontró más de una partición EFI, seleccione cuál usar: <span font='16' foreground='LightSkyBlue'>Seleccione una opción:</span>

Se encontró más de una instalación de Linux en este ordenador, seleccione cuál restaurar el arranque: <span font='16' foreground='LightSkyBlue'>Seleccione una opción:</span>
    
Se encontró más de un dispositivo de almacenamiento, seleccione a cuál escribir el arranque: <span font='16' foreground='LightSkyBlue'>Seleccione la opción deseada:</span>
        
La restauración se puede realizar de 3 maneras (<span foreground='gray'>Simple, Intermedia o Completa</span>), si tiene dudas, pruebe la primera opción, reinicie el ordenador y vea si se resuelve.

Si el problema persiste, pruebe las otras opciones. Completa, realiza los pasos de restauración intermedios, actualiza el sistema y verifica si el kernel LTS está instalado. ¡Completado! Descripción Disco Interactivo, abre una terminal dentro del sistema seleccionado. Interactivo, abre el centro de control dentro del sistema seleccionado. Interactivo, abre el gestor de paquetes pamac-manager dentro del sistema seleccionado. Intermedio, reinstala el paquete grub en la partición, regenera la configuración y actualiza el initrd. Nombre No se seleccionó ninguna partición EFI, proceso cancelado. No se encontró ninguna instalación de Linux en este ordenador, proceso cancelado. No se ha seleccionado ninguna partición, proceso cancelado. Opción Tabla de particiones Por favor espera... Restaurar Boot, Grub e initrd Simple, solo vuelve a escribir el Grub al principio del disco. Tamaño El arranque en modo en vivo está utilizando el modo EFI, pero <span foreground='red'>no se encontró ninguna partición EFI</span> en este ordenador, 
lo más probable es que la restauración de Grub no funcione. 

Intenta reiniciar y arrancar en modo Legacy o BIOS a través de la BIOS del ordenador.

¿Quieres intentarlo incluso con una baja probabilidad de éxito? El arranque en modo en vivo está utilizando el modo Legacy, también llamado BIOS, 
<span foreground='red'>pero se encontró al menos una partición EFI</span> en este ordenador, 
lo más probable es que la restauración de Grub no funcione. 

Intenta reiniciar y arrancar en modo EFI a través del BIOS del ordenador.

¿Quieres intentarlo incluso con una baja probabilidad de éxito? ¡Esta utilidad solo debe usarse en modo en vivo! Tu computadora no está conectada a internet, las opciones 2 y 3 requieren internet para funcionar. 