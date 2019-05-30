#!/bin/bash
FILE="/etc/login.defs"
FOUND_ITEM=`grep -i '^FAIL_DELAY' $FILE|awk '{print $2}'`
EXPECTED_ITEM="4"
RESULTS=0
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
