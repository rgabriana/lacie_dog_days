#!/bin/bash 
FILE=`rpm -qa|grep openssl`
FOUND_ITEM=`openssl version|grep -o fips`
EXPECTED_ITEM=fips
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

