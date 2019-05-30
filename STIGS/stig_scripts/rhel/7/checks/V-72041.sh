#!/bin/bash
FILE="/etc/fstab"
FOUND_ITEM=`echo -e $(grep -o nosuid $FILE)`
EXPECTED_ITEM="nosuid"
NOTES=`echo -e $(grep /home /etc/fstab)`
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
