#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=$db_shared_preload_libraries
EXPECTED_ITEM="pgaudit"
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

