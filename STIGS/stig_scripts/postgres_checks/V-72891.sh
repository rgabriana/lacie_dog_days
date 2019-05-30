#!/bin/bash 
FILE=$db_config_file
FOUND_ITEM=`stat -c %a $db_config_file`
OWNER=`stat -c %U $db_config_file`
EXPECTED_ITEM=600
RESULTS=0

shopt -s nocasematch

if [[ $EXPECTED_ITEM == $FOUND_ITEM && $OWNER == $db_owner ]]; then
  RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
else
  RESULTS=FAIL
fi

RESULT_TABLE

shopt -u nocasematch
