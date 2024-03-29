��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4  '  �  �    >  �  �     �   �  �   Y     �  x        ~  	   �     �  .   �  7   �  C   �  1   @  g   r  9   �  5         J   ]   O   A  �   O  �!  	   ?#     I#  Y   g#  7   �#     �#     $                                                                                  
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
Language: et
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Seda tööriista tuleks kasutada LIVE MODE'is ja BigLinux BOOT taastamiseks 
installitud HD- või SSD-le.</span> <span font='12' foreground='red'>Kui installitud süsteem käivitub korralikult, pole alglaadimisel probleeme, seega on 
parem mitte jätkata selle tööriista kasutamist.</span> <span font='10' foreground='gray'>Tõenäoliselt töötab see ka teiste Linuxi distributsioonidega.</span>

Kas soovite jätkata?


 <span font='16' foreground='LightSkyBlue'>Andmete kinnitamine:</span>
    
<span font='11' foreground='gray'>Alglaadimisrežiim:</span> EFI
<span font='11' foreground='gray'>EFI partitsioon:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Valitud partitsioon:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valitud süsteem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitsiooni formaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitsiooni UUID:</span> $UUID_PARTITION

Kas soovite jätkata? <span font='16' foreground='LightSkyBlue'>Andmete kinnitamine:</span>    

<span font='11' foreground='gray'>Alglaadimisrežiim:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valitud plaat:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Ketta partitsioonitabel: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Ketta suurus:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Valitud sektsioon:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valitud süsteem:</span> $SELECTED_OS
<span font='11' foreground='gray'>Partitsiooni formaat:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partitsiooni UUID:</span> $UUID_PARTITION

Kas soovite jätkata? <span font='16' foreground='LightSkyBlue'>Valige soovitud suvand.</span>
        
Taastamist saab teha 3 viisil (<span foreground='gray'>lihtne, vahepealne või täielik</span>), kahtluse korral proovige esimest 
taaskäivitage arvuti ja vaadake, kas see on lahendatud.

Kui probleem püsib, proovige teisi võimalusi. <span font='16' foreground='LightSkyBlue'>Valige suvand:</span>

Leidsin sellesse arvutisse installitud rohkem kui ühe Linuxi, valige, milline neist peaks alglaadimise taastama: <span font='16' foreground='LightSkyBlue'>Valige suvand:</span>

Leidsin rohkem kui ühe EFI partitsiooni, valige, millist neist kasutada: <span font='16' foreground='LightSkyBlue'>Valige suvand:</span>
    
Leidsin rohkem kui ühe salvestusseadme, valige, millele peaksin alglaadimise salvestama: Pea kinni... Lõpetage, viige läbi vahepealse taastamise sammud, uuendage süsteemi ja kontrollige, et LTS-ütmevorm on paigaldatud. Teinud! Kirjeldus Disk Seda utiliiti tuleb kasutada ainult reaalajas! Interaktiivne, avab juhtimiskeskuse valitud süsteemis. Interaktiivne, avab valitud süsteemis paketihalduri pamac-manager. Interaktiivne, avab valitud süsteemis terminali. Vahepealne, installib partitsioonile uuesti grubi paketi, taastab konfiguratsiooni ja uuendab initrd-i. EFI partitsiooni ei ole valitud, protsess on tühistatud. Partitsiooni ei ole valitud, protsess on tühistatud. Nimi Ma ei leidnud ühtegi Linuxi, mis oleks sellesse arvutisse paigaldatud, protsess katkestati.
 Live-režiimis käivitamine kasutab EFI-režiimi, kuid ma <span foreground='red'>pole sellest arvutist leidnud ühtegi EFI partitsiooni</span> ,
grub taastamine ilmselt ei toimi. 

Proovige taaskäivitada ja arvuti biosi alglaadimise kaudu pärand- või BIOS-režiimis.

Kas soovite proovida isegi vähese töötõendiga? Live-režiimis käivitamine kasutab Legacy režiimi, mida nimetatakse ka biosiks, 
<span foreground='red'>kuid leidsin sellest arvutist vähemalt ühe EFI partitsiooni</span>,
grub taastamine ilmselt ei toimi. 

Proovige taaskäivitada ja arvuti Biosi kaudu alglaadida EFI-režiimis.

Kas soovite proovida isegi vähese töötõendiga? Võimalus Taastage Boot, Grub ja initrd Teie arvuti pole Internetiga ühendatud, valikud 2 ja 3 vajavad töötamiseks Internetti. Lihtne, lihtsalt kirjutage Grub tagasi ketta algusesse. Jaotustabel Suurus 