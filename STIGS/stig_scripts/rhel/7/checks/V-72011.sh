#!/bin/bash 
FILE="/etc/passwd"
old_IFS=$IFS
IFS=$'\n'
for i in `awk -F: '$3 >= 1000 && $3 < 65534' /etc/passwd`
  do

    UNAME=`echo -e $i | awk -F: '{print $1}'`
    USERID=`echo -e $i | awk -F: '{print $3}'`
    GROUPID=`echo -e $i | awk -F: '{print $4}'`
    _HOME=`echo -e $i | awk -F: '{print $6}'`
    _SHELL=`echo -e $i | awk -F: '{print $7}'`

    EXPECTED_ITEM="$_HOME"
    FOUND_ITEM=`test -d $_HOME && echo $_HOME`
    NOTES="username: $UNAME"
    LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
    FILL_RESULTS
  done
IFS=$old_IFS
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
