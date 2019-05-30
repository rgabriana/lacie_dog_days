#!/bin/bash -e 
FILE='/etc/fstab'
FOUND_ITEM=`echo -e $(grep /dev/shm $FILE | grep -o nodev)`
EXPECTED_ITEM='nodev'
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
