#!/bin/bash
FILE='shosts.equiv'
FOUND_ITEM=`echo -e $(find / -type f -name shosts.equiv)`
EXPECTED_ITEM="no shosts.equiv files on the system"
if [[ -z $FOUND_ITEM ]]
  then
    RESULTS=PASS
    RESULT_TABLE
else
  RESULTS=FAIL
  RESULT_TABLE
fi
