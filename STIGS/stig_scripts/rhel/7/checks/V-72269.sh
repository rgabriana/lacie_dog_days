#!/bin/bash 
FILE="/etc/ntp.conf"
FOUND_ITEM=`echo -e $(grep -e ^server.*maxpoll $FILE | awk -F " " '{for(f=1;f<=NF;f++){if($f~/maxpoll/){print $(f+1)}}}')`
EXPECTED_ITEM=16
# LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
NOTES="If the option is set to 17 or is not set, this is a finding."
LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" LESS_THAN "$FOUND_ITEM"
