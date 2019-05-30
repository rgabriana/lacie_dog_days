#!/bin/bash 
FILE=/etc/login.defs
FOUND_ITEM=`echo -e $(grep -e ^UMASK $FILE) | awk -F " " '{print $2}'`
EXPECTED_ITEM=077
LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" GREATER_THAN "$FOUND_ITEM"
