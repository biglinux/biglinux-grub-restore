��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4  '  �  �  !  R  �  �   N  �   �  �   �  	   6  |   @     �     �     �  3   �  G     V   U  >   �  i   �  @   U   <   �      �   P   �   d  +!  q  �"     $     
$  c   ($  =   �$     �$     �$                                                                                  
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
Language: es
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Esta herramienta debe usarse en MODO VIVO y para restaurar el BIGLinux BOOT 
instalado en el HD o SSD.</span> <span font='12' foreground='red'>Si el sistema instalado se está iniciando correctamente no hay problemas en el arranque, por lo que es 
mejor no continuar con el uso de esta herramienta.</span> <span font='10' foreground='gray'>Probablemente funciona también con otras distribuciones de Linux.</span>

¿Desea continuar?


 <span font='16' foreground='LightSkyBlue'>Confirmar datos:</span>
    
<span font='11' foreground='gray'>Modo de arranque:</span> EFI
<span font='11' foreground='gray'>Partición EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partición seleccionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema seleccionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato de partición:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de partición:</span> $UUID_PARTITION

¿Desea continuar? <span font='16' foreground='LightSkyBlue'>Confirmar datos:</span>    

<span font='11' foreground='gray'>Modo de arranque:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Disco seleccionado:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabla de particiones de disco: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Tamaño del disco:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partición seleccionada:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistema seleccionado:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formato de partición:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID de partición:</span> $UUID_PARTITION

¿Desea continuar? <span font='16' foreground='LightSkyBlue'>Seleccione la opción que desee:</span>
        
La restauración se puede hacer de 3 maneras (<span foreground='gray'>Simple, Intermedia o Completa</span>), en caso de duda, pruebe la primera 
reinicie el equipo y compruebe si está resuelto.

Si el problema persiste, pruebe las otras opciones. <span font='16' foreground='LightSkyBlue'>Seleccione una opción:</span>

Encontré más de un Linux instalado en esta computadora, seleccione cuál debe restaurar el arranque: <span font='16' foreground='LightSkyBlue'>Seleccione una opción:</span>

Encontré más de una partición EFI, seleccione cuál usar: <span font='16' foreground='LightSkyBlue'>Seleccione una opción:</span>
    
Encontré más de un dispositivo de almacenamiento, seleccione en el que debo grabar el arranque: Espera... Completa, realiza los pasos de restauración provisional, actualiza el sistema y verifica que el kernel LTS está instalado. ¡Hecho! Descripción Disco Esta utilidad sólo debe utilizarse en modo directo Interactivo, abre el centro de control dentro del sistema seleccionado. Interactivo, abre el gestor de paquetes pamac-manager dentro del sistema seleccionado. Interactivo, abre un terminal dentro del sistema seleccionado. Intermedio, reinstala el paquete grub en la partición, regenera la configuración y actualiza el initrd. No se ha seleccionado ninguna partición EFI, proceso cancelado. No se ha seleccionado ninguna partición, proceso cancelado. Nombre No pude encontrar ningún Linux instalado en este ordenador, proceso cancelado.
 El arranque en modo en vivo está utilizando el modo EFI, pero <span foreground='red'>no he encontrado ninguna partición EFI en</span> esta computadora,
grub restore probablemente no funcionará. 

Intente reiniciar y a través del bios de su computadora arrancar en modo heredado o BIOS.

¿Quieres intentarlo incluso con pocas pruebas de funcionamiento? El arranque en modo en vivo está utilizando el modo Legacy, también llamado bios, 
<span foreground='red'>pero encontré al menos una partición EFI en esta computadora</span>,
grub restore probablemente no funcionará. 

Intente reiniciar y a través del bios de su computadora arrancar en modo EFI.

¿Quieres intentarlo incluso con pocas pruebas de funcionamiento? Opción Restaurar Boot, Grub e initrd Su computadora no está conectada a Internet, las opciones 2 y 3 necesitan Internet para funcionar. Sencillo, sólo hay que escribir Grub al principio del disco. Tabla de partición Tamaño 