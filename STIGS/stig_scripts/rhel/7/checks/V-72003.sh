#!/bin/bash 
FILE="/etc/passwd"
old_IFS=$IFS
IFS=$'\n'
for i in $(cat $FILE)
  do 
    EXPECTED_ITEM=`echo -e ${i} | awk -F: '{print ":"$4":"}'`
    FOUND_ITEM=`echo -e $(grep -o $EXPECTED_ITEM /etc/group)`
    U_NAME=`echo -e ${i} | awk -F: '{print $1}'`

    if [[ "$EXPECTED_ITEM" == "$FOUND_ITEM" ]]
      then

        NOTES="username $U_NAME groupname $EXPECTED_ITEM FOUND"
        LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
        FILL_RESULTS

    else

        NOTES="username $U_NAME groupname $EXPECTED_ITEM GROUP NOT FOUND"
        LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
        FILL_RESULTS
    fi

  done
IFS=$old_IFS
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
