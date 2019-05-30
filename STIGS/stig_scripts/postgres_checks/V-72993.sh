#!/bin/bash
set +e

FILE="/proc/sys/crypto/fips_enabled"
EXPECTED_ITEM=1
RESULTS=0
FOUND_ITEM=`cat /proc/sys/crypto/fips_enabled`

if [[ ! -f $FILE ]]; then
  RESULTS=FAIL
  FOUND_ITEM="$FILE CANNOT BE FOUND"
elif [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
  RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

set -e
