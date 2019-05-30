#!/bin/bash 
FILE='/etc/security/pwquality.conf'
FOUND_ITEM=`grep ^difok $FILE|awk -F= '{print $2}'|tr -d ' '`
EXPECTED_ITEM='8'
RESULTS=0

if [[ $FOUND_ITEM -ge $EXPECTED_ITEM  ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
