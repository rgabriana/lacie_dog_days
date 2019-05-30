#!/bin/bash 
FILE=`echo -e "/etc/sysctl.conf $(find /etc/sysctl.d/)"`

EXPECTED_ITEM="0"
for FILE_CHK in $FILE 
  do
    FOUND_ITEM= `echo -e $(grep net.ipv4.ip_forward $FILE_CHK)`
    LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
    FILL_RESULTS
done
FOUND_ITEM=`/sbin/sysctl -a | grep "net.ipv4.ip_forward" | cut -d "=" -f2`
    LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
    FILL_RESULTS
