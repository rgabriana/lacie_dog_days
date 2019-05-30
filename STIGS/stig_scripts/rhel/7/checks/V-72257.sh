#!/bin/bash 
old_IFS=$IFS
IFS=$'\n'
for FILE in $(find / -ignore_readdir_race -type f -name '*ssh_host*key')
  do 
    FOUND_ITEM=`stat -c %a $FILE`
    EXPECTED_ITEM=640
    LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM LESS_THAN $FOUND_ITEM
    FILL_RESULTS
  done
IFS=$old_IFS
