#!/bin/bash 
FILE=$db_config_file

for configs in {db_log_connections,db_log_disconnects,db_log_line_prefix}; do

  case $configs in

    db_log_connections )

      FOUND_ITEM=$db_log_connections
      EXPECTED_ITEM='on'
      RESULTS=0

      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM="TEST RESULT IS NULL"
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE

    ;;

    db_log_disconnects )

      FOUND_ITEM=$db_log_disconnects
      EXPECTED_ITEM='on'
      RESULTS=0

      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM="TEST RESULT IS NULL"
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      FILL_RESULTS
      RESULT_TABLE

    ;;

    db_log_line_prefix )

      FOUND_ITEM=$db_log_line_prefix
      EXPECTED_ITEM='%m %u %d %p %r %a'
      RESULTS=0

      for LIST in $FOUND_ITEM; do

        if [[  $EXPECTED_ITEM =~ $LIST ]]; then
          RESULTS=PASS
        elif [[ -z $FOUND_ITEM ]]; then
          FOUND_ITEM="TEST RESULT IS NULL"
          RESULTS=FAIL
        else
          RESULTS=FAIL
        fi

        FILL_RESULTS
        RESULT_TABLE

      done

    ;;

  esac

done
