#!/bin/bash 
FILE="/etc/passwd"
LIST=`awk -F: '$3 >= 1000 && $3 < 65534 {print $0}' $FILE`
old_IFS=$IFS
IFS=$'\n'
for i in $LIST 
  do
    UserName=`echo -e ${i} | awk -F: '{print $1}'`
    HomeDir=`echo -e ${i} | awk -F: '{print $6}'`
    FOUND_ITEM=`[[ -d $HomeDir ]] && echo -e "$HomeDir"`
    EXPECTED_ITEM="$HomeDir"
    LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
    FILL_RESULTS
  done
IFS="$old_IFS"




# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
