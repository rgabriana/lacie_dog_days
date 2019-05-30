#!/bin/bash
set +e
FILE=$db_config_file
EXPECTED_ITEM=pgaudit
FOUND_ITEM=$db_shared_preload_libraries
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then

  RESULT_TABLE
  EXPECTED_ITEM="%m %a %u %d %r %p %m"
  FOUND_ITEM=$db_log_line_prefix
  IFS=" "

  for LIST in $FOUND_ITEM; do

    if [[ $FOUND_ITEM =~ $EXPECTED_ITEM ]]; then
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

set -e

