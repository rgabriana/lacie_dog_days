#!/bin/bash 
FILE="/etc/sysctl.conf"
NOTES="SYSTEM IGNORES IPv4 ICMP REDIRECT MESSAGES WHEN SETTING IS 0"
EXPECTED_ITEM="0"
FOUND_ITEM=`/sbin/sysctl -a | grep -e ^net.ipv4.conf.default.accept_redirects | awk -F " = " '{print $2}'`
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
