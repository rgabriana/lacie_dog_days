#!/bin/bash 
#IST=`echo -e $(find /etc/ssh -type f -name *.pub)`
old_IFS=$IFS
IFS=$'\n'
for FILE in $(find /etc/ssh -type f -name *.pub)
  do 
    FOUND_ITEM=`stat -c %a $FILE`
    EXPECTED_ITEM=644
    LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM LESS_THAN $FOUND_ITEM
    FILL_RESULTS
  done
IFS=$old_IFS
