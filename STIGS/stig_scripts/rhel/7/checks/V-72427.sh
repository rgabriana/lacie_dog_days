#!/bin/bash 
FILE=`echo -e "/etc/sssd/sssd.conf" $(find /etc/sssd/conf.d/*.conf)`

shopt -s nocasematch
for FILE_CHK in $FILE 
   do 
     if [ ! -e $FILE_CHK ]
        then
           NOTES=" "
           FOUND_ITEM="CONFIG FILE $FILE_CHK IS NOT A REGULAR FILE"
           EXPECTED_ITEM=$FILE_CHK
           LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
     else         
           FOUND_ITEM=`echo -e $(grep services $FILE_CHK | grep pam | grep -v "^#")` 
           if [ -z $FOUND_ITEM ]
              then
                 NOTES=" "
                 EXPECTED_ITEM="SERVICE PAM IS NOT FOUND IN $FILE_CHK"
                 LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
           else
                 NOTES=" "
                 EXPECTED_ITEM=$FOUND_ITEM
                 LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
           fi
     fi
done
shopt -u nocasematch
