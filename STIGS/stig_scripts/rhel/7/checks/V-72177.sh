#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/sbin/postqueue.*privileged-postfix" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/sbin/postqueue -F auid>=1000 -F auid!=4294967295 -k privileged-postfix"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
