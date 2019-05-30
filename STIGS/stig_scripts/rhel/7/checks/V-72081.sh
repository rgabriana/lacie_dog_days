#!/bin/bash 
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`echo -e $(auditctl -s|grep failure)`
EXPECTED_ITEM="failure 1"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
