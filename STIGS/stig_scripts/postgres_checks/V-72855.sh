#!/bin/bash 
IFS=$'\n'
FILE=`find $db_directory -type f -perm /g=rw,o=rw`
for FILES in $FILE; do
  
  FOUND_ITEM=`stat -c %U $FILES`
  EXPECTED_ITEM=$db_owner
  RESULTS=0

  if [[ $FOUND_ITEM == $EXPECTED_ITEM && $(stat -c %a $FILES) -le 644 ]]; then
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
