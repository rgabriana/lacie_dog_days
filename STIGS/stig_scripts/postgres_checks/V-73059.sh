#!/bin/bash
for FILE in $(find $db_directory -type f); do

  FOUND_ITEM=`stat -c %a $FILE`
  EXPECTED_ITEM=600
  RESULTS=0

  if [[ $EXPECTED_ITEM -ge $FOUND_ITEM && $db_owner == $(stat -c %U $FILE) ]]; then
    RESULTS=PASS
  elif [[ -z $FOUND_ITEM ]]; then 
    FOUND_ITEM="TEST RESULT IS NULL"
    RESULTS=FAIL
  else
    RESULTS=FAIL
  fi

  RESULT_TABLE
  FILL_RESULTS

done
