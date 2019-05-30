#!/bin/bash 
FILE="/etc/selinux/config"
FOUND_ITEM=`getenforce`
EXPECTED_ITEM="Enforcing"
NOTES="SELinux should be active and report Enforcing when checked. If an HBSS or HIPS is active on the system, this is Not Applicable."
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
