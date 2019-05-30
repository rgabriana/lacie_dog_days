#!/bin/bash 
FILE="/etc/resolv.conf"
FOUND_ITEM=`echo -e $(grep nameserver $FILE)|wc -l`
EXPECTED_ITEM=2
NOTES=`echo -e $(grep nameserver $FILE)`
LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM GREATER_THAN $FOUND_ITEM
