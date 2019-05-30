#!/bin/bash 
FILE="/etc/pam.d/postlogin"
FOUND_ITEM=`echo -e $(grep -i pam_lastlog.*showfailed $FILE)`
FOUND_ITEM1=`echo -e $(grep -i pam_lastlog.*silent $FILE)`
if [[ -n $FOUND_ITEM && -z $FOUND_ITEM1 ]]
  then
    EXPECTED_ITEM="$FOUND_ITEM"
    RESULTS=PASS
    RESULT_TABLE
else
  EXPECTED_ITEM="session     [default=1]   pam_lastlog.so nowtmp showfailed"
  NOTES="If pam_lastlog is missing from /etc/pam.d/postlogin file, or the silent option is present, this is a finding."
  RESULTS=FAIL
  RESULT_TABLE
fi
# LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
