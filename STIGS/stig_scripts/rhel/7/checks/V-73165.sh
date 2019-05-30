#!/bin/bash 
FILE='/etc/audit/audit.rules'
FOUND_ITEM=`echo -e $(grep /etc/group $FILE)`
EXPECTED_ITEM="-w /etc/group -p wa -k identity"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
