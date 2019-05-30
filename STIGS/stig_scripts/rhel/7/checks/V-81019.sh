#!/bin/bash 
shopt -s nocasematch
FILE="/etc/audisp/audispd.conf"
FOUND_ITEM=`grep ^overflow_action $FILE | cut -d "=" -f2`

case $FOUND_ITEM in 
    " SYSLOG" )   EXPECTED_ITEM=" SYSLOG"
               LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
               ;;
    " SINGLE" )   EXPECTED_ITEM=" SINGLE"
               LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
               ;;
    " HALT" )     EXPECTED_ITEM=" HALT"
               LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
               ;;
       * )     EXPECTED_ITEM="SYSLOG, SINGLE, OR HALT"
               LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
esac 

shopt -u nocasematch
