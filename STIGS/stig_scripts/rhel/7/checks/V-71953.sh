#!/bin/bash
FILE="/etc/gdm/custom.conf"
if [[ ! $(yum list installed gnome-desktop* | awk 'NF==3'|awk -F ' ' '{print $1}') ]]
 then
  FOUND_ITEM="GNOME DESKTOP NOT INSTALLED CHECK NOT APPLICABLE"
  EXPECTED_ITEM="GNOME DESKTOP NOT INSTALLED CHECK NOT APPLICABLE"
  RESULTS=PASS
  RESULT_TABLE
else
  FOUND_ITEM=`grep -ri ^AutomaticLoginEnable $FILE |awk -F= '{print $2}'|sed -e 's|"||g'`
  EXPECTED_ITEM=""
  RESULTS=0
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
