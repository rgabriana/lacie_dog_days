#!/bin/bash
FILE='*.shosts'
FOUND_ITEM=`echo -e $(find / -type f -name "$FILE")`
EXPECTED_ITEM="no $FILE files on the system"
if [[ -z $FOUND_ITEM ]]
  then
    RESULTS=PASS
    RESULT_TABLE
else
  RESULTS=FAIL
  RESULT_TABLE
fi
