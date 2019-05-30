#!/bin/bash
FILE="/etc/gdm/custom.conf"
if [ ! $(yum list installed gnome-desktop* | awk 'NF==3'|awk -F ' ' '{print $1}')  ]; then
FOUND_ITEM="GNOME DESKTOP NOT INSTALLED CHECK NOT APPLICABLE"
EXPECTED_ITEM="GNOME DESKTOP NOT INSTALLED CHECK NOT APPLICABLE"
RESULTS=PASS
RESULT_TABLE
else
FOUND_ITEM=`grep -i '^timedloginenable' $FILE |awk -F= '{print $2}'`
EXPECTED_ITEM="false"
RESULTS=0


    if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
      RESULTS=PASS
    elif [[ -z $FOUND_ITEM ]]; then
       FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
       RESULTS=PASS
    else
       RESULTS=FAIL
    fi

RESULT_TABLE
fi
