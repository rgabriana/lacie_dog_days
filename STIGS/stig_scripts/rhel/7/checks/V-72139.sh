#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/bin/chcon .*privileged-priv_change" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/bin/chcon -F auid>=1000 -F auid!=4294967295 -k privileged-priv_change"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
