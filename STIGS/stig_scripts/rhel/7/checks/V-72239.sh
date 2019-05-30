#!/bin/bash

# For systems that are running RHEL 7.2 or newer, this is Not Applicable.
# determine OS flavor

OS=`cat /etc/*-release|grep ^NAME= | awk -F '=' '{print $2}'|sed -e 's|"||g'` 
EXPECTED_ITEM="7.4"
FILE="/etc/ssh/sshd_config"

# Determine OS Version

case $OS in

  'CentOS Linux' )

    FOUND_ITEM=`cat /etc/centos-release | awk -F "release" '{print $2}' | awk -F " " '{print $1}' | awk -F '.' '{print $1"."$2}'|sed -e 's|"||g'`
    COMPARE=`echo "$EXPECTED_ITEM>$FOUND_ITEM" | bc`
    if [ $COMPARE -le 0 ]
      then
        RESULTS="NOT APPLICABLE"
        NOTES="If the release is 7.4 or newer this requirement is Not Applicable."
        RESULT_TABLE
    else
      EXPECTED_ITEM="RhostsRSAAuthentication no"
      FOUND_ITEM=`echo -e $(grep -i ^RhostsRSAAuthentication $FILE)`
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"

    fi
  ;;

  'Red Hat Enterprise Linux Server' )

    FOUND_ITEM=`cat /etc/*-release| grep ^VERSION_ID= | awk -F '=' '{print $2}' | awk -F " " '{print $1}'| sed -e 's|"||g'`
    COMPARE=`echo "$FOUND_ITEM>$EXPECTED_ITEM" | bc`
    if [ $COMPARE -le 0 ]
      then
        RESULTS="NOT APPLICABLE"
        NOTES="If the release is 7.4 or newer this requirement is Not Applicable."
        RESULT_TABLE
    else
      EXPECTED_ITEM="RhostsRSAAuthentication no"
      FOUND_ITEM=`echo -e $(grep -i ^RhostsRSAAuthentication)`
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    fi

  ;;
  

  * )

    FOUND_ITEM=$OS
    EXPECTED_RESULT="THIS CHECK IS ONLY FOR RHEL"
    RESULTS="NOT APPLICABLE"
    RESULT_TABLE

  ;;

esac
