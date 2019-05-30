#!/bin/bash 
FILE='/etc/security/pwquality.conf'
FOUND_ITEM=`grep ^dcredit $FILE|awk -F= '{print $2}'|tr -d ' '`
EXPECTED_ITEM='-1'
RESULTS=0

if [[ -n $FOUND_ITEM || $FOUND_ITEM -le $EXPECTED_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
