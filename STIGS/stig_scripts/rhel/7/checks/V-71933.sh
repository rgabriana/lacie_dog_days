#!/bin/bash 
LIST="/etc/pam.d/system-auth /etc/pam.d/password-auth"
old_IFS=$IFS
IFS=" " 
for FILE in $LIST
  do
    FOUND_ITEM=`echo -e $(grep -E 'password.*requisite.*pam_pwhistory' $FILE | grep -o remember)`
    EXPECTED_ITEM='remember=5'
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
  done
IFS=$old_IFS
