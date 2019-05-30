#!/bin/bash 
LIST="/etc/pam.d/system-auth /etc/pam.d/password-auth"
old_IFS=$IFS
IFS=" "
for FILE in $LIST
  do
    FOUND_ITEM=`echo -e "$(grep password.*nullok $FILE)"`
    EXPECTED_ITEM="NULL VALUE"
    RESULTS=0
    if [[ -z $FOUND_ITEM ]]; then
      RESULTS=PASS
    else
      RESULTS=FAIL
    fi
    RESULT_TABLE
    FILL_RESULTS
  done
IFS=$old_IFS
