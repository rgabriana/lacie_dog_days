#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/var/log/lastlog .*logins" $FILE)`
EXPECTED_ITEM="-w /var/log/lastlog -p wa -k logins"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
