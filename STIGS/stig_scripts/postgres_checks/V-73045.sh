#!/bin/bash 

FILE=$db_config_file
FOUND_ITEM=$db_log_destination
EXPECTED_ITEM="syslog"
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

FILE=$db_config_file
FOUND_ITEM=$db_syslog_facility
EXPECTED_ITEM="local0"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM="TEST RESULT IS NULL"
  RESULTS=FAIL
else
  RESULTS=FAIL
fi
FILL_RESULTS
RESULT_TABLE
