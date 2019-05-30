#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/sbin/pam_timestamp_check.*privileged-pam" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/sbin/pam_timestamp_check -F auid>=1000 -F auid!=4294967295 -k privileged-pam"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
