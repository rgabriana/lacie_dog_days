#!/bin/bash 
FILE=$db_config_file
PREFIX=$db_log_line_prefix
IFS=" "

for FOUND_ITEM in $PREFIX; do 
  EXPECTED_ITEM='%m %u %d %p %r %a'
  RESULTS=0

  if [[ $EXPECTED_ITEM =~ $FOUND_ITEM ]]; then
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

CONNECTS="$db_log_connections $db_log_disconnects"

for FOUND_ITEM in $CONNECTS; do 

  EXPECTED_ITEM="on"

  if [[ $EXPECTED_ITEM =~ $FOUND_ITEM ]]; then
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

