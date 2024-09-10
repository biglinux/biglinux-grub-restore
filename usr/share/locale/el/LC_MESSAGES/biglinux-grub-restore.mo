��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �    �  �  �  �  �  �   @  .  /  �   ^  /  R  �   �!     m"     �"     �"  u   �"  |   #  �   �#  �   1$  
   �$  f   �$  �   T%  k   �%     L&  !   [&  (   }&  1   �&  [   �&     4'  �  C'  �  �)  �   �,  �   -                                     
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
 <span font='12'>Αυτό το εργαλείο θα πρέπει να χρησιμοποιείται σε ΖΩΝΤΑΝΗ ΛΕΙΤΟΥΡΓΙΑ για να αποκαταστήσει την ΕΚΚΙΝΗΣΗ του BigLinux που είναι εγκατεστημένο στον HD ή SSD.</span>

<span font='12' foreground='red'>Εάν το εγκατεστημένο σύστημα εκκινεί σωστά, δεν υπάρχουν προβλήματα εκκίνησης, οπότε είναι καλύτερα να μην προχωρήσετε με αυτό το εργαλείο.</span>
<span font='10' foreground='gray'>Μπορεί επίσης να λειτουργήσει με άλλες διανομές Linux.</span>

Θέλετε να προχωρήσετε; <span font='16' foreground='LightSkyBlue'>Επιβεβαιώστε τα δεδομένα:</span>
    
<span font='11' foreground='gray'>Λειτουργία εκκίνησης:</span> EFI
<span font='11' foreground='gray'>Διαμέρισμα EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>Επιλεγμένο διαμέρισμα:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Επιλεγμένο σύστημα:</span> $SELECTED_OS
<span font='11' foreground='gray'>Μορφή διαμερίσματος:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID διαμερίσματος:</span> $UUID_PARTITION

Θέλετε να προχωρήσετε; <span font='16' foreground='LightSkyBlue'>Επιβεβαιώστε τα δεδομένα:</span>    

<span font='11' foreground='gray'>Λειτουργία εκκίνησης:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>Επιλεγμένος δίσκος:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>Πίνακας κατατμήσεων δίσκου:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>Μέγεθος δίσκου:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>Επιλεγμένη κατάτμηση:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>Επιλεγμένο σύστημα:</span> $SELECTED_OS
<span font='11' foreground='gray'>Μορφή κατάτμησης:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID κατάτμησης:</span> $UUID_PARTITION

Θέλετε να προχωρήσετε; <span font='16' foreground='LightSkyBlue'>Επιλέξτε μια επιλογή:</span>

Βρέθηκαν περισσότερες από μία διαμερίσματα EFI, επιλέξτε ποιο να χρησιμοποιήσετε: <span font='16' foreground='LightSkyBlue'>Επιλέξτε μια επιλογή:</span>

Βρέθηκαν περισσότερες από μία εγκαταστάσεις Linux σε αυτόν τον υπολογιστή, επιλέξτε ποια να επαναφέρετε την εκκίνηση: <span font='16' foreground='LightSkyBlue'>Επιλέξτε μια επιλογή:</span>

Βρέθηκαν περισσότερες από μία συσκευές αποθήκευσης, επιλέξτε ποια να γράψετε το boot: <span font='16' foreground='LightSkyBlue'>Επιλέξτε την επιθυμητή επιλογή:</span>
        
Η αποκατάσταση μπορεί να γίνει με 3 τρόπους (<span foreground='gray'>Απλή, Μεσαία ή Πλήρης</span>), αν έχετε αμφιβολίες, δοκιμάστε την πρώτη επιλογή, επανεκκινήστε τον υπολογιστή και δείτε αν έχει λυθεί.

Αν το πρόβλημα επιμένει, δοκιμάστε τις άλλες επιλογές. Ολοκληρώνει, εκτελεί τα ενδιάμεσα βήματα αποκατάστασης, ενημερώνει το σύστημα και ελέγχει αν είναι εγκατεστημένος ο πυρήνας LTS. Ολοκληρώθηκε! Περιγραφή Δίσκος Διαδραστικό, ανοίγει ένα τερματικό μέσα στο επιλεγμένο σύστημα. Διαδραστικό, ανοίγει το κέντρο ελέγχου μέσα στο επιλεγμένο σύστημα. Διαδραστικό, ανοίγει τον διαχειριστή πακέτων pamac-manager μέσα στο επιλεγμένο σύστημα. Μεσαίο, επανεγκαθιστά το πακέτο grub στην κατάτμηση, αναγεννά τη διαμόρφωση και ενημερώνει το initrd. Όνομα Δεν έχει επιλεγεί διαμέρισμα EFI, η διαδικασία ακυρώθηκε. Δεν βρέθηκε εγκατάσταση Linux σε αυτόν τον υπολογιστή, η διαδικασία ακυρώθηκε. Δεν έχει επιλεγεί καμία διαμέριση, η διαδικασία ακυρώθηκε. Επιλογή Πίνακας Κατανομής Παρακαλώ περιμένετε... Αποκατάσταση Boot, Grub και initrd Απλό, απλώς γράφει ξανά το Grub στην αρχή του δίσκου. Μέγεθος Η εκκίνηση σε ζωντανή λειτουργία χρησιμοποιεί λειτουργία EFI, αλλά <span foreground='red'>δεν βρέθηκε καμία διαμέριση EFI</span> σε αυτόν τον υπολογιστή, 
πιθανότατα η αποκατάσταση Grub δεν θα λειτουργήσει. 

Δοκιμάστε να επανεκκινήσετε και να εκκινήσετε σε Legacy ή BIOS λειτουργία μέσω του BIOS του υπολογιστή.

Θέλετε να δοκιμάσετε ακόμα και με χαμηλή πιθανότητα επιτυχίας; Η εκκίνηση σε ζωντανή λειτουργία χρησιμοποιεί τη λειτουργία Legacy, που ονομάζεται επίσης BIOS, 
<span foreground='red'>αλλά τουλάχιστον ένα διαμέρισμα EFI βρέθηκε</span> σε αυτόν τον υπολογιστή, 
πιθανότατα η αποκατάσταση Grub δεν θα λειτουργήσει. 

Δοκιμάστε να επανεκκινήσετε και να εκκινήσετε σε λειτουργία EFI μέσω του BIOS του υπολογιστή.

Θέλετε να δοκιμάσετε ακόμα και με χαμηλή πιθανότητα επιτυχίας; Αυτή η εφαρμογή θα πρέπει να χρησιμοποιείται μόνο σε ζωντανή λειτουργία! Ο υπολογιστής σας δεν είναι συνδεδεμένος στο διαδίκτυο, οι επιλογές 2 και 3 απαιτούν σύνδεση στο διαδίκτυο για να λειτουργήσουν. 