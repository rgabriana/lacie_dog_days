#!/bin/bash 
FILE=$db_config_file
EXPECTED_ITEM=on
FOUND_ITEM=$db_logging_collector
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then

  RESULTS='PASS'

  RESULT_TABLE

  EXPECTED_ITEM='%m %a %u %d %c %s %r'
  FOUND_ITEM=$db_log_line_prefix
  IFS=' '
  for LIST in $FOUND_ITEM; do

    if [[ $EXPECTED_ITEM =~ $LIST ]]; then
      RESULTS=PASS
    else
      RESULTS=FAIL
    fi

    FILL_RESULTS
    RESULT_TABLE

  done

elif [[ -z $FOUND_ITEM ]]; then

  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL

  RESULT_TABLE

else

  RESULTS=FAIL

  RESULT_TABLE

fi
