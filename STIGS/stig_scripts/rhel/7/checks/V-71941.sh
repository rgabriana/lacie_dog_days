#!/bin/bash 
FILE="/etc/default/useradd"
FOUND_ITEM=`grep -i inactive $FILE`
EXPECTED_ITEM="INACTIVE=0"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
