#!/bin/bash
IFS=$'\n'
FILE=$db_hba_file
LIST=`grep -v ^# $db_hba_file`

for a in $LIST; do 

  FOUND_ITEM="$a"
  TEST=`echo "$FOUND_ITEM" | awk -F " " '{print $NF}'`
  EXPECTED_ITEM="gss, sspi, or ldap"
  RESULTS=0

    if [[ $TEST == gss || $TEST == sspi || $TEST == ldap ]]; then
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
