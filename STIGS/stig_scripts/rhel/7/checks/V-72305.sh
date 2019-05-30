#!/bin/bash 
FILE="tftp-server.x86_64"
FOUND_ITEM=`echo -e $(yum -q list installed $FILE)`
EXPECTED_ITEM=""

if [[ $FOUND_ITEM ]]
  then
    FOUND_ITEM=`echo -e $(grep "^server_args" /etc/xinet.d/tftp)`
    EXPECTED_ITEM="server_args = -s /"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
  else 
    FOUND_ITEM="FILE NOT FOUND"
    EXPECTED_ITEM=" "
    RESULTS="NOT APPLICABLE"
    NOTES="If a TFTP server is not installed, this is Not Applicable."
    RESULT_TABLE
fi
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
