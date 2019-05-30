#!/bin/bash 
set +e 
FILE=$db_config_file
CONFIGS="$db_directory/$db_log_dir $db_directory/pgaudit $db_directory"
IFS=" "

for FOUND_ITEM in $CONFIGS; do 

  OWNER=`stat -c %U $FOUND_ITEM`
  EXPECTED_ITEM=$db_owner
  RESULTS=0
  if [[ ! -d $FOUND_ITEM ]]; then
    EXPECTED_ITEM="Directory not found"
    RESULTS=FAIL
  elif [[ $EXPECTED_ITEM == $OWNER || $OWNER == "root"  ]]; then
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

FOUND_ITEM=`$db_exec --tuples-only --no-align -U $db_user -c "\du"`
IFS=$'{}'

for i in $FOUND_ITEM; do 
  
  EXPECTED_ITEM="THIS IS A MANUAL CHECK"
  
  if [[ $EXPECTED_ITEM == ${i} ]]; then
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
set -e
