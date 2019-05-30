#!/bin/bash 
FILE="/etc/rsyslog.conf"
ModLoad='$ModLoad'
for i in imtcp imudp imrelp
  do
    FOUND_ITEM=`echo -e $(grep -e "^$ModLoad $i" $FILE)`
    EXPECTED_ITEM="TEST RESULT IS NULL"
    if [[ -z "$FOUND_ITEM" ]]
      then
        FOUND_ITEM="TEST RESULT IS NULL"
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
    else
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
  done
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
