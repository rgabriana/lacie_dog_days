#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "renameat" $FILE)`
EXPECTED_ITEM="-a always,exit -F arch=b32 -S renameat -F auid>=1000 -F auid!=4294967295 -k delete -a always,exit -F arch=b64 -S renameat -F auid>=1000 -F auid!=4294967295 -k delete"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
