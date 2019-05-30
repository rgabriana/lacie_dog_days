#bin/bash 
if [[ `yum -q list installed gnome-desktop*` ]]
  then
    FILE=`echo -e $(find /etc/dconf/db/local.d/locks/ -maxdepth 1 -type f -exec grep -l screensaver.*lock-enabled {} \;)` 
    FOUND_ITEM=`gsettings writable org.gnome.desktop.screensaver lock-enabled`
    EXPECTED_ITEM="false"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FILE="FILE NOT FOUND"
  FOUND_ITEM="GNOME DESKTOP NOT FOUND"
  EXPECTED_ITEM="CHECK NOT APPLICABLE"
  NOTES="THIS CHECK IS NOT APPLICABLE"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
