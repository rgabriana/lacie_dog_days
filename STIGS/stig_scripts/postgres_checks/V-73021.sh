#!/bin/bash 
FILE=$db_config_file

for configs in {shared_preload_libraries,log_connections,log_disconnections,pgaudit}; do
set +e
  case $configs in 

    shared_preload_libraries )

      FOUND_ITEM=`echo $db_shared_preload_libraries|grep pgaudit`
      EXPECTED_ITEM="pgaudit"
      RESULTS=0

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

    log_connections )

      FOUND_ITEM="$db_log_connections"
      EXPECTED_ITEM="on"
      RESULTS=0

      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      FILL_RESULTS
      RESULT_TABLE

      ;;

    log_disconnections )

      FOUND_ITEM="$db_log_disconnects"
      EXPECTED_ITEM="on"
      RESULTS=0

      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      FILL_RESULTS
      RESULT_TABLE

      ;;

    pgaudit )

      FOUND_ITEM="$db_pgaudit_log"
      EXPECTED_ITEM="ddl, role, read, write"
      RESULTS=0

      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      FILL_RESULTS
      RESULT_TABLE

      ;;

  esac
set -e
done
