#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=`grep -v ^# $db_config_file|grep -i log`
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
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

