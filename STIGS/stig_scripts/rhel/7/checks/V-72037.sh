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
    FILE_LIST=`find -H $HOME_DIR -xdev -maxdepth 1 -type f -perm 002 -name \.\*`
    if [[ $FILE_LIST ]]
      then
        for FILE in $FILE_LIST
          do
            FOUND_ITEM=`stat -c %A $FILE | cut -c 9`
            EXPECTED_ITEM="-"
            LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
            FILL_RESULTS
          done
    fi
  done
# Now process the global init files
IFS=$old_IFS
GLOBAL_INIT="/etc/bashrc /etc/profile /etc/init.d /etc/profile.d"
for FILE in $GLOBAL_INIT
  do
# Check to see if they are directories
    if [[ -d $FILE ]]
      then
# Look for world writable files in the directory
        for FILE in $(find $FILE -xdev -type f -perm -002)
          do 
            FOUND_ITEM=$FILE
            EXPECTED_ITEM=""  
            LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
            FILL_RESULTS
         done
    else
      FOUND_ITEM=`stat -c %A $FILE | cut -c 9`
      EXPECTED_ITEM='-'
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
  done
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
