#!/bin/bash 
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`echo -e $(grep ^ClientAliveCountMax $FILE)`
EXPECTED_ITEM="ClientAliveCountMax 0"
if [[ -z $FOUND_ITEM ]]
  then
    FOUND_ITEM=`echo -e $(grep -i ClientAliveCountMax $FILE)`
fi
NOTES="The default value is 3."
 LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
