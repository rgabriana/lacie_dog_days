#!/bin/bash 
FILE="openssh-server.x86_64"
FOUND_ITEM=`echo -e $(yum -q list installed $FILE)`
EXPECTED_ITEM="$FILE"

if [[ $FOUND_ITEM ]]
  then
    FOUND_ITEM="$EXPECTED_ITEM"
  else 
    FOUND_ITEM="SSH Server package not instlaled"
fi
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
