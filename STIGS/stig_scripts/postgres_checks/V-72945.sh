#!/bin/bash

FOUND_ITEM=$db_logging_collector
FILE=$db_config_file
EXPECTED_ITEM=on
RESULTS=0

if [[ $FOUND_ITEM == $EXPECTED_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
