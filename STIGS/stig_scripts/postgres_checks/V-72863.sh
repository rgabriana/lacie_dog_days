#!/bin/bash -x
IFS=$'\n'
FILE=$db_config_file
FOUND_ITEM=$db_max_connections
EXPECTED_ITEM='> -1'
RESULTS=0

if [[ $FOUND_ITEM -gt -1 ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

for USERS in $($db_exec -U $db_user --tuples-only --no-align -c "SELECT rolname,rolconnlimit from pg_authid"); do

  ROLE_NAME=`echo $USERS | awk -F "|" '{print $1}'`
  FOUND_ITEM=`echo $USERS | awk -F "|" '{print $2}'`
  
  if [[ "$FOUND_ITEM" -gt -1 ]]; then
    RESULTS=PASS
  else
    RESULTS=FAIL
  fi

  FILL_RESULTS
  RESULT_TABLE

done
