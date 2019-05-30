#!/bin/bash 
IFS=$'\n'
FILE=$db_hba_file
FOUND_ITEM=`$db_exec --tuples-only --no-align -U $db_user -c "\du"`
LOD=`$db_exec --tuples-only --no-align -U $db_user -c "\l"`
LOS=`$db_exec --tuples-only --no-align -U $db_user -c "\dn+"`
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
RESULTS=0

if [[ $EXPECTED_ITEM == "$FOUND_ITEM" ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

