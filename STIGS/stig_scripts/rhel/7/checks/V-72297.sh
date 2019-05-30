#!/bin/bash 
FILE=`echo -e $(yum whatprovides postfix | awk -F " : " '$1 ~ "postfix" {print $1}' | sort -u)`
FOUND_ITEM=`echo -e $(yum -q list installed postfix)`
EXPECTED_ITEM="NOT INSTALLED"

if [[ ! $FILE ]]
  then
    FILE="could not connect to yum to query package"
fi

if [[ ! $FOUND_ITEM ]]
  then
    FOUND_ITEM="$EXPECTED_ITEM"
fi  
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
