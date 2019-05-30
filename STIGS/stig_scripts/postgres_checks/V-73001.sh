#!/bin/bash 
set +e
FILE=$db_config_file
FOUND_ITEM=`grep -oq paudit $db_config_file`
EXPECTED_ITEM=pgaudit
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
  FOUND_ITEM=$db_log_destination
  EXPECTED_ITEM="stderr or syslog"

  if [[ $FOUND_ITEM == "stderr" || $FOUND_ITEM == "syslog" ]]; then
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

RESULT_TABLE
set -e
