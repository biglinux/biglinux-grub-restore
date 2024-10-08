��            )   �      �  �  �    2  �  E  �   �  �   x	  �   
  >  �
  q   �  
   g     r     ~  9   �  A   �  P   �  r   P     �  ,   �  ?   �  (   5     ^     e     u     �  @   �     �  1  �  F    .   b  Y   �    �  �  �  J  �  �  B  �   :  �   �  �   �  �  C  �   �     w  
   �     �  M   �  ]   �  o   C  �   �     J   6   O   Q   �   2   �      !     !     .!  -   A!  H   o!     �!  q  �!  �  3#  1   �$  �   �$                                     
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
 <span font='12'>כלי זה צריך לשמש במצב חי כדי לשחזר את אתחול של BigLinux המותקן על ה-HD או ה-SSD.</span>

<span font='12' foreground='red'>אם המערכת המותקנת אתחול שלה תקין, אין בעיות אתחול, לכן עדיף לא להמשיך עם כלי זה.</span>
<span font='10' foreground='gray'>זה עשוי גם לעבוד עם הפצות לינוקס אחרות.</span>

<span font='12'>האם אתה רוצה להמשיך?</span> <span font='16' foreground='LightSkyBlue'>אשר את הנתונים:</span>
    
<span font='11' foreground='gray'>מצב אתחול:</span> EFI
<span font='11' foreground='gray'>מחיצת EFI:</span> $EFI_PARTITION
    
<span font='11' foreground='gray'>מחיצה שנבחרה:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>מערכת שנבחרה:</span> $SELECTED_OS
<span font='11' foreground='gray'>פורמט מחיצה:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID של מחיצה:</span> $UUID_PARTITION

האם אתה רוצה להמשיך? <span font='16' foreground='LightSkyBlue'>אשר את הנתונים:</span>    

<span font='11' foreground='gray'>מצב אתחול:</span>  LEGACY/BIOS
<span font='11' foreground='gray'>דיסק נבחר:</span> $DISK_SELECTED
    
<span font='11' foreground='gray'>טבלת מחיצות דיסק:</span> $DISK_TABLE
    
<span font='11' foreground='gray'>גודל דיסק:</span> $DISK_SIZE
   
<span font='11' foreground='gray'>מחיצה נבחרת:</span> $SELECTED_PARTITION
<span font='11' foreground='gray'>מערכת נבחרת:</span> $SELECTED_OS
<span font='11' foreground='gray'>פורמט מחיצה:</span> $PARTITION_FORMAT
<span font='11' foreground='gray'>UUID של מחיצה:</span> $UUID_PARTITION

האם אתה רוצה להמשיך? <span font='16' foreground='LightSkyBlue'>בחר אפשרות:</span>

נמצאה יותר ממחיצת EFI אחת, בחר איזו להשתמש: <span font='16' foreground='LightSkyBlue'>בחר אפשרות:</span>

נמצאה יותר מתקנה אחת של לינוקס במחשב הזה, בחר איזו אחת לשחזר את האתחול: <span font='16' foreground='LightSkyBlue'>בחר אפשרות:</span>

נמצא יותר ממכשיר אחסון אחד, בחר לאיזה מהם לכתוב את האתחול: <span font='16' foreground='LightSkyBlue'>בחר את האפשרות הרצויה:</span>
        
השחזור יכול להתבצע ב-3 דרכים (<span foreground='gray'>פשוט, בינוני או מלא</span>), אם יש ספק, נסה את האפשרות הראשונה, הפעל מחדש את המחשב וראה אם הבעיה נפתרה.

אם הבעיה נמשכת, נסה את האפשרויות האחרות. מושלם, מבצע את שלבי השחזור הביניים, מעדכן את המערכת, ובודק אם הליבה LTS מותקנת. הושלם! תיאור דיסק אינטראקטיבי, פותח מסוף בתוך המערכת הנבחרת. אינטראקטיבי, פותח את מרכז הבקרה בתוך המערכת הנבחרת. אינטראקטיבי, פותח את מנהל החבילות pamac-manager בתוך המערכת הנבחרת. בינוני, מתקין מחדש את חבילת grub על המחיצה, מייצר מחדש את הקונפיגורציה, ומעדכן את initrd. שם לא נבחרה מחיצת EFI, התהליך בוטל. לא נמצאה התקנת לינוקס במחשב הזה, התהליך בוטל. לא נבחרה מחיצה, התהליך בוטל. אפשרות טבלת מחיצות אנא המתן... שחזר את ה-Boot, Grub, ואת ה-initrd פשוט, פשוט כותב את ה-Grub שוב בתחילת הדיסק. גודל ההפעלה במצב חי משתמשת במצב EFI, אך <span foreground='red'>לא נמצאה מחיצת EFI</span> במחשב הזה, 
סביר להניח ששחזור גרוב לא יעבוד.

נסה לאתחל ולהפעיל במצב Legacy או BIOS דרך ה-BIOS של המחשב.

האם אתה רוצה לנסות גם עם סיכוי נמוך להצלחה? ההפעלה במצב חי משתמשת במצב Legacy, הנקרא גם BIOS, 
<span foreground='red'>אך לפחות מחיצת EFI אחת נמצאה</span> במחשב הזה, 
סביר להניח ששחזור Grub לא יעבוד. 

נסה לאתחל ולהפעיל במצב EFI דרך ה-BIOS של המחשב.

האם אתה רוצה לנסות אפילו עם סיכוי נמוך להצלחה? כלי זה צריך לשמש רק במצב חי! המחשב שלך אינו מחובר לאינטרנט, אפשרויות 2 ו-3 דורשות חיבור לאינטרנט כדי לפעול. 