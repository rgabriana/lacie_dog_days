#!/bin/bash 
FILE="/etc/login.defs"
FOUND_ITEM=`echo $(grep "^CREATE_HOME" /etc/login.defs|awk -F " " '{print $2}')` 
EXPECTED_ITEM="yes"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
