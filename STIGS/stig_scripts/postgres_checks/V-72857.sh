#!/bin/bash 
shopt -s nocasematch

IFS=$'\n'
FILE=$db_hba_file

for FOUND_ITEM in $(grep -v ^# $FILE); do

  CHECK=`echo $FOUND_ITEM | awk -F " " '{print $NF}'`
  EXPECTED_ITEM=PASSWORD
  RESULTS=0

  if [[ $EXPECTED_ITEM == $CHECK ]]; then
    RESULTS=FAIL
  elif [[ -z $CHECK ]]; then
    FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
    RESULTS=FAIL
  else
    RESULTS=PASS
  fi

  RESULT_TABLE
  FILL_RESULTS

done

shopt -u nocasematch
