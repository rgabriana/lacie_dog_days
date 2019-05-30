#!/bin/bash 
if [[ `yum list installed gnome-desktop*` ]]
  then
    FILE=`echo -e $(grep -lr idle-activation-enabled /etc/dconf/db/local.d/*)`
    FOUND_ITEM=`gsettings get org.gnome.desktop.screensaver idle-activation-enabled`
    EXPECTED_ITEM="true"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FILE="FILE NOT FOUND"
  FOUND_ITEM="GNOME DESKTOP NOT FOUND"
  EXPECTED_ITEM="CHECK NOT APPLICABLE"
  NOTES="THIS CHECK IS NOT APPLICABLE"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
