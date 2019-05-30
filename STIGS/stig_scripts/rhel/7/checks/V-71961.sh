#!/bin/bash

OS=`cat /etc/*-release|grep ^NAME= | awk -F '=' '{print $2}'|sed -e 's|"||g'` 
EXPECTED_ITEM="7.2"

case $OS in

# For systems that are running RHEL 7.2 or newer, this is Not Applicable.
  'Red Hat Enterprise Linux Server' )
    FOUND_ITEM=`cat /etc/*-release| grep ^VERSION_ID= | awk -F '=' '{print $2}' | awk -F " " '{print $1}'| sed -e 's|"||g'`
    COMPARE=`echo "$FOUND_ITEM>$EXPECTED_ITEM" | bc`
    if [ $COMPARE -le 0 ]
      then
# For systems that use UEFI, this is Not Applicable.
        FOUND_ITEM="/sys/firmware/efi"
        if [ ! -d $FOUND_ITEM ]
          then
            FILE="/boot/grub2/grub.cfg"
            FOUND_ITEM=`echo -e $(grep password_pbkdf2 $FILE | awk -F " " '{print $3}')`
# Check to see if the password is set.
            if [ $FOUND_ITEM ]
              then
                EXPECTED_ITEM="$FOUND_ITEM"
                NOTES="verify that the password set is in the correct format"
                LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
            else
                EXPECTED_ITEM="NOT NULL"
                LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
            fi
        else
          EXPECTED_ITEM="UEFI FOUND ON THE SYSTEM, THIS CHECK IS NOT APPLICABLE"
          RESULTS="NOT APPLICABLE"
          RESULT_TABLE
        fi
    else
       RESULTS="NOT APPLICABLE"
       NOTES="THIS CHECK ONLY APPLIES TO RHEL 7.2 AND OLDER"
       RESULT_TABLE
    fi
  ;;
  
# For systems that are running RHEL 7.2 or newer, this is Not Applicable.
  'CentOS Linux' )
    FOUND_ITEM=`cat /etc/centos-release | awk -F "release" '{print $2}' | awk -F " " '{print $1}' | awk -F '.' '{print $1"."$2}'|sed -e 's|"||g'`
    COMPARE=`echo "$FOUND_ITEM>$EXPECTED_ITEM" | bc`
    if [ $COMPARE -le 0 ]
      then
# For systems that use UEFI, this is Not Applicable.
        FOUND_ITEM="/sys/firmware/efi"
        if [ ! -d $FOUND_ITEM ]
          then
            FILE="/boot/grub2/grub.cfg"
            FOUND_ITEM=`echo -e $(grep password_pbkdf2 $FILE | awk -F " " '{print $3}')`
# Check to see if the password is set.
            if [ $FOUND_ITEM ]
              then
                EXPECTED_ITEM="$FOUND_ITEM"
                NOTES="verify that the password set is in the correct format"
                LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
            else
                EXPECTED_ITEM="NOT NULL"
                LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
            fi
        else
           EXPECTED_ITEM="UEFI FOUND ON THE SYSTEM, THIS CHECK IS NOT APPLICABLE"
           RESULTS="NOT APPLICABLE"
           RESULT_TABLE
        fi
    else
       RESULTS="NOT APPLICABLE"
       NOTES="THIS CHECK ONLY APPLIES TO RHEL 7.2 AND OLDER"
       RESULT_TABLE
       
    fi
  ;;

  * )
    FOUND_ITEM=$OS
    EXPECTED_RESULT="THIS CHECK IS ONLY FOR RHEL"
    RESULTS="NOT APPLICABLE"
    RESULT_TABLE
    
  ;;

esac
