#!/bin/bash 
set -e
# Check to see if AIDE is installed
FILE='aide'
FOUND_ITEM=`yum -q list installed $FILE | awk -F "." 'FNR==2{print $1}'`
EXPECTED_ITEM=$FILE
# Check to see if weekly schedule to perform verification
if [ -z $FOUND_ITEM ]
  then
    CHECK_DAILY=`echo -e $(grep aide /etc/cron.daily/*)`
    CHECK_CUSTOM=`echo -e $(crontab -l | grep aide)`
    for i in "$CHECK_DAILY $CHECK_CUSTOM"
    do
      if [ -n ${i} ]
        then
          FILE=`echo ${i} | awk -F ":" '{print $1}'`
          FOUND_ITEM="${i}"
          EXPECTED_ITEM="This is a manual check"
          NOTES="VERIFY WITH THE SA THE SCHEDULE FOR VERIFICATION CHECK"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        else
          NOTES="AIDE is installed but there are no presence of a cron job running daily or weekly on the system that executes AIDE daily to scan for changes to the system baseline."
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
      fi
    done
else
  EXPECTED_ITEM="AIDE IS NOT INSTALLED"
  NOTES=" If AIDE is not installed, ask the SA how file integrity checks are performed on the system."
  LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
fi
