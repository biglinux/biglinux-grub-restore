��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4     �  �    ]  �  �   ,  �   �  �   w     ,  �   9     �  	   �     �  5   �  H   	  X   R  A   �  l   �  A   Z   =   �      �   N   �   G  .!  X  v"     �#  !   �#  f   �#  5   a$     �$  
   �$                                                                                  
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
Language: ro
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Acest instrument trebuie utilizat în MODUL LIVE și pentru a restabili BigLinux BOOT 
instalat pe HD sau SSD.</span> <span font='12' foreground='red'>Dacă sistemul instalat pornește corect, nu există probleme în boot, deci este 
mai bine să nu continuați utilizarea acestui instrument.</span> <span font='10' foreground='gray'>Probabil că funcționează și cu alte distribuții Linux.</span>

Doriți să continuați?


 <span font='16' foreground='LightSkyBlue'>Confirmare date:</span>
    
<span font='11' foreground='gray'>Mod de încărcare:</span> EFI
<span font='11' foreground='gray'>Partiție EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Partiție selectată:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistem selectat:</span> $SELECTED_OS
<span font='11' foreground='gray'>Formatul partiției:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partiția UUID:</span> $UUID_PARTITION

Doriți să continuați? <span font='16' foreground='LightSkyBlue'>Confirmare date:Mod</span> <span font='11' foreground='gray'>de pornire:</span> LEGACY/BIOS
<span font='11' foreground='gray'>Disc selectat:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabel partiții disc: $DISK</span>_TABLE
    
<span font='11' foreground='gray'>Dimensiune disc:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Partiție selectată:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Sistem selectat:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partiție:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Partiția UUID:</span> $UUID_PARTITION

Doriți să continuați?    

 <span font='16' foreground='LightSkyBlue'>Selectați opțiunea dorită:</span>
        
Restaurarea se poate face în 3 moduri (<span foreground='gray'>simplu, intermediar sau complet</span>), în caz de îndoială, încercați primul 
reporniți computerul și vedeți dacă este rezolvat.

Dacă problema persistă, încercați celelalte opțiuni. <span font='16' foreground='LightSkyBlue'>Selectați o opțiune:</span>

Am găsit mai mult de un Linux instalat pe acest computer, selectați care ar trebui să restaureze boot-ul: <span font='16' foreground='LightSkyBlue'>Selectați o opțiune:</span>

Am găsit mai mult de o partiție EFI, selectați pe care să o utilizați: <span font='16' foreground='LightSkyBlue'>Selectați o opțiune:</span>
    
Am găsit mai mult de un dispozitiv de stocare, selectați pe care ar trebui să înregistreze de boot: Stai aşa... Finalizați, efectuați pașii de restaurare intermediară, actualizați sistemul și verificați dacă este instalat nucleul LTS. Făcut! Descriere Disc Acest utilitar trebuie utilizat numai în modul live! Interactive, deschide centrul de control din cadrul sistemului selectat. Interactive, deschide managerul de pachete pamac-manager în cadrul sistemului selectat. Interactive, deschide un terminal în cadrul sistemului selectat. Intermediate, reinstalează pachetul grub pe partiție, regenerează configurația și actualizează initrd. Nu a fost selectată nicio partiție EFI, procesul a fost anulat. Nu a fost selectată nicio partiție, procesul a fost anulat. Nume Nu am găsit niciun Linux instalat pe acest computer, procesul a fost anulat.
 Boot-ul în modul live utilizează modul EFI, dar <span foreground='red'>nu am găsit nicio partiție EFI pe</span> acest computer,
grub restaurare, probabil, nu va funcționa. 

Încercați să reporniți și să porniți Bios-ul computerului în modul Legacy sau BIOS.

Vrei să încerci chiar și cu puține dovezi de lucru? Boot-ul în modul live utilizează modul Legacy, numit și bios, 
<span foreground='red'>dar am găsit cel puțin o partiție EFI pe acest computer</span>,
grub restaurare, probabil, nu va funcționa. 

Încercați să reporniți și să treceți prin bios-ul computerului în modul EFI.

Vrei să încerci chiar și cu puține dovezi de lucru? Opțiune Restaurați Boot, Grub și initrd Computerul nu este conectat la internet, opțiunile 2 și 3 au nevoie de internet pentru a funcționa. Simplu, scrieți Grub înapoi la începutul discului. Tabel de partiție Dimensiune 