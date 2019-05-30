#!/bin/bash 
FILE="/etc/passwd"
LIST=`awk -F: '$3 >= 1000 && $3 < 65534 {print $0}' $FILE`
old_IFS=$IFS
IFS=$'\n'
for i in $LIST 
  do
    UserName=`echo -e ${i} | awk -F: '{print $1}'`
    HomeDir=`echo -e ${i} | awk -F: '{print $6}'`
    FOUND_ITEM=`echo -e $(stat -c %U $HomeDir)`
    EXPECTED_ITEM="$UserName"
    LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
    FILL_RESULTS
  done
IFS="$old_IFS"




#    LOGIC_TEST_PLUS_MINUS $FOUND_ITEM LESS_THAN $EXPECTED_ITEM
