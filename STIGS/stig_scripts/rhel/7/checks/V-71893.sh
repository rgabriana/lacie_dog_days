#bin/bash 
if [[ `yum list installed gnome-desktop*` ]]
then
  FILE=`echo -e $(find /etc/dconf/db/local.d -maxdepth 1 -type f -exec grep -l session {} \;)` 
  FOUND_ITEM=`gsettings get org.gnome.desktop.session idle-delay`
  EXPECTED_ITEM="uint32 900"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FILE="FILE NOT FOUND"
  FOUND_ITEM="GNOME DESKTOP NOT FOUND"
  EXPECTED_ITEM="CHECK NOT APPLICABLE"
  NOTES="THIS CHECK IS NOT APPLICABLE"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
