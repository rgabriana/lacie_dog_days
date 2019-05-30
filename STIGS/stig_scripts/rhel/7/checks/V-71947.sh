#!/bin/bash 
shopt -s nocasematch
LIST=`find /etc/sudoers.d -type f`
#LIST="/etc/sudoer*"
for FILE in $LIST /etc/sudoers; do
FOUND_ITEM=`echo -e $(grep -v '^#' $FILE| grep -io nopasswd)`
EXPECTED_ITEM="NOPASSWD"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
  FOUND_ITEM=`echo -e $(grep -v '^#' $FILE| grep -i nopasswd)`
  RESULTS=FAIL
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=PASS
else
  RESULTS=PASS
fi

RESULT_TABLE
FILL_RESULTS
done
shopt -u nocasematch
