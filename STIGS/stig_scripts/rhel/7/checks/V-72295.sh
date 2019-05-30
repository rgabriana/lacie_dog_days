#!/bin/bash
# Create a list of network interfaces
NIC_LIST=`ip -a -h -d link| grep -i promiscuity`
old_IFS=$IFS
IFS=$'\n'
for i in $NIC_LIST
  do
    if [ `echo -e $i | awk -F " " '{print $1}'` != "link/loopback" ]
      then
        MAC=`echo -e $i | awk -F " " '{print $2}'`
        FILE=`echo -e $(grep -ir $MAC /etc/sysconfig/network-scripts | awk -F ":" '{print $1}')`
        FOUND_ITEM=`echo -e $i | grep -i promiscuity | awk -F " " '{print $6}'`
        EXPECTED_ITEM=0
        NOTES="If network interfaces are found on the system in promiscuous mode and their use has not been approved by the ISSO and documented, this is a finding."
        [ -z $FILE ] && NOTES=`echo -e "$NOTES \n\n No config found for $MAC"`
        LOGIC_TEST_PLUS_MINUS $EXPECTED_ITEM LESS_THAN $FOUND_ITEM
        FILL_RESULTS
      fi
  done
IFS=$old_IFS
