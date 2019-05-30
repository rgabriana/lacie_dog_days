#!/bin/bash 
FILE="/etc/selinux/config"
FOUND_ITEM=`grep -e "^SELINUXTYPE=" $FILE| sed -e 's| *$||g'`
EXPECTED_ITEM="SELINUXTYPE=targeted"
NOTES="If an HBSS or HIPS is active on the system, this check is Not Applicable."
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
