��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �    �  �    �  �  �   ^  $  A  �   f  O  [  �   �!     �"     �"     �"  u   �"  |   <#  �   �#  e   P$  
   �$  a   �$  �   #%  ]   �%     &  )   &  (   F&  +   o&  O   �&     �&  �  �&  �  �)  �   `:  �   �:                                     
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
Language: el
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Generator: attranslate
 <span font='12'>Αυτό το εργαλείο πρέπει να χρησιμοποιηθεί σε ΛΕΙΤΟΥΡΓΙΑ ΣΕ ΠΡΑΓΜΑΤΙΚΟ ΧΡΟΝΟ για να επαναφέρει την ΕΚΚΙΝΗΣΗ του BigLinux που είναι εγκατεστημένο στον σκληρό δίσκο ή το SSD.</span>

<span font='12' foreground='red'>Αν το εγκατεστημένο σύστημα εκκινεί σωστά, δεν υπάρχουν προβλήματα εκκίνησης, οπότε είναι καλύτερο να μην συνεχίσετε με αυτό το εργαλείο.</span>
<span font='10' foreground='gray'>Μπορεί επίσης να λειτουργήσει με άλλες διανομές Linux.</span>

Θέλετε να συνεχίσετε; <span font='16' foreground='LightSkyBlue'>Επιβεβαίωση δεδομένων:</span>

<span font='11' foreground='gray'>Λειτουργία εκκίνησης:</span> EFI
<span font='11' foreground='gray'>Διαμέρισμα EFI:</span> $EFI_PARTITION

<span font='11' foreground='gray'>Επιλεγμένο διαμέρισμα:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Επιλεγμένο σύστημα:</span> $SELECTED_OS
<span font='11' foreground='gray'>Μορφή διαμέρισματος:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID διαμέρισματος:</span> $UUID_PARTITION

Θέλετε να συνεχίσετε; <span font='16' foreground='LightSkyBlue'>Επιβεβαίωση των δεδομένων:</span>    

<span font='11' foreground='gray'>Λειτουργία εκκίνησης:</span>  ΚΛΗΡΟΝΟΜΙΑ/BIOS
<span font='11' foreground='gray'>Επιλεγμένος δίσκος:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Πίνακας κατατμήσεων δίσκου:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Μέγεθος δίσκου:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Επιλεγμένη κατάτμηση:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Επιλεγμένο σύστημα:</span> $SELECTED_OS
<span font='11' foreground='gray'>Μορφή κατάτμησης:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID κατάτμησης:</span> $UUID_PARTITION

Θέλετε να συνεχίσετε; <span font='16' foreground='LightSkyBlue'>Επιλέξτε μια επιλογή:</span>

Βρέθηκαν περισσότερα από ένα τμήματα EFI, επιλέξτε ποιο να χρησιμοποιήσετε: <span font='16' foreground='LightSkyBlue'>Επιλέξτε μια επιλογή:</span>

Βρέθηκαν περισσότερες από μία εγκαταστάσεις Linux σε αυτόν τον υπολογιστή, επιλέξτε ποια να αποκατασταθεί το boot: <span font='16' foreground='LightSkyBlue'>Επιλέξτε μια επιλογή:</span>

Βρέθηκε περισσότερη από μια συσκευή αποθήκευσης, επιλέξτε σε ποια θα εγγραφεί το boot: <span font='16' foreground='LightSkyBlue'>Επιλέξτε την επιθυμητή επιλογή:</span>

Η επαναφορά μπορεί να γίνει με 3 τρόπους (<span foreground='gray'>Απλό, Ενδιάμεσο, ή Πλήρες</span>), αν έχετε αμφιβολίες, δοκιμάστε την πρώτη επιλογή, επανεκκινήστε τον υπολογιστή και δείτε αν λυθεί το πρόβλημα.

Αν το πρόβλημα εξακολουθεί να υπάρχει, δοκιμάστε τις άλλες επιλογές. Ολοκληρώθηκε, εκτελεί τα ενδιάμεσα βήματα ανάκτησης, ενημερώνει το σύστημα και ελέγχει εάν έχει εγκατασταθεί το πυρήνα LTS. Ολοκληρώθηκε! Περιγραφή Δίσκος Διαδραστικό, ανοίγει ένα τερματικό μέσα στο επιλεγμένο σύστημα. Διαδραστικό, ανοίγει το κέντρο ελέγχου μέσα στο επιλεγμένο σύστημα. Διαδραστικό, ανοίγει τον διαχειριστή πακέτων pamac-manager μέσα στο επιλεγμένο σύστημα. Intermediário, reinstala o pacote grub na partição, regenera a configuração e atualiza o initrd. Όνομα Δεν επιλέχθηκε διαμέρισμα EFI, η διαδικασία ακυρώθηκε. Δεν βρέθηκε εγκατάσταση Linux σε αυτόν τον υπολογιστή, η διαδικασία ακυρώθηκε. Δεν επιλέχθηκε διαμέρισμα, η διαδικασία ακυρώθηκε. Επιλογή Πίνακας Διαμερισμάτων Παρακαλώ περιμένετε... Επαναφορά Boot, Grub και initrd Απλά γράψτε ξανά το Grub στην αρχή του δίσκου. Μέγεθος Η εκκίνηση σε λειτουργία live χρησιμοποιεί τη λειτουργία EFI, αλλά δεν βρέθηκε <span foreground='red'>καμία διαμέρισμα EFI</span> σε αυτόν τον υπολογιστή, πιθανότατα η επαναφορά του Grub δεν θα λειτουργήσει.

Δοκιμάστε να επανεκκινήσετε και να εκκινήσετε σε λεγόμενη λειτουργία Legacy ή BIOS μέσω του BIOS του υπολογιστή.

Θέλετε να δοκιμάσετε ακόμα και με χαμηλή πιθανότητα επιτυχίας; Η εκκίνηση σε λειτουργία ζωντανής διανομής χρησιμοποιεί τη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λεγόμενη λ Αυτό το εργαλείο πρέπει να χρησιμοποιείται μόνο σε λειτουργία ζωντανής λειτουργίας! Ο υπολογιστής σας δεν είναι συνδεδεμένος στο internet, οι επιλογές 2 και 3 απαιτούν σύνδεση στο internet για να λειτουργήσουν. 