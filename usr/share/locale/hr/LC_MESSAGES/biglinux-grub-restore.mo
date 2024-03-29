��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �  �  i  �  �     �   �  �   I     �  k   �  
   h     s  	   x  A   �  ?   �  M     7   R  h   �  1   �  -   %      S   L   W   U  �   `  �!     [#     b#  Q   |#  8   �#     $  	   $                                                                                  
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
Language: hr
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Ovaj alat treba koristiti u LIVE MODE-u i za vraćanje BigLinux BOOT-a 
instaliran na HD ili SSD.</span> <span font='12' foreground='red'>Ako se instalirani sustav ispravno pokreće, nema problema u pokretanju, tako da je 
bolje ne nastaviti uporabu ovog alata.</span> <span font='10' foreground='gray'>Vjerojatno radi i s drugim Linux distribucijama.</span>

Želite li nastaviti?


 <span font='16' foreground='LightSkyBlue'>Potvrda podataka:</span>
    
<span font='11' foreground='gray'>Način pokretanja:</span> EFI
<span font='11' foreground='gray'>EFI particija:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Odabrana particija:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Odabrani sustav:</span> $SELECTED_OS
<span font='11' foreground='gray'>Oblik particije:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID particije:</span> $UUID_PARTITION

Želite li nastaviti? <span font='16' foreground='LightSkyBlue'>Potvrda podataka:</span>    

<span font='11' foreground='gray'>Način pokretanja:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Odabrani disk:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tablica particije diska: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Veličina diska:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Odabrana particija:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Odabrani sustav:</span> $SELECTED_OS
<span font='11' foreground='gray'>Oblik particije:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID particije:</span> $UUID_PARTITION

Želite li nastaviti? <span font='16' foreground='LightSkyBlue'>Odaberite željenu mogućnost:</span>
        
Restauracija se može obaviti na 3 načina (<span foreground='gray'>Simple, Intermediate ili Complete</span>), u slučaju sumnje, pokušajte prvi 
ponovno pokrenite računalo i provjerite je li riješeno.

Ako se problem nastavi pojavljivati, isprobajte druge mogućnosti. <span font='16' foreground='LightSkyBlue'>Odaberite mogućnost:</span>

Pronašao sam više od jednog Linux instaliranog na ovom računalu, odaberite koji bi trebao vratiti pokretanje: <span font='16' foreground='LightSkyBlue'>Odaberite mogućnost:</span>

Pronašao sam više EFI particija, odaberite koju ćete koristiti: <span font='16' foreground='LightSkyBlue'>Odaberite mogućnost:</span>
    
Pronašao sam više uređaja za pohranu, odabrao na kojem bih trebao snimiti pokretanje: Sačekajte... Dovršite, izvršite srednje korake vraćanja, ažurirajte sustav i provjerite je li LTS kernel instaliran. Učinjeno! Opis tanjurić Ovaj uslužni program treba koristiti samo u načinu rada uživo! Interaktivno, otvara kontrolni centar unutar odabranog sustava. Interactive, otvara upravitelj paketa pamac-manager unutar odabranog sustava. Interaktivno, otvara terminal unutar odabranog sustava. Srednji, ponovno instalirajte grub paket na particiju, regenerirajte konfiguraciju i ažurirajte initrd. Nije odabrana EFI particija, postupak je otkazan. Nije odabrana particija, postupak je otkazan. Ime Nisam našao nijedan Linux instaliran na ovom računalu, proces je otkazan.
 Pokretanje u načinu rada uživo koristi EFI način rada, ali na ovom računalu <span foreground='red'>nisam pronašao nijednu EFI particiju</span> ,
grub restore vjerojatno neće raditi. 

Pokušajte ponovno pokrenuti i putem bios bootinga računala u naslijeđenom ili BIOS načinu rada.

Želite li pokušati čak i uz malo dokaza o radu? Pokretanje u načinu rada uživo koristi Legacy način rada, koji se naziva i bios, 
<span foreground='red'>ali pronašao sam barem jednu EFI particiju na ovom računalu</span>,
grub restore vjerojatno neće raditi. 

Pokušajte ponovno pokrenuti i putem bios pokretanja računala u EFI načinu rada.

Želite li pokušati čak i uz malo dokaza o radu? Opcija Vrati Boot, Grub i Initrd Vaše računalo nije povezano s internetom, opcije 2 i 3 trebaju internet za rad. Jednostavno, samo snimite Grub ponovo na početku diska. Tablica particija veličina 