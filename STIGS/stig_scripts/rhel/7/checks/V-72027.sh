#!/bin/bash 
FILE="/etc/passwd"
LIST=`awk -F: '$3 >= 1000 && $3 < 65534 {print $0}' $FILE`
old_IFS=$IFS
IFS=$'\n'
for USER in $LIST 
  do
    UserName=`echo -e $USER | awk -F: '{print $1}'`
    HomeDir=`echo -e $USER | awk -F: '{print $6}'`
    GroupID=`echo -e $USER | awk -F: '{print $4}'`
    LIST_OF_FILES=`find $HomeDir -not -path '*/\.*' -type f -perm /-o=r,-o=w,-o=x`
    if [[ -z $LIST_OF_FILES ]]
      then
        FILE="NO VIOLATING FILE FOUND"
        FOUND_ITEM=750
        EXPECTED_ITEM=750
        LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM GREATER_THAN $FOUND_ITEM
    else
      for FILE in $LIST_OF_FILES
        do
          FOUND_ITEM=`stat -c %a $FILE`
          EXPECTED_ITEM=750
          LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM GREATER_THAN $FOUND_ITEM
          FILL_RESULTS
        done
    fi
  done
IFS="$old_IFS"
