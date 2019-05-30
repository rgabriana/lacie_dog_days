#!/bin/bash 
FILE="/usr/lib/systemd/system/sshd.service"
FOUND_ITEM=`echo -e $(systemctl status sshd|grep Active|awk -F " " '{print $2" "$3}')`
EXPECTED_ITEM='active (running)'
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
