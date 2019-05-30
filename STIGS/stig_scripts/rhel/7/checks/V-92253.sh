#!/bin/bash 
FILE="/etc/sysctl.conf"

for FILE in "$(ls /etc/sysctl.d) $FILE"
  do
    FOUND_ITEM=`echo -e $(grep -e 'net.ipv4.conf.default.rp_filter' $FILE)`
    EXPECTED_ITEM='net.ipv4.conf.default.rp_filter = 1'
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
  done
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
