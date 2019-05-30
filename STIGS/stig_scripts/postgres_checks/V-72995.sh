#!/bin/bash
case $db_encrypt in

  yes )

    FILE=$db_config_file
    FOUND_ITEM=$db_crypto
    EXPECTED_ITEM=pgcrypto
    RESULTS=0

      if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $FOUND_ITEM ]]; then
        FOUND_ITEM="TEST RESULT IS NULL"
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

  ;;

  no )

  FILE=$db_config_file
  FOUND_ITEM="N/A"
  EXPECTED_ITEM="Encryption of data in the database is not required. This is not a finding."
  RESULTS="PASS"

  ;;

esac

RESULT_TABLE
