#!/bin/bash 
shopt -s nocasematch
FILE=$db_config_file
FOUND_ITEM=$db_log_min_error_statement
EXPECTED_ITEM=error
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
shopt -u nocasematch
