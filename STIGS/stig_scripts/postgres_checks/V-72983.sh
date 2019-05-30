#!/bin/bash

for LOGS in {log_destination,syslog_facility,syslog_ident,logging_collector,log_dir,log_filename,log_file_mode,log_connections,log_disconnects,log_duration,pgaudit_log}; do  

  case $LOGS in

    pgaudit_log )
      set +e
      FILE=$db_config_file
      FOUND_ITEM=`echo $db_shared_preload_libraries|grep pgaudit`
      EXPECTED_ITEM=pgaudit
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE
      FILL_RESULTS

      set -e

    ;;

    log_connections )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_connections
      EXPECTED_ITEM=on
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE
      FILL_RESULTS

    ;;

    log_disconnects )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_disconnects
      EXPECTED_ITEM=on
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE
      FILL_RESULTS

    ;;

    log_duration )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_duration
      EXPECTED_ITEM=on
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE
      FILL_RESULTS

    ;;

    log_destination )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_destination
      EXPECTED_ITEM="stderr or syslog"
      RESULTS=0

      if [[ $FOUND_ITEM == stderr || $FOUND_ITEM == syslog ]];  then
        RESULTS=PASS
        EXPECTED_ITEM=$FOUND_ITEM
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE
      FILL_RESULTS

    ;;

    logging_collector )

      FILE=$db_config_file
      FOUND_ITEM=$db_logging_collector
      EXPECTED_ITEM="on"

      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

      RESULT_TABLE
      FILL_RESULTS    

    ;;

    log_dir )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_dir
      EXPECTED_ITEM="$db_directory/$db_log_dir"
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM && -d $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi
      
      RESULT_TABLE
      FILL_RESULTS
    ;;

    log_filename )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_filename
      EXPECTED_ITEM='postgresql-%a.log'
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi
      
      RESULT_TABLE
      FILL_RESULTS

    ;;

    log_file_mode )

      FILE=$db_config_file
      FOUND_ITEM=$db_log_file_mode
      EXPECTED_ITEM='0600'
      RESULTS=0

      if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]];  then
        FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi
      
      RESULT_TABLE
      FILL_RESULTS

    ;;

    syslog_facility )

      if [[ $db_log_destination == syslog ]];  then

        FILE=$db_config_file
        FOUND_ITEM=$db_syslog_facility
        EXPECTED_ITEM='local0'
        RESULTS=0

          if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
            RESULTS=PASS
          elif [[ -z $FOUND_ITEM ]];  then
            FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
            RESULTS=FAIL
          else
            RESULTS=FAIL
          fi

          RESULT_TABLE
          FILL_RESULTS

      fi

    ;;

    syslog_ident )

      if [[ $db_log_destination == syslog ]];  then

        FILE=$db_config_file
        FOUND_ITEM=$db_syslog_ident
        EXPECTED_ITEM=postgres
        RESULTS=0

          if [[ $FOUND_ITEM == $EXPECTED_ITEM ]];  then
            RESULTS=PASS
         elif [[ -z $FOUND_ITEM ]];  then
            FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
            RESULTS=FAIL
         else
            RESULTS=FAIL
         fi

         RESULT_TABLE
         FILL_RESULTS

      fi

    ;;

    * )

    ;;

  esac

done
