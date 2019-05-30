#!/bin/bash 
FILE="/etc/fstab"
FOUND_ITEM=`service tmp.mount status | grep Active | awk -F " " '{print $1,$2,$3}'`
EXPECTED_ITEM="Active: active (mounted)"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
