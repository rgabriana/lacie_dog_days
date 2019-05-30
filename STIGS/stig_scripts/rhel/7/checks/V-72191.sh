#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/bin/kmod.*module-change" $FILE)`
EXPECTED_ITEM="-w /usr/bin/kmod -p x -F auid!=4294967295 -k module-change"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
