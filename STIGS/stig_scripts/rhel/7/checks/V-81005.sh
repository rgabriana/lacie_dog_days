#!/bin/bash

# For systems that are running RHEL 7.2 or newer, this is Not Applicable.
# determine OS flavor

OS=`cat /etc/*-release|grep ^NAME= | awk -F '=' '{print $2}'|sed -e 's|"||g'` 
EXPECTED_ITEM="7.2"
FILE="/boot/grub2/grub.cfg"
UEFI="/sys/firmware/efi"

# Determine OS Version

case $OS in

  'CentOS Linux' )

    FOUND_ITEM=`cat /etc/centos-release | awk -F "release" '{print $2}' | awk -F " " '{print $1}' | awk -F '.' '{print $1"."$2}'|sed -e 's|"||g'`
    COMPARE=`echo "$FOUND_ITEM>$EXPECTED_ITEM" | bc`
    if [ $COMPARE -le 0 ]
      then
        RESULTS="NOT APPLICABLE"
        NOTES="For systems that are running a version of RHEL prior to 7.2, this is Not Applicable."
        RESULT_TABLE

# For systems that uses BIOS, this is Not Applicable.

    elif [ ! -d $UEFI ]
      then
        LIST=`echo -e $(grep "set superusers" $FILE | awk -F "=" '{print $2}') | sed -e 's|"||g'` 
        EXPECTED_ITEM="root"

# test to see if it found the entries

       if [ -n "$LIST" ]
         then
           for FOUND_ITEM in $LIST
             do
               LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
             done
       else

         FOUND_ITEM="TEST RESULT IS NULL"
         RESULTS="FAIL"
         RESULT_TABLE

       fi

    else

      FOUND_ITEM="TEST RESULT IS NULL"
      RESULTS="NOT APPLICABLE"
      NOTES="For systems that use UEFI, this is Not Applicable."
      RESULT_TABLE

    fi
  ;;

  'Red Hat Enterprise Linux Server' )

    FOUND_ITEM=`cat /etc/*-release| grep ^VERSION_ID= | awk -F '=' '{print $2}' | awk -F " " '{print $1}'| sed -e 's|"||g'`
    COMPARE=`echo "$FOUND_ITEM>$EXPECTED_ITEM" | bc`
    if [ $COMPARE -le 0 ]
      then
        RESULTS="NOT APPLICABLE"
        NOTES="For systems that are running a version of RHEL prior to 7.2, this is Not Applicable."
        RESULT_TABLE

# For systems that uses BIOS, this is Not Applicable.

    elif [ -d $UEFI ]
      then
        LIST=`echo -e $(grep "set superusers" $FILE | awk -F "=" '{print $2}') | sed -e 's|"||g'` 
        EXPECTED_ITEM="root"

# added this line because rhel and redhat are synonymous

        if [ $answer == "rhel" ]
          then

          answer="redhat"

        fi

# test to see if it found the entries

        if [ -n "$LIST" ]
          then

            for FOUND_ITEM in $LIST
              do

                LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"

              done

        else
 
         FOUND_ITEM="TEST RESULT IS NULL"
          RESULTS="FAIL"
          RESULT_TABLE

       fi

    else

      FOUND_ITEM="TEST RESULT IS NULL"
      RESULTS="NOT APPLICABLE"
      NOTES="For systems that use UEFI, this is Not Applicable."

    fi

  ;;
  

  * )

    FOUND_ITEM=$OS
    EXPECTED_RESULT="THIS CHECK IS ONLY FOR RHEL"
    RESULTS="NOT APPLICABLE"
    RESULT_TABLE

  ;;

esac
