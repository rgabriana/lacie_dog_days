#!/bin/bash 
FILE="THIS IS A MANUAL CHECK"
FOUND_ITEM="THIS IS A MANUAL CHECK"
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS="THIS IS A MANUAL CHECK"
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL
else
  RESULTS="THIS IS A MANUAL CHECK"
fi

RESULT_TABLE
