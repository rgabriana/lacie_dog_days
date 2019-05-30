#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/usr/bin/umount.*privileged-mount" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/bin/umount -F auid>=1000 -F auid!=4294967295 -k privileged-mount"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
