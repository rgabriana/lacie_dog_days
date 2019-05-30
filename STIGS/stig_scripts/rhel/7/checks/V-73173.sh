#!/bin/bash 
FILE='/etc/audit/audit.rules'
FOUND_ITEM=`echo -e $(grep /etc/security/opasswd $FILE)`
EXPECTED_ITEM="-w /etc/security/opasswd -p wa -k identity"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
