#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=$db_ssl
EXPECTED_ITEM=on
RESULTS=0
shopt -s nocasematch

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM="TEST RESULT IS NULL"
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
shopt -u nocasematch
