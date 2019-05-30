#!/bin/bash 
FILE="/etc/aide.conf"
FOUND_ITEM="THIS IS A MANUAL CHECK"
EXPECTED_ITEM="THIS IS A MANUAL CHECK "
NOTES="If RHEL-07-021350 is a finding, this is automatically a finding too as the system cannot implement FIPS 140-2 approved cryptographic algorithms and hashes."
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
