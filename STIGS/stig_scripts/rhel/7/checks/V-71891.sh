#bin/bash 
if [[ `yum -q list installed gnome-desktop*` ]]
  then
    FILE=`echo -e $(find /etc/dconf/db/local.d -maxdepth 1 -type f -exec grep -l screensaver {} \;)` 
    FOUND_ITEM=`gsettings get org.gnome.desktop.screensaver lock-enabled`
    EXPECTED_ITEM="true"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FILE="FILE NOT FOUND"
  FOUND_ITEM="GNOME DESKTOP NOT FOUND"
  EXPECTED_ITEM="CHECK NOT APPLICABLE"
  NOTES="THIS CHECK IS NOT APPLICABLE"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
