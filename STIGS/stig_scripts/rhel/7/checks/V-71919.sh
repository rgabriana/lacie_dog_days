#!/bin/bash 
ENTRIES="/etc/pam.d/system-auth /etc/pam.d/password-auth"
old_IFS=$IFS
IFS=' '
for FILE in $ENTRIES
  do
    FOUND_ITEM=`echo -e $(grep -e "password.*pam_unix.so" $FILE | grep -o sha512)`
    EXPECTED_ITEM='sha512'
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
  done
IFS=$old_IFS
