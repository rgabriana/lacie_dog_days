#!/bin/bash
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(grep -iw "/etc/passwd.*identity" $FILE )`
EXPECTED_ITEM="-w /etc/passwd -p wa -k identity"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
