#!/bin/bash 
IFS=$'\n'
FILE=$db_hba_file
USERS=`$db_exec --username=$db_user --no-align --tuples-only --command='\du'`
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
RESULTS=0

for FOUND_ITEM in $USERS; do 

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

USERS=`$db_exec --username=$db_user --no-align --tuples-only --command='\dp+ *.*'`

for FOUND_ITEM in $USERS; do

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

USERS=`grep -v ^# $FILE`

for FOUND_ITEM in $USERS; do 

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
