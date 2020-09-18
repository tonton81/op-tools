#!/usr/bin/bash
clear
echo
echo
echo
echo
echo Copying APKs and setting permissions...
chmod 777 /data/appz/*.apk
cp -rf /data/appz/*.apk /storage/emulated/0/
chmod 777 /storage/emulated/0/*.apk
echo Done!
echo
echo Installing Chrome…
pm install -r -d /storage/emulated/0/chrome.apk &> /dev/null
echo Done!
echo
echo Installing MiXplorer
pm install -r -d /storage/emulated/0/mixplorer.apk &> /dev/null
echo Done!
echo
echo
echo  Remounting system and creating shortcuts...
mount -o rw,remount /system
echo -e "#!/usr/bin/bash\npkill chrome\nrm -rf /data/data/com.android.chrome/app_tabs/0\nam start -n com.android.chrome/com.google.android.apps.chrome.Main -d autoecu.io &> /dev/null\n" > /system/comma/home/autoecu.sh
chmod 777 /system/comma/home/autoecu.sh
echo -e "#!/usr/bin/bash\nam start com.mixplorer/com.mixplorer.activities.BrowseActivity &> /dev/null\n" > /system/comma/home/mixplorer.sh
chmod 777 /system/comma/home/mixplorer.sh
echo
echo Done!
mount -o ro,remount,ro /system
sync
echo Complete!
echo
echo
echo
