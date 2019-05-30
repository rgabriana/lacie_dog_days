#!/bin/bash 
FILE="/etc/passwd"
# find all interactive users
USER_LIST=`awk -F: '$3 >= 1000 && $3 < 65534 {print $0}' /etc/passwd`
old_IFS=$IFS
IFS=$'\n'
# for every interactive users,  make a list of possible init files
for USER in $USER_LIST
  do
    HOME_DIR=`echo -e $USER | awk -F: '{print $6}'`
    FILE_LIST=`find -H $HOME_DIR -xdev -maxdepth 1 -type f -name \.\*`
    for FILE in $FILE_LIST
      do
        FOUND_ITEM=`stat -c %a $FILE`
        EXPECTED_ITEM=740
        LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM GREATER_THAN $FOUND_ITEM
#        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
    done
  done
IFS=$old_IFS
