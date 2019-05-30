#!/bin/bash 
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`echo -e $(grep ^UsePrivilegeSeparation $FILE)`
EXPECTED_ITEM="UsePrivilegeSeparation yes"
if [[ -z $FOUND_ITEM ]]
  then
    FOUND_ITEM=`echo -e $(grep -i UsePrivilegeSeparation $FILE)`
fi
NOTES="This setting can also be set to \"sandbox\""
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
