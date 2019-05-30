#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "init_module.*module-change" $FILE)`
EXPECTED_ITEM="-a always,exit -F arch=b32 -S init_module -k module-change -a always,exit -F arch=b64 -S init_module -k module-change"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
