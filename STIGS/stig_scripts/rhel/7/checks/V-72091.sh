#!/bin/bash 
FILE="/etc/audit/auditd.conf"
FOUND_ITEM=`echo -e $(grep "^space_left_action =" $FILE)`
EXPECTED_ITEM="space_left_action = email"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
