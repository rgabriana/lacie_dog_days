#!/bin/bash 
# If there is an HBSS with a Device Control Module and a Data Loss Prevention mechanism, this requirement is not applicable."
FILE="/etc/modprobe.d/blacklist.conf"
NOTES="If there is an HBSS with a Device Control Module and a Data Loss Prevention mechanism, this requirement is not applicable."
if [[ -a $FILE ]]; then
FOUND_ITEM=`grep usb-storage $FILE`
EXPECTED_ITEM="blacklist usb-storage"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
else
FOUND_ITEM="FILE DOES NOT EXIST ON THIS SYSTEM."
EXPECTED_ITEM="Create file if intending to utilize line from FIX_TEXT."
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
