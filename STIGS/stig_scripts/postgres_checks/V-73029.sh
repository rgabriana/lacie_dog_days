#!/bin/bash

for FILE in {$db_ssl_ca_file,$db_ssl_cert_file,$db_ssl_crl_file,$db_ssl_key_file}; do

  FILE=`dirname $FILE`
  FOUND_ITEM=`stat -c %a $FILE`
  EXPECTED_ITEM=700
  RESULTS=0

  if [[ $EXPECTED_ITEM == $FOUND_ITEM && $db_owner == $(stat -c %U $FILE) ]]; then
    RESULTS=PASS
  elif [[ -z $FOUND_ITEM ]]; then 
    FOUND_ITEM="TEST RESULT IS NULL"
    RESULTS=FAIL
  else
    RESULTS=FAIL
  fi

  RESULT_TABLE
  FILL_RESULTS

done
