#!/bin/bash 
FILE="/etc/libuser.conf"
FOUND_ITEM=`grep -i '^crypt_style = sha512' $FILE`
EXPECTED_ITEM="crypt_style = sha512"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE
