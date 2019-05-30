#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=$db_log_hostname
EXPECTED_ITEM="on"
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

FOUND_ITEM=$db_log_line_prefix
EXPECTED_ITEM='%m %u %d %p %r %a'
IFS=" "
for LIST in $FOUND_ITEM; do

  if [[ $EXPECTED_ITEM =~ $LIST ]]; then
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
