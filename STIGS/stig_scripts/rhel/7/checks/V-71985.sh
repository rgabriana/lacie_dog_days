#!/bin/bash 
FILE="/usr/lib/systemd/system/autofs.service"
if [[ -e $FILE ]]; then 
  FOUND_ITEM=`systemctl status autofs|grep "Active:"|awk -F ":" '{print $2}' | sed -e 's|^ ||g'`
  EXPECTED_ITEM="inactive (dead)"
  NOTES="If status is found active and not documented with Information System Security Officer as an operational requirement, this is a finding."
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FOUND_ITEM="autofs.service does not exist on this machine."
  EXPECTED_ITEM="autofs.service does not exist on this machine."
  NOTES="The autofs auto-mounting feature does not exist on this machine."
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
