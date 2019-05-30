#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=$db_ssl_crl_file
EXPECTED_ITEM=
RESULTS=0

if [[ -n $FOUND_ITEM || -f $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM="TEST RESULT IS NULL"
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

