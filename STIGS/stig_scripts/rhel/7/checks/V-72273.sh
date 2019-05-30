#!/bin/bash 
FILE=`yum -q list installed firewalld* | awk -F " " 'FNR>=2 {print $1}'`
FOUND_ITEM=`echo -e $(systemctl status firewalld | grep -e "active.*running")`
if [[ -z $FOUND_ITEM ]]
  then
    EXPECTED_ITEM="the operating system's application firewall is enabled."
    RESULTS=FAIL 
    RESULT_TABLE
else
  EXPECTED_ITEM=$FOUND_ITEM
  RESULTS=PASS
  RESULT_TABLE
fi
# LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
