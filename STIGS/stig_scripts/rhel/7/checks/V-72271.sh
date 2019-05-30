#!/bin/bash 
FILE="/etc/sysctl.conf"
FOUND_ITEM=`sysctl -n net.ipv4.tcp_invalid_ratelimit`
EXPECTED_ITEM="500"
EXPECTED_ITEM1="1000"

if [[ $FOUND_ITEM -ge 500 || $FOUND_ITEM -le 1000 ]]
  then
    RESULTS=PASS
    RESULT_TABLE
else
  RESULTS=FAIL
  RESULT_TABLE
fi
