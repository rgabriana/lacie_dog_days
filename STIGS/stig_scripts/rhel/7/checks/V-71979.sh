#!/bin/bash 
FILE="/etc/yum.conf"
NOTES="If options are missing or commented out, ask the System Administrator how the signatures of local packages and other operating system components are verified."
FOUND_ITEM=`echo -e $(grep ^localpkg_gpgcheck $FILE)`
EXPECTED_ITEM="localpkg_gpgcheck=1"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
