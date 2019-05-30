#!/bin/bash 
FILE=`dirname $db_directory`
FOUND_ITEM=`stat -c %m $FILE`
EXPECTED_ITEM=`dirname $db_directory`
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
