#!/bin/bash 
FILE="/etc/sysctl.conf"
FOUND_ITEM=`sysctl -n kernel.randomize_va_space`
EXPECTED_ITEM="2"  
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
