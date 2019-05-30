#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/etc/sudoers.*privileged-actions" $FILE)`
EXPECTED_ITEM="-w /etc/sudoers -p wa -k privileged-actions -w /etc/sudoers.d/ -p wa -k privileged-actions"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
