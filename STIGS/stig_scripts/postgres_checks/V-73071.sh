#!/bin/bash 
FILE='/etc/redhat-release'
EXPECTED_ITEM="Redhat"
FOUND_ITEM=`grep -i $EXPECTED_ITEM /etc/*-release`
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

