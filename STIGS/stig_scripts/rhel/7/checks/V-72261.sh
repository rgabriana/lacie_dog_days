#!/bin/bash 
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`echo -e $(grep ^KerberosAuthentication $FILE)`
EXPECTED_ITEM="KerberosAuthentication yes"
if [[ -z $FOUND_ITEM ]]
  then
    FOUND_ITEM=`echo -e $(grep -i KerberosAuthentication $FILE)`
fi
 LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
