#!/bin/bash 
LIST=`echo -e $(find / -type f -name grub.cfg)`
for FILE in $LIST
  do 
    FOUND_ITEM=`echo -e $(grep "set root" $FILE)`
    EXPECTED_ITEM="THIS IS A MANUAL CHECK"
    NOTES="Verify that EACH boot file found $FOUND_ITEM is documented with the ISSO."
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
  done
