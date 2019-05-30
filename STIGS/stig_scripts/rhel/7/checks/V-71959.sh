#!/bin/bash 
IFS=$'\n'
FILE="/etc/ssh/sshd_config"
FOUND_ITEM=`grep -i hostbasedauthentication $FILE`
EXPECTED_ITEM="HostbasedAuthentication no"
LOGIC_TEST ${EXPECTED_ITEM} ${FOUND_ITEM}
