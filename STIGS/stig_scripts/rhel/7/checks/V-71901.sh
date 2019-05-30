#!/bin/bash 
if [[ `yum list installed gnome-desktop*` ]]
  then
    FILE=`echo -e $(grep -lr lock-delay /etc/dconf/db/local.d/*)`
    FOUND_ITEM=`gsettings get org.gnome.desktop.screensaver lock-delay`
    EXPECTED_ITEM="uint32 5"
    RESULTS=0
    NOTES="If the lock-delay setting is missing, or is not set to 5 or less, this is a finding."
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FILE="FILE NOT FOUND"
  FOUND_ITEM="GNOME DESKTOP NOT FOUND"
  EXPECTED_ITEM="CHECK NOT APPLICABLE"
  NOTES="THIS CHECK IS NOT APPLICABLE"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
