#!/bin/bash 
FILE="rsh-server"
FOUND_ITEM=`yum -q list installed $FILE | awk -F " " 'FNR>=2 {print $1}'`
if [ -z $FOUND_ITEM ]
  then
    FOUND_ITEM="$FILE NOT INSTALLED"
    EXPECTED_ITEM=$FOUND_ITEM
else
    EXPECTED_ITEM="$FILE NOT INSTALLED"
fi 
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
