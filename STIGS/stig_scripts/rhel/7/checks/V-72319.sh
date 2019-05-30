#!/bin/bash 
FILE=`echo -e "/etc/sysctl.conf" $(find /etc/sysctl.d/)`

for FILE_CHK in $FILE 
   do
      FOUND_ITEM_1=`echo -e $(grep net.ipv6.conf.all.accept_source_route $FILE_CHK | cut -d "=" -f1)`
      FOUND_ITEM_2=`echo -e $(grep net.ipv6.conf.all.accept_source_route $FILE_CHK | cut -d "=" -f2)`
      EXPECTED_ITEM_1="net.ipv6.conf.all.accept_source_route"
      EXPECTED_ITEM_2="0"
      if [[ $FOUND_ITEM_1 == $EXPECTED_ITEM_1 && $FOUND_ITEM_2 == $EXPECTED_ITEM_2 ]]; then
         FOUND_ITEM=$FOUND_ITEM_2
         EXPECTED_ITEM=$EXPECTED_ITEM_2
         LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
         FILL_RESULTS
      elif [[ $FOUND_ITEM_1 != $EXPECTED_ITEM_1 ]]; then
         NOTES="IPv6 IS NOT ENABLED ON THE SYSTEM THEREFORE NOT APPLICABLE"
         FOUND_ITEM=" "
         EXPECTED_ITEM=" "
         LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
         FILL_RESULTS
      elif [[ $FOUND_ITEM_1 == $EXPECTED_ITEM_1 && $FOUND_ITEM_2 != $EXPECTED_ITEM_2 ]]; then
         FOUND_ITEM=$FOUND_ITEM_2
         EXPECTED_ITEM="0"
         LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
         FILL_RESULTS
      fi   
done 

CMMD_CHK=`echo -e $(/sbin/sysctl -a | grep net.ipv6.conf.all.accept_source_route | cut -d "=" -f2 )`
if [ $CMMD_CHK == 0 ] 
   then
      NOTES="OPERATING SYSTEM IMPLEMENTED COMMAND FOR CHECKING FOR IPv6"
      FOUND_ITEM=$CMMD_CHK
      EXPECTED_ITEM="0"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
else
      FOUND_ITEM="OPERATING SYSTEM DID NOT IMPLEMENT COMMAND OR VALUE NOT EQUAL 0"
      EXPECTED_ITEM="0"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
fi 
      
