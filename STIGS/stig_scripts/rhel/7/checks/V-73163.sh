#!/bin/bash 
shopt -s nocasematch
FILE='/etc/audisp/audisp-remote.conf'
if [[ ! -e $FILE ]]; then 
      NOTES=" "
      EXPECTED_ITEM=$FILE
      FOUND_ITEM=`echo -e 'TEST RESULT IS NULL'`
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"      
elif [[ ! -z `echo -e $(grep -e ^network_failure_action $FILE` ]]; then
      FOUND_ITEM=`echo -e $(grep -e ^network_failure_action $FILE | cut -d "=" -f2)`
      case $FOUND_ITEM in
  	 "syslog")  
                     NOTES=" "
                     EXPECTED_ITEM="syslog"
                     LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
                     ;;
  	 "single")
                     NOTES=" "
                     EXPECTED_ITEM="single"
                     LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
                     ;;
  	   "halt")
                     NOTES=" "
                     EXPECTED_ITEM="halt"
                     LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
                     ;;
       	        *)  
                     NOTES=" "
                     EXPECTED_ITEM="syslog, single, or halt"
                     LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
                     ;;
      esac
fi
shopt -u nocasematch
