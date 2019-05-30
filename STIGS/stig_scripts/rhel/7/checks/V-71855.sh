#!/bin/bash 

_QUERY_LIST=`rpm -Va | grep '^..5'`

IFS=$'\n'

for FILE in $_QUERY_LIST

  do

    FOUND_ITEM=`echo -e "$FILE" | awk -F ' ' '{print $1}'|tr -d ' '`
    EXPECTED_ITEM='.........'
    RESULTS=0
    FILE=`echo -e $FILE|awk -F " " '{print $NF}'`

    if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
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
