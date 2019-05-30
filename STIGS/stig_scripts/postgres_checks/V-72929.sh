#!/bin/bash
set +e
FILE=$db_config_file
EXPECTED_ITEM=pgaudit
FOUND_ITEM=$db_shared_preload_libraries
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then

  EXPECTED_ITEM="pgaudit.log = role"
  FOUND_ITEM=`grep ^$EXPECTED_ITEM $db_config_file`

  if [[ $FOUND_ITEM == $EXPECTED_ITEM ]]; then
    RESULTS=PASS
  else
    RESULTS=FAIL
  fi

elif [[ -z $FOUND_ITEM ]]; then

  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL

else

  RESULTS=FAIL

fi
set -e
RESULT_TABLE

