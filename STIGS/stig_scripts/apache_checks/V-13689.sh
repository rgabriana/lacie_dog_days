#!/bin/bash
#old_IFS=$IFS
#IFS=$'\n'
FILE_LIST=$A2_main_conf

for FILE in $FILE_LIST
do
#  IFS=$old_IFS
  HTTPD_ROOT=`grep -v '^#\|^[[:blank:]]*#' $FILE | awk NF | sed -e 's|^[[:space:]]*||g' | grep -i ^serverroot | cut -d ' ' -f 2 | sed -e 's|\"||g'` 
  LOG_ENTRY=`grep -v '^#\|^[[:blank:]]*#' $FILE | awk NF | sed -e 's|^[[:space:]]*||g' | grep -i ^errorlog | cut -d ' ' -f 2 | sed -e 's|\"||g'`
  LOG_FOLDER=`dirname $LOG_ENTRY`
  LOG_FILE=`find $HTTPD_ROOT/$LOG_FOLDER -type f`
  if [[ -z $LOG_FILE ]]
    then 
      FOUND_ITEM=`echo -e "no log files found in $HTTPD_ROOT/$LOG_ROOT"`
      RESULTS=FAIL
      RESULT_TABLE
      FILL_RESULTS
  else
#    IFS=$'\n'
    for l in $LOG_FILE
    do
      FOUND_ITEM=`stat -c %a $l`
      EXPECTED_ITEM="640"
      RESULTS=0
      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      else
        RESULTS=FAIL
      fi
        RESULT_TABLE
        FILL_RESULTS
      done
  fi
done
