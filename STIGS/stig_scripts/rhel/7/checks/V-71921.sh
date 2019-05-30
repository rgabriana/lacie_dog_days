#!/bin/bash 
FILE="/etc/login.defs"
FOUND_ITEM=`grep '^ENCRYPT_METHOD' /etc/login.defs | awk -F ' ' '{print $2}'`
EXPECTED_ITEM="SHA512"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
