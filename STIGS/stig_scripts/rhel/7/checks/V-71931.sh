#!/bin/bash 
FILE="/etc/shadow"
EXPECTED_ITEM="60"
RESULTS=0
LIST=`awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd`

for USERS in $LIST; do
    FOUND_ITEM=`grep $USERS $FILE | awk -F: '{print $5}'`

if [[ $EXPECTED_ITEM -ge $FOUND_ITEM ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi
NOTES="username: $USERS"
RESULT_TABLE
FILL_RESULTS
done

