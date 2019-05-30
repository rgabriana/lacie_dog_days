#!/bin/bash 
FILE="/etc/pam.d/passwd"
FOUND_ITEM=`echo -e $(grep -i substack $FILE|grep -o system-auth)`
EXPECTED_ITEM="system-auth"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
