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
    GROUP_ID=`echo -e $USER | awk -F: '{print $4}'`
    FILE_LIST=`find $HOME_DIR -type f -not -gid $GROUP_ID`
    for FILE in $FILE_LIST
      do
        FOUND_ITEM=`stat -c %g $FILE`
        EXPECTED_ITEM="$GROUP_ID"
        if [ $EXPECTED_ITEM -eq $FOUND_ITEM ]
          then
            RESULTS="PASS"
        else
          RESULTS="FAIL"
        fi
        RESULT_TABLE
        FILL_RESULTS
    done
  done
