��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �  �  o  �  �     ~   �  �   *  	   �  n   �     @     H     P  2   T  7   �  D   �  4     \   9  &   �  "   �     �  C   �  M  )   f  w!  	   �"  !   �"  `   
#  3   k#     �#     �#                                                                                  
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
Language: is
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Þetta tól ætti að nota í LIVE MODE og til að endurheimta BigLinux BOOT 
sett upp á HD eða SSD.</span> <span font='12' foreground='red'>Ef uppsett kerfi er að byrja rétt eru engin vandamál í stígvélinni, svo það er 
betra að halda ekki áfram að nota þetta tól.</span> <span font='10' foreground='gray'>Það virkar líklega líka með öðrum Linux dreifingum.</span>

Viltu halda áfram?


 <span font='16' foreground='LightSkyBlue'>Staðfestu gögn:</span>
    
<span font='11' foreground='gray'>Ræsihamur:</span> EFI
<span font='11' foreground='gray'>EFI skipting:</span> $EFI_SKIPTING
    
<span font='11' foreground='gray'>Skipting valin:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valið kerfi:</span> $SELECTED_OS
<span font='11' foreground='gray'>Skiptingarsnið:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Skipting UUID:</span> $UUID_SKIPTING

Viltu halda áfram? <span font='16' foreground='LightSkyBlue'>Staðfestu gögn:</span> <span font='11' foreground='gray'>Ræsistilling:</span> LEGACY / BIOS
<span font='11' foreground='gray'>Valinn diskur:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Diskur skipting borð: $DISK</span>_TABLE
    
<span font='11' foreground='gray'>Diskur Stærð:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Skipting valin:</span> $SELECTED_SKIPTING
<span font='11' foreground='gray'>Valið kerfi:</span> $SELECTED_OS
<span font='11' foreground='gray'>Snið skiptingar:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Skipting UUID:</span> $UUID_SKIPTING

Viltu halda áfram?    

 <span font='16' foreground='LightSkyBlue'>Veldu valkostinn sem þú vilt:</span>
        
Endurreisnina er hægt að gera á 3 vegu (<span foreground='gray'>Einfalt, millistig eða fullkomið</span>), ef þú ert í vafa, reyndu það fyrsta 
endurræstu tölvuna þína og athugaðu hvort hún sé leyst.

Ef vandamálið er viðvarandi skaltu prófa aðra valkosti. <span font='16' foreground='LightSkyBlue'>Veldu valkost:</span>

Ég fann fleiri en einn Linux uppsett á þessari tölvu, veldu hver ætti að endurheimta stígvélina: <span font='16' foreground='LightSkyBlue'>Veldu valkost:</span>

Ég fann fleiri en eina EFI skipting, veldu hver á að nota: <span font='16' foreground='LightSkyBlue'>Veldu valkost:</span>
    
Ég fann fleiri en eitt geymslutæki, veldu hvaða ég ætti að taka upp stígvélina: Bíddu... Ljúka, framkvæma millistig endurheimta skref, uppfæra kerfið og staðfesta að LTS kjarninn sé uppsettur. Búinn! Lýsing fat Þetta tól ætti aðeins að nota í lifandi ham! Interactive, opnar stjórnstöð innan valda kerfisins. Interactive, opnar pamac-manager pakkastjóra innan valda kerfisins. Interactive, opnar flugstöð innan valda kerfisins. Intermediate, setja aftur grub pakka á skipting, endurnýja stillingar, og uppfæra initrd. Engin EFI skipting valin, ferli hætt. Engin skipting valin, ferli hætt. Nafn Ég fann ekki neina Linux uppsett á þessari tölvu, ferli hætt.
 Stígvélið í lifandi ham er að nota EFI ham, en ég <span foreground='red'>hef ekki fundið neinar EFI skipting á</span> þessari tölvu,
grub restore mun líklega ekki virka. 

Prófaðu að endurræsa og í gegnum Bios ræsingu tölvunnar í Legacy eða BIOS ham.

Viltu reyna jafnvel með litla sönnun fyrir því að vinna? Stígvélið í lifandi ham er að nota Legacy ham, einnig kallað bios, 
<span foreground='red'>en ég fann að minnsta kosti eina EFI skipting á þessari tölvu</span>,
grub restore mun líklega ekki virka. 

Prófaðu að endurræsa og í gegnum Bios stígvél tölvunnar þinnar í EFI ham.

Viltu reyna jafnvel með litla sönnun fyrir því að vinna? Valkostur Endurheimta Boot, Grub, og Initrd Tölvan þín er ekki tengd við internetið, valkostir 2 og 3 þurfa internetið til að virka. Einfalt, taktu bara Grub aftur í upphafi disksins. Skipting borð stærð 