#!/bin/bash 
FILE="/etc/audit/audit.rules"
FOUND_ITEM=`service auditd status | grep Active | awk -F " " '{print $1,$2,$3}'`
EXPECTED_ITEM="Active: active (running)"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
