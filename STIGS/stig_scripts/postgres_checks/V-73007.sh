#!/bin/bash 
FILE="pg_extension"
FOUND_ITEM=`$db_exec -U $db_user --tuples-only --no-align -c "select * from pg_extension where extname != 'plpgsql'"`
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
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
