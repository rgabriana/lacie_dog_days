#!/bin/bash 
FILE='/etc/security/pwquality.conf'
FOUND_ITEM=`grep -i ^maxrepeat $FILE|awk -F " = " '{print $2}'`
EXPECTED_ITEM='3'
RESULTS=0
NOTES="IF THE TEST RESULT IS NULL, THIS IS A FINDING"
LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" LESS_THAN "$FOUND_ITEM"
