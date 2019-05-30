#!/bin/bash 
FILE="/etc/audit/auditd.conf"
FOUND_ITEM=`echo -e $(grep "^action_mail_acct =" $FILE)`
EXPECTED_ITEM="action_mail_acct = root"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
