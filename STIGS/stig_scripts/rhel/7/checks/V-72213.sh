#!/bin/bash 
FILE="THIS IS A MANUAL CHECK"
FOUND_ITEM="Consult with the SA to determine what ANTI-VIRUS software is installed"
EXPECTED_ITEM="INSTALL AN ANTI-VIRUS Software."
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
