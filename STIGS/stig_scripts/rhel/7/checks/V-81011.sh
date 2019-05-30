#!/bin/bash -e 
FILE='/etc/fstab'
FOUND_ITEM=`echo -e $(grep /dev/shm $FILE | grep -o nosuid)`
EXPECTED_ITEM='nosuid'
RESULTS=0
NOTES="see article https://access.redhat.com/solutions/1384183"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
