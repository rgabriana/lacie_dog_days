#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/var/run/faillock .*logins" $FILE)`
EXPECTED_ITEM="-w /var/run/faillock -p wa -k logins"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
