#!/bin/bash 
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`echo -e $(grep ^PrintLastLog $FILE)`
EXPECTED_ITEM="PrintLastLog yes"
NOTES="to provide users with feedback on when account accesses last occurred by setting the required configuration options in \"/etc/pam.d/sshd\" or in the \"sshd_config\".  \"/etc/ssh/sshd_config\" will be used in this test"
if [[ -z $FOUND_ITEM ]]
  then
    FILE="/etc/pam.d/sshd"
    FOUND_ITEM=`echo -e $(grep ^session.*postlogin $FILE)`
    EXPECTED_ITEM="session include postlogin"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
