#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=$db_log_file_mode
EXPECTED_ITEM='0600'
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

for LOGS in $(find $db_directory/$db_log_dir -type f); do

  shopt -s nocasematch

  FILE=$LOGS
  FOUND_ITEM=`stat -c %U $FILE`
  EXPECTED_ITEM=$db_owner
  RESULTS=0

  if [[ $EXPECTED_ITEM == $FOUND_ITEM || $FOUND_ITEM == "root" ]]; then
    RESULTS=PASS
  elif [[ -z $FOUND_ITEM ]]; then
    FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
    RESULTS=FAIL
  else
    RESULTS=FAIL
  fi

  FILL_RESULTS
  RESULT_TABLE

  shopt -u nocasematch
done
