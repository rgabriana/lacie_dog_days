#!/bin/bash 
LIST="/etc/rsyslog.conf $(ls /etc/rsyslog.d/*)"

for FILE in $LIST
  do
    FOUND_ITEM=`echo -e $(grep -v ^# $FILE | grep "@")`
    EXPECTED_ITEM="$FOUND_ITEM"
    if [[ -z $FOUND_ITEM ]]
      then
        EXPECTED_ITEM=" If the lines are commented out or there is no evidence that the audit logs are being sent to another system, this is a finding."
    fi
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
  done
