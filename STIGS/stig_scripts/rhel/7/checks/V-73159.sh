#!/bin/bash 
FOUND_ITEM=`echo -e $(cat /etc/pam.d/system-auth | grep pam_pwquality) | sed -n 's/.*\(retry=[0-9]*\).*/\1/p' | cut -c "7"`

case $FOUND_ITEM in 

   "1")        EXPECTED_ITEM="1"
               LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
               ;;
   "2")        EXPECTED_ITEM="2"
               LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
               ;;
   "3")        EXPECTED_ITEM="3"
               LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
               ;;
     *)        EXPECTED_ITEM="1, 2, or 3"
               LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
               ;;
esac
