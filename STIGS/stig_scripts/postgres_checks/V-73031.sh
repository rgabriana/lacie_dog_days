#!/bin/bash 
FILE=$db_config_file
CHECKS="$db_ssl_ca_file $db_ssl_cert_file"
IFS=" "
for CERTS in $CHECKS; do

  FOUND_ITEM="$CERTS"
  EXPECTED_ITEM="THIS IS A MANUAL CHECK"
  RESULTS=0

  if [[ "$EXPECTED_ITEM" == "$FOUND_ITEM" ]]; then
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
