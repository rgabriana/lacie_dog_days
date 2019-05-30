#!/bin/bash 
set +e 

FILE=$db_config_file
FOUND_ITEM=`$db_shared_preload_libraries | grep pgaudit`
EXPECTED_ITEM=pgaudit
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

EXPECTED_ITEM="read, write"
FOUND_ITEM=`echo $db_pgaudit_log|grep $EXPECTED_ITEM`

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

set -e

FILL_RESULTS
RESULT_TABLE
