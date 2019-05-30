#!/bin/bash 
FILE="/etc/pam.d/password-auth"
FOUND_ITEM=`echo -e $(grep auth.*required.*pam_faillock.so $FILE | grep -o even_deny_root)`
EXPECTED_ITEM="even_deny_root"
RESULTS=0
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
