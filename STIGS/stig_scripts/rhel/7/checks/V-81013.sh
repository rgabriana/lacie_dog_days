#!/bin/bash -e 
FILE='/etc/fstab'
shopt -s nocasematch

FOUND_ITEM=`echo -e $(cat $FILE | grep /dev/shm | grep -o noexec)`
EXPECTED_ITEM='noexec'
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM

shopt -u nocasematch
