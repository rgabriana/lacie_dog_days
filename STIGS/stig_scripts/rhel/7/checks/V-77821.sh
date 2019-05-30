#!/bin/bash 
old_IFS=$IFS
IFS=$'\n'
FOUND_ITEM=`echo -e $(grep -ir "blacklist dccp" /etc/modprobe.d/)`

if [ -z "$FOUND_ITEM" ]
  then
    RESULTS="FAIL"
    NOTES="The command does not return any output, or the line is commented out."
    RESULT_TABLE
else
  for i in $FOUND_ITEM
    do
      EXPECTED_ITEM=`echo -e $i | awk -F: '{print $2}'`
      FILE=`echo -e $i | awk -F: '{print $1}'`
      FOUND_ITEM=$i
      RESULTS="PASS"
      RESULT_TABLE
      FILL_RESULTS
    done
fi
IFS=$old_IFS
