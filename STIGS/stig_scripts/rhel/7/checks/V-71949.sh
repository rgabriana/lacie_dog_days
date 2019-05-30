#!/bin/bash 
shopt -s nocasematch
LIST=`echo -e $(find /etc/sudoers.d -type f)`
#LIST="/etc/sudoer*"
old_IFS=$IFS
IFS=" "
for FILE in $LIST /etc/sudoers; do
FOUND_ITEM=`echo -e $(grep -v '^#' $FILE | grep -i '!authenticate')`
EXPECTED_ITEM="NULL"
RESULTS=0

if [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=PASS
else
  RESULTS=FAIL
fi

RESULT_TABLE
FILL_RESULTS
done
IFS=$old_IFS
shopt -u nocasematch
