#!/bin/bash
FILE="/etc/audit/audit.rules"
for j in uid gid
  do
    FOUND_ITEM=`echo -e $(grep -iw "execve .*set$j" $FILE)`
    EXPECTED_ITEM="-a always,exit -F arch=b32 -S execve -C $j!=e$j -F e$j=0 -k set$j -a always,exit -F arch=b64 -S execve -C $j!=e$j -F e$j=0 -k set$j"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
  done
