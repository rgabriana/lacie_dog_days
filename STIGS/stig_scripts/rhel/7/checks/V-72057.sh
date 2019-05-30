#!/bin/bash 
FILE="/usr/lib/systemd/system/kdump.service"
FOUND_ITEM=`echo -e $(systemctl status kdump.service|grep Active|awk -F " " '{print $2" "$3}')`
EXPECTED_ITEM='inactive (dead)'
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
