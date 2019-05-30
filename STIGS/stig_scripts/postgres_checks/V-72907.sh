#!/bin/bash 
shopt -s nocasematch
FILE=$db_config_file

for l in {log_destination,logging_collector,log_dir,log_filename,log_file_mode,log_truncate_on_rotation,log_rotation_age,log_rotation_size}; do

  case $l in

    log_destination )
      FOUND_ITEM=$db_log_destination
      EXPECTED_ITEM='stderr'
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

    logging_collector )

      FOUND_ITEM=$db_logging_collector
      EXPECTED_ITEM='on'
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

    log_dir )

      FOUND_ITEM=$db_log_dir
      EXPECTED_ITEM='pg_log'
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

    log_filename )

      FOUND_ITEM=$db_log_filename
      EXPECTED_ITEM='postgres-a%.log'
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

      log_file_mode )

      FOUND_ITEM=$db_log_file_mode
      EXPECTED_ITEM='0600'
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

    log_truncate_on_rotation )

      FOUND_ITEM=$db_log_truncate_on_rotation
      EXPECTED_ITEM='on'
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

    log_rotation_age )

      FOUND_ITEM=$db_log_rotation_age
      EXPECTED_ITEM='1d'
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
    log_rotation_size )

      FOUND_ITEM=$db_log_rotation_size
      EXPECTED_ITEM='0'
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

done

shopt -u nocasematch
