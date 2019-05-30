#!/bin/bash 

FILE="/etc/pam.d/password-auth"
FOUND_ITEM=`grep auth.*required.*pam_faillock $FILE | awk -F " " '$NF ~ "fail_interval" {print $NF}' | awk -F '=' '{print $2}'`
EXPECTED_ITEM="900"
RESULTS=0
LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" greater_than "$FOUND_ITEM"
