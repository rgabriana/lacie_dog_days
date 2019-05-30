#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "setxattr .*perm_mod" $FILE)`
EXPECTED_ITEM="-a always,exit -F arch=b32 -S setxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod -a always,exit -F arch=b64 -S setxattr -F auid>=1000 -F auid!=4294967295 -k perm_mod"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
