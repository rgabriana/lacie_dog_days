#!/bin/bash 
FILE="No File Associated"
FOUND_ITEM=`rpm -qa | grep xorg | grep server`
EXPECTED_ITEM="The Red Hat Enterprise Linux operating system must not have an X Windows display manager installed unless approved"
NOTES="If the use of X Windows on the system is not documented with the Information System Security Officer (ISSO), this is a finding."
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
