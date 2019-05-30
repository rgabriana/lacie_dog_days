#!/bin/bash 
FILE="/etc/pam_pkcsll/pam_pkcsll.conf"

shopt -s nocasematch
if [ ! -e $FILE ]
  then
   NOTES=" "
   FOUND_ITEM="CONFIG FILE $FILE IS NOT A REGULAR FILE"
   EXPECTED_ITEM=$FILE
   LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
   CHK_ITEM_ALL=`echo -e $(grep cert_policy $FILE | grep -v "^#") | sed 's/signature;/signature;\n/g'`
   CHK_OCSP_ON=`echo -e $(grep cert_policy $FILE | grep -v "^#") | grep ocsp_on | sed 's/ocsp_on, signature;/ocsp_on, signature;\n/g'`
   LINE_TOTAL_ALL=`echo -n "$CHK_ITEM_ALL" | grep -c '^'`
   LINE_TOTAL_OCSP_ON=`echo -n "$CHK_OCSP_ON" | grep -c '^'`
   if [ $LINE_TOTAL_ALL == $LINE_TOTAL_OCSP_ON ]
    then
       NOTES=" "
       EXPECTED_ITEM="OCSP_ON"
       FOUND_ITEM="OCSP_ON"
       LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
   else
       NOTES=" "
       EXPECTED_ITEM="OCSP_ON"
       FOUND_ITEM="NOT ALL CERT POLICY CONTAINS OCSP_ON"
       LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
   fi
fi
shopt -u nocasematch
