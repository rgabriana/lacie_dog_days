#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "usr/libexec/openssh/ssh-keysign.*privileged-ssh" $FILE)`
EXPECTED_ITEM="-a always,exit -F path=/usr/libexec/openssh/ssh-keysign -F auid>=1000 -F auid!=4294967295 -k privileged-ssh"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
