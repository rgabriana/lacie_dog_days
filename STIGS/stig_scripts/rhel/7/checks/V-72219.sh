#!/bin/bash 
FILE="THIS IS A MANUAL CHECK"
FOUND_ITEM=`firewall-cmd --list-all`
EXPECTED_ITEM=
NOTES="Verify the services allowed by the firewall match the PPSM CLSA. If there are additional ports, protocols, or services that are not in the PPSM CLSA, or there are ports, protocols, or services that are prohibited by the PPSM Category Assurance List (CAL), this is a finding."
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
