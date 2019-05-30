#!/bin/bash 
FILE="/etc/audisp/audisp-remote.conf"
EXPECTED_ITEM="enable_krb5 = yes"
if [[ -e $FILE ]]
  then
    FOUND_ITEM=`echo -e $(grep "^enable_krb5 =" $FILE)`
    NOTES="If the value of the enable_krb5 option is not \"syslog\", \"single\", or \"halt\", or the line is commented out, this is a finding."
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  FOUND_ITEM="FILE NOT FOUND"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
