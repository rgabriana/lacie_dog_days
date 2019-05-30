#!/bin/bash 
if [ ! `yum -q list installed gnome-desktop*` ]
 then
   FILE="FILE NOT FOUND"
   FOUND_ITEM="GNOME DESKTOP NOT FOUND"
   EXPECTED_ITEM="CHECK NOT APPLICABLE"
   NOTES="THIS CHECK IS NOT APPLICABLE"
   LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FILE=`grep -r banner-message-enable /etc/dconf/db/local.d/*|awk -F ":" '{print $1}'`
  FOUND_ITEM=`gsettings get org.gnome.login-screen banner-message-enable`
  EXPECTED_ITEM="true"
  LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
fi

