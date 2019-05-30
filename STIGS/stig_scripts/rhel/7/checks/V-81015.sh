#!/bin/bash 
FILE='/etc/audisp/plugins.d/au-remote.conf'
shopt -s nocasematch

if [ ! -e $FILE ]
  then
    FOUND_ITEM="FILE $FILE IS NOT A REGULAR FILE OR DOES NOT EXIST"
    EXPECTED_ITEM="$FILE"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FOUND_ITEM=`echo -e $(grep -e ^active $FILE | awk -F ' = ' '{print $2}')`
  EXPECTED_ITEM="yes"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi

shopt -u nocasematch
