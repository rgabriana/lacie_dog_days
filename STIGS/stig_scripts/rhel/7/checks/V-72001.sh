#!/bin/bash 
FILE="/etc/passwd"
FOUND_ITEM=`more $FILE`
EXPECTED_ITEM="VERIFY ALL ACCOUNTS ARE AUTHORIZED ACCOUNTS."
NOTES="THIS IS A MANUAL CHECK."
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
