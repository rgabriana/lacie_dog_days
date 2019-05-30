#!/bin/bash 
IFS=$'\n'
FILE=$db_hba_file
LIST=`grep -v ^# $FILE`
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
RESULTS=0

for FOUND_ITEM in $LIST; do 

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
