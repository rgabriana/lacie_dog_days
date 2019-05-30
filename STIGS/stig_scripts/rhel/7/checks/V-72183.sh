#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/bin/crontab.*privileged-cron" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/bin/crontab -F auid>=1000 -F auid!=4294967295 -k privileged-cron"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
