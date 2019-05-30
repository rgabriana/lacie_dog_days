#!/bin/bash 
FILE='/etc/passwd'
LIST_OF_USERS=`awk -F: '$3 >= 1000 && $3 < 65534 {print $0}' $FILE`
old_ifs=$IFS
IFS=$'\n'
for LOU in $LIST_OF_USERS
  do
    USERS=`echo -e $LOU | awk -F: '{print $1}'`
    HOME_DIR=`echo -e $LOU | awk -F: '{print $6}'`
    FILE=`echo -e $(grep ^PATH $HOME_DIR/.* | awk -F: '{print $1}')`
    FOUND_ITEM=`echo -e $(grep ^PATH $FILE | awk -F= '{print $2}' | grep -e "^:.*:$")`
    EXPECTED_ITEM=""
    if [[ "$EXPECTED_ITEM" == "$FOUND_ITEM" ]]
      then
        RESULTS=PASS
    else
      RESULTS=FAIL
    fi
    NOTES="If there is an empty entry, such as a leading or trailing colon or two consecutive colons, this is interpreted as the current working directory."
    RESULT_TABLE
    FILL_RESULTS
  done
IFS=$old_ifs
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
