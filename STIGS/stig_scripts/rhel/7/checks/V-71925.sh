#!/bin/bash 
FILE="/etc/login.defs"
FOUND_ITEM=`grep -i '^pass_min_days' $FILE`
EXPECTED_ITEM="PASS_MIN_DAYS     1"
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
