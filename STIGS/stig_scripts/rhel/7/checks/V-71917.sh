#!/bin/bash 
FILE='/etc/security/pwquality.conf'
FOUND_ITEM=`grep -i ^maxclassrepeat $FILE|awk -F= '{print $2}'|tr -d ' '`
EXPECTED_ITEM='4'
RESULTS=0

if [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM="TEST RESULT IS NULL"
  RESULTS=FAIL
elif [[ $FOUND_ITEM -le $EXPECTED_ITEM  ]]; then
  RESULTS=PASS
else
  RESULTS=FAIL
fi

RESULT_TABLE
