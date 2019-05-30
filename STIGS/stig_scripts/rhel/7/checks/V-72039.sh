#!/bin/bash 
FILE=
FOUND_ITEM=`find /dev -context *:device_t:* \( -type c -o -type b \) -printf "%p %Z "`
FOUND_ITEM2=`find /dev -context *:unlabeled_t:* \( -type c -o -type b \) -printf "%p %Z "`
if [[ -z $FOUND_ITEM && -z $FOUND_ITEM2 ]]
  then
    FILE="Test result is NULL"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  for FILE in $FOUND_ITEM $FOUND_ITEM2
    do
      EXPECTED_ITEM=""
      NOTES="Note: There are device files, such as \"/dev/vmci\", that are used when the operating system is a host virtual machine. They will not be owned by a user on the system and require the \"device_t\" label to operate. These device files are not a finding."
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    done
fi
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
