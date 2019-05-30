#!/bin/bash 
FILE=`$db_exec -U $db_user -c "\d+ ."`
FOUND_ITEM=$db_seclabels
EXPECTED_ITEM="THIS IS A MANUAL CHECK"
RESULTS=0

shopt -s nocasematch

case $db_sec_label in 

  yes )

    if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
      RESULTS=PASS
    elif [[ -z $FOUND_ITEM ]]; then
      FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
      RESULTS=FAIL
    else
      RESULTS=FAIL
    fi

    RESULT_TABLE

  ;;

  no )

    RESULTS=PASS
    EXPECTED_ITEM=$db_seclabels
    
    RESULT_TABLE

  ;;

  *)

  ;;

esac

shopt -u nocasematch
