��            )   �      �  �  �  #  \  �  �  U  T	  �   �
  �   P  �   �  
   �  {   �     
          "  9   (  E   b  V   �  ;   �  n   ;  7   �  3   �       L     ]  h  q  �     8     @  h   `  ;   �              #  �  4    
  �  )  q  �  �   P  �     �   �     A  }   Q     �     �     �  :   �  =     L   \  3   �  f   �  +   D   /   p      �   d   �   H  !  ]  T"     �#      �#  \   �#  >   6$     u$     �$                                                                                  
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
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>To narzędzie powinno być używane w trybie LIVE MODE i przywrócić BigLinux BOOT 
zainstalowany na dysku HD lub SSD.</span> <span font='12' foreground='red'>Jeśli zainstalowany system uruchamia się poprawnie, nie ma problemów z rozruchem, więc jest 
lepiej nie kontynuować korzystania z tego narzędzia.</span> <span font='10' foreground='gray'>Prawdopodobnie działa również z innymi dystrybucjami Linuksa.</span>

Czy chcesz kontynuować?


 <span font='16' foreground='LightSkyBlue'>Potwierdź dane:</span>
    
<span font='11' foreground='gray'>Tryb rozruchu:</span> EFI
<span font='11' foreground='gray'>Partycja EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Wybrana partycja:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Wybrany system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partycji:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>Identyfikator UUID partycji:</span> $UUID_PARTITION

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Potwierdź dane:</span>    

<span font='11' foreground='gray'>Tryb rozruchu:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Wybrana płyta:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Tabela partycji dysku: $DISK</span> _TABLE
    
<span font='11' foreground='gray'>Rozmiar dysku:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Wybrana partycja:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Wybrany system:</span> $SELECTED_OS
<span font='11' foreground='gray'>Format partycji:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID partycji:</span> $UUID_PARTITION

Czy chcesz kontynuować? <span font='16' foreground='LightSkyBlue'>Wybierz żądaną opcję:</span>
        
Przywrócenie można wykonać na 3 sposoby (<span foreground='gray'>prosty, pośredni lub kompletny</span>), w razie wątpliwości spróbuj pierwszego 
uruchom ponownie komputer i sprawdź, czy problem został rozwiązany.

Jeśli problem będzie się powtarzał, wypróbuj inne opcje. <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znalazłem więcej niż jeden Linux zainstalowany na tym komputerze, wybierz, który z nich powinien przywrócić rozruch: <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>

Znalazłem więcej niż jedną partycję EFI, wybierz, której użyć: <span font='16' foreground='LightSkyBlue'>Wybierz opcję:</span>
    
Znalazłem więcej niż jedno urządzenie pamięci masowej, wybierz, na którym mam nagrać rozruch: Trzymaj się... Zakończyć, wykonać kroki przywracania tymczasowego, zaktualizować system i sprawdzić, czy zainstalowane jest jądro LTS. Gotowy! Opis Płyta To narzędzie może być używane tylko w trybie na żywo! Interaktywny, otwiera centrum sterowania w wybranym systemie. Interactive, otwiera menedżera pakietów pamac-manager w wybranym systemie. Interaktywny, otwiera terminal w wybranym systemie. Pośrednio, ponownie instaluje pakiet grub na partycji, regeneruje konfigurację i aktualizuje initrd. Nie wybrano partycji EFI, proces anulowany. Nie wybrano żadnej partycji, proces anulowany. Nazwa Nie mogłem znaleźć żadnego Linuksa zainstalowanego na tym komputerze, proces został anulowany.
 Rozruch w trybie na żywo odbywa się w trybie EFI, ale <span foreground='red'>nie znalazłem żadnych partycji EFI na</span> tym komputerze,
przywracanie gruba prawdopodobnie nie zadziała. 

Spróbuj ponownie uruchomić komputer i uruchomić bios w trybie Legacy lub BIOS.

Chcesz spróbować nawet z niewielkim dowodem pracy? Rozruch w trybie na żywo korzysta z trybu Legacy, zwanego również biosem, 
<span foreground='red'>ale znalazłem co najmniej jedną partycję EFI na tym komputerze</span>,
przywracanie gruba prawdopodobnie nie zadziała. 

Spróbuj ponownie uruchomić komputer i uruchomić bios w trybie EFI.

Chcesz spróbować nawet z niewielkim dowodem pracy? Opcja Przywrócić Boot, Grub i initrd Twój komputer nie jest podłączony do Internetu, opcje 2 i 3 wymagają Internetu do pracy. Proste, wystarczy zapisać Grub z powrotem na początek dysku. Tabela partycji Rozmiar 