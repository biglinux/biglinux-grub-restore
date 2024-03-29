��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    �  �    _  �  �   
  �   �  �   \     
  l        �     �     �  4   �  =   �  Q     B   Y  h   �  -      (   3      \   O   a   ]  �   ^  "  
   n#  #   y#  c   �#  4   $     6$     C$                                                                                  
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
Language: fi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Tätä työkalua tulisi käyttää LIVE-TILASSA ja BigLinux BOOTIN palauttamiseen 
asennettu HD- tai SSD-levylle.</span> <span font='12' foreground='red'>Jos asennettu järjestelmä käynnistyy oikein, käynnistyksessä ei ole ongelmia, joten se on 
parempi olla jatkamatta tämän työkalun käyttöä.</span> <span font='10' foreground='gray'>Se toimii todennäköisesti myös muiden Linux-jakelujen kanssa.</span>

Haluatteko jatkaa?


 <span font='16' foreground='LightSkyBlue'>Vahvista tiedot:</span>
    
<span font='11' foreground='gray'>Käynnistystila:</span> EFI
<span font='11' foreground='gray'>EFI-osio:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Osio valittuna:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valittu järjestelmä:</span> $SELECTED_OS
<span font='11' foreground='gray'>Osion muoto:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Osion UUID:</span> $UUID_PARTITION

Haluatteko jatkaa? <span font='16' foreground='LightSkyBlue'>Vahvista tiedot:</span>    

<span font='11' foreground='gray'>Käynnistystila:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Valittu levy:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Levyn osiotaulukko: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Levyn koko:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Osio valittuna:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Valittu järjestelmä:</span> $SELECTED_OS
<span font='11' foreground='gray'>Osion muoto:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Osion UUID:</span> $UUID_PARTITION

Haluatteko jatkaa? <span font='16' foreground='LightSkyBlue'>Valitse haluamasi vaihtoehto:</span>
        
Palautus voidaan tehdä 3 tavalla (<span foreground='gray'>yksinkertainen, keskitaso tai täydellinen</span>), jos olet epävarma, kokeile ensimmäistä 
käynnistä tietokone uudelleen ja katso, onko se ratkaistu.

Jos ongelma jatkuu, kokeile muita vaihtoehtoja. <span font='16' foreground='LightSkyBlue'>Valitse vaihtoehto:</span>

Löysin useamman kuin yhden Linuxin, joka on asennettu tähän tietokoneeseen, valitse, mikä niistä palauttaa käynnistys: <span font='16' foreground='LightSkyBlue'>Valitse vaihtoehto:</span>

Löysin useamman kuin yhden EFI-osion, valitse, mitä haluat käyttää: <span font='16' foreground='LightSkyBlue'>Valitse vaihtoehto:</span>
    
Löysin useamman kuin yhden tallennuslaitteen, valitse, mihin minun pitäisi tallentaa käynnistys: Odota... Suorita väliaikaisen palautuksen vaiheet, päivitä järjestelmä ja tarkista, että LTS-ydin on asennettu. Valmis! Kuvaus Levy Tätä apuohjelmaa saa käyttää vain live-tilassa! Interaktiivinen, avaa valitun järjestelmän ohjauskeskuksen. Interaktiivinen, avaa pamac-manager-paketinhallinnan valitussa järjestelmässä. Interaktiivinen, avaa päätelaitteen valitussa järjestelmässä. Intermediate, asentaa grub-paketin uudelleen osioon, luo kokoonpanon uudelleen ja päivittää initrd:n. EFI-osio ei ole valittu, prosessi peruutettu. Ei valittua osiota, prosessi peruutettu. Nimi En löytänyt tälle tietokoneelle asennettua Linuxia, prosessi keskeytettiin.
 Käynnistys live-tilassa käyttää EFI-tilaa, mutta en <span foreground='red'>ole löytänyt EFI-osioita</span> tästä tietokoneesta,
grub-palautus ei todennäköisesti toimi. 

Yritä käynnistää tietokone uudelleen ja tietokoneen Bios-käynnistyksen kautta Legacy- tai BIOS-tilassa.

Haluatko kokeilla edes vähän todisteita työskentelystä? Käynnistys live-tilassa käyttää Legacy-tilaa, jota kutsutaan myös biosiksi, 
<span foreground='red'>mutta löysin ainakin yhden EFI-osion tältä tietokoneelta</span>,
grub-palautus ei todennäköisesti toimi. 

Yritä käynnistää tietokoneen Bios-käynnistys uudelleen EFI-tilassa.

Haluatko kokeilla edes vähän todisteita työskentelystä? Vaihtoehto Bootin, Grubin ja initrdin palautus Tietokoneesi ei ole yhteydessä Internetiin, vaihtoehdot 2 ja 3 tarvitsevat Internetin toimiakseen. Yksinkertaista, kirjoita Grub takaisin levyn alkuun. Osiotaulukko Koko 