#!/bin/bash 
FILE="/etc/ssh/sshd_config"
IFS=$'\n'
FOUND_ITEM=`grep -i permituserenvironment $FILE`
EXPECTED_ITEM="PermitUserEnvironment no"
LOGIC_TEST ${EXPECTED_ITEM} ${FOUND_ITEM}
