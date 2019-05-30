#!/bin/bash 
FILE='/etc/passwd'
LIST_OF_USERS=`awk -F: '$3 >= 1000 && $3 < 65534 {print $0}' $FILE`
old_ifs=$IFS
IFS=$'\n'
for LOU in $LIST_OF_USERS
  do
    USERS=`echo -e $LOU | awk -F: '{print $1}'`
    HOME_DIR=`echo -e $LOU | awk -F: '{print $6}'`
    LIST_OF_FILES=`find $HOME_DIR -type f -name '\.*' -not -user $USERS`
    if [[ -z $LIST_OF_FILES ]]
      then
        FILE="NO VIOLATING FILE FOUND"
        FOUND_ITEM="$USERS"
        EXPECTED_ITEM="$USERS"
        LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
        FILL_RESULTS
    else
      for LOF in $LIST_OF_FILES
        do
          FILE=$LOF
          FOUND_ITEM=`stat -c %U $FILE`
          EXPECTED_ITEM="$USERS"
          LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
          FILL_RESULTS
        done
    fi
  done
IFS=$old_ifs
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
