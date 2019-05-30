#!/bin/bash

for FILE in $(find $(dirname $db_directory) \! -user $db_owner); do

  FILE=$FILE
  FOUND_ITEM=`stat -c %U $FILE`
  EXPECTED_ITEM=root
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
  FILL_RESULTS

done
