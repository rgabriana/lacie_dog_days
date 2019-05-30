#!/bin/bash 
set +e 
FILE=$db_config_file
FOUND_ITEM=`$db_exec -U $db_user --tuples-only --no-align -c "SHOW shared_preload_libraries"|grep -o pgaudit`
EXPECTED_ITEM=pgaudit
RESULTS=0
set -e

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
