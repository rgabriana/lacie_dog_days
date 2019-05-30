#!/bin/bash 
FILE="/etc/audit/auditd.conf"
# Partition size in kilobytes
DISK_SIZE=`df -l /var/log/audit|awk -F " " 'FNR>=2 {print $2}'`
# calculate 25% 
TRESHOLD_IN_KBYTES=`echo $DISK_SIZE*.25|bc`
# convert into MB
TRESHOLD_IN_MB=`echo $TRESHOLD_IN_KBYTES/1024|bc`
# set the expected value
EXPECTED_ITEM="space_left = $TRESHOLD_IN_MB"
# find the settings
FOUND_ITEM=`echo -e $(grep "^space_left =" $FILE)`
# compare
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
