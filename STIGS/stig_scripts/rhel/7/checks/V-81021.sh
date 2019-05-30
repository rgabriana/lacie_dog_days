#!/bin/bash 
shopt -s nocasematch
FILE="/etc/audisp/audispd.conf"
FOUND_ITEM=`grep -e ^name_format $FILE | cut -d "=" -f 2`

case $FOUND_ITEM in 

   " HOSTNAME")        EXPECTED_ITEM=" HOSTNAME"
                       LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
                       ;;
   " FQD")             EXPECTED_ITEM=" FQD"
                       LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
                       ;;
   " NUMERIC")         EXPECTED_ITEM=" NUMERIC"
                       LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
                       ;;
            *)         EXPECTED_ITEM="HOSTNAME, FQD, OR NUMERIC"
                       LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
                       ;;
esac
shopt -u nocasematch
