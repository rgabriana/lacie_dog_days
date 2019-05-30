#!/bin/bash 
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`echo -e "$(grep -i ^PermitEmptyPasswords $FILE)"`
EXPECTED_ITEM="PermitEmptyPasswords no"
RESULTS=0

if [[ $EXPECTED_ITEM == $FOUND_ITEM ]] ; then
	RESULTS=PASS
elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=PASS
else
  	RESULTS=FAIL
fi

RESULT_TABLE
