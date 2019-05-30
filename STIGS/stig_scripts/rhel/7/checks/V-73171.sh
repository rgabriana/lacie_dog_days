#!/bin/bash 
FILE='/etc/audit/audit.rules'
FOUND_ITEM=`echo -e $(grep /etc/shadow $FILE)`
EXPECTED_ITEM="-w /etc/shadow -p wa -k identity"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
