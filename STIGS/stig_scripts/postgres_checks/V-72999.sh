#!/bin/bash 
IFS=$'\n'
FILE=$db_hba_file
FOUND_ITEM=`$db_exec -U $db_user -c "\du"`
EXPECTED_ITEM="MANUAL CHECK"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM="TEST RESULT IS NULL"
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
