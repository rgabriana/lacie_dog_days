#!/bin/bash
IFS=" "
FILE=$db_config_file
CHECKS="$db_tcp_keepalives_count\
 $db_tcp_keepalives_idle\
 $db_tcp_keepalives_interval\
 $db_statement_timeout"

for FOUND_ITEM in $CHECKS; do

  EXPECTED_ITEM=">1"
  RESULTS=0

  if [[ $FOUND_ITEM -gt 0 ]]; then
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
