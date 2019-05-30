#!/bin/bash 
FILE="/etc/audisp/audisp-remote.conf"
if [[ -e $FILE ]]
  then
    FOUND_ITEM=`echo -e $(grep "^remote_server =" $FILE)`
    REMOTE_SERVER=`echo -e $FOUND_ITEM|awk -F = '{print $2}'`
    if [[ $(ping -c 3 "$REMOTE_SERVER") ]]
      then
        EXPECTED_ITEM="$FOUND_ITEM"
    else
        EXPECTED_ITEM="$REMOTE_SERVER is unreachable"
    fi
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FOUND_ITEM="FILE NOT FOUND"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
