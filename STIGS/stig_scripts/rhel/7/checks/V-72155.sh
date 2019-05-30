#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/bin/chage.*privileged-passwd" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/bin/chage -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-passwd"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
