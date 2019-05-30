#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=$db_client_min_messages
EXPECTED_ITEM="DEBUG, LOG"
RESULTS=0

shopt -s nocasematch

if [[ debug != $FOUND_ITEM || log != $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

for LOGS in $(find $db_directory/$db_log_dir -type f); do 

  FILE=$LOGS
  OWNER=`stat -c %U $FILE`
  PERM=`stat -c %a $FILE`
  EXPECTED_ITEM=$db_owner

  if [[ $PERM == 600 && (( $EXPECTED_ITEM == $OWNER || $OWNER == root )) ]]; then
    RESULTS=PASS
  elif [[ -z $FOUND_ITEM ]]; then
    FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
    RESULTS=FAIL
  else
    RESULTS=FAIL
  fi

  FILL_RESULTS
  RESULT_TABLE

done

shopt -u nocasematch
