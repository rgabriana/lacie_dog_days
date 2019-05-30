#!/bin/bash 
FILE="/etc/yum.conf"
NOTES="If options are missing or commented out, ask the System Administrator how the certificates for patches and other operating system components are verified."
FOUND_ITEM=`echo -e $(grep -e ^gpgcheck $FILE)`
EXPECTED_ITEM="gpgcheck=1"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
