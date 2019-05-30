#!/bin/bash 
FILE="/etc/passwd"
old_IFS=$IFS
IFS=$'\n'
for i in $(cat $FILE)
  do 
    EXPECTED_ITEM="0"
    FOUND_ITEM=`echo -e ${i} | awk -F: '{print $3}'`
    U_NAME=`echo -e ${i} | awk -F: '{print $1}'`

    if [[ $EXPECTED_ITEM -ne $FOUND_ITEM && "$U_NAME" != root ]]
      then
        NOTES="UID: $FOUND_ITEM"
        LOGIC_TEST $U_NAME $U_NAME
        FILL_RESULTS

    elif [[ $EXPECTED_ITEM -eq $FOUND_ITEM && "$U_NAME" != root ]]
      then 
        NOTES="UID: $FOUND_ITEM"
        LOGIC_TEST $U_NAME root
        FILL_RESULTS
    fi

  done
IFS=$old_IFS
