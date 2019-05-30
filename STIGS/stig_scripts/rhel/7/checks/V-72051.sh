#!/bin/bash 
FILE="/etc/rsyslog.conf /etc/rsyslog.d"
FOUND_ITEM=`echo -e $(grep -r "^cron.*" $FILE/*)`
if [[ $FOUND_ITEM ]]
  then
    FILE=`echo -e "$FOUND_ITEM" | awk -F: '{print $1}'`
    EXPECTED_ITEM="$FOUND_ITEM"
else
  EXPECTED_ITEM="the command does not return a response"
fi

LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
