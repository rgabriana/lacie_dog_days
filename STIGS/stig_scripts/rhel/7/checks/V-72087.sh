#!/bin/bash 
FILE="/etc/audisp/audisp-remote.conf"
EXPECTED_ITEM="disk_full_action = SUSPEND"
if [[ -e $FILE ]]
  then
    FOUND_ITEM=`echo -e $(grep "^disk_full_action =" $FILE)`
    NOTES="If the value of the disk_full_action option is not \"syslog\", \"single\", or \"halt\", or the line is commented out, this is a finding."
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FOUND_ITEM="FILE NOT FOUND"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
