#!/bin/bash 
FILE="/etc/login.defs"
FOUND_ITEM=`grep  '^PASS_MAX_DAYS' $FILE | awk -F ' ' '{print $2}'`
EXPECTED_ITEM="60"
RESULTS=0

if [[ $FOUND_ITEM -le  $EXPECTED_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
