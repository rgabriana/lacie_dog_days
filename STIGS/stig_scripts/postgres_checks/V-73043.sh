#!/bin/bash 
FILE=$db_directory
FOUND_ITEM1=`stat -c %U $db_directory`
FOUND_ITEM2=`stat -c %a $db_directory`
EXPECTED_ITEM1=$db_owner
EXPECTED_ITEM2=700
RESULTS=0

if [[ $EXPECTED_ITEM1 == $FOUND_ITEM1 ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM1 ]]; then
  FOUND_ITEM1="TEST RESULT IS NULL"
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

if [[ $EXPECTED_ITEM2 == $FOUND_ITEM2 ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM2 ]]; then
  FOUND_ITEM2="TEST RESULT IS NULL"
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

FILL_RESULTS
RESULT_TABLE
