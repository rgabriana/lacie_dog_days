#!/bin/bash 
FILE="/etc/security/pwquality.conf"
FOUND_ITEM=`grep minlen $FILE | awk -F ' ' '{print $NF}'`
EXPECTED_ITEM="15"
RESULTS=0

if [[ $EXPECTED_ITEM -le $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
