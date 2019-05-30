#!/bin/bash 
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`echo -e $(grep ^StrictModes $FILE)`
EXPECTED_ITEM="StrictModes yes"
if [[ -z $FOUND_ITEM ]]
  then
    FOUND_ITEM=`echo -e $(grep -i StrictModes $FILE)`
fi
 LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
