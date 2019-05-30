#!/bin/bash 
FILE='/etc/audisp/plugins.d/au-remote.conf'
RESULTS=0
_TEST_CASE () {
  if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
    RESULTS=PASS
  elif [[ -z $FOUND_ITEM ]]; then
    FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
    RESULTS=FAIL
  else
    RESULTS=FAIL
  fi
}

if [[ -e $FILE ]]
then 
  for i in direction path type
    do
      FOUND_ITEM=`echo -e $(grep -ie ^$i $FILE | awk -F' = ' '{print $2}')`
      case $i in
        direction )
          EXPECTED_ITEM="out"
          _TEST_CASE
          RESULT_TABLE
          FILL_RESULTS
        ;;
        path )
          EXPECTED_ITEM="/sbin/audisp-remote"
          _TEST_CASE
          RESULT_TABLE
          FILL_RESULTS
        ;;
        type )
          EXPECTED_ITEM='always'
          _TEST_CASE
          RESULT_TABLE
          FILL_RESULTS
        ;;
      esac
    done
else 
RESULTS=FAIL
FOUND_ITEM="FILE NOT FOUND"
EXPECTED_ITEM="$FILE"
RESULT_TABLE
fi
