#!/bin/bash 
FILE="/etc/snmp/snmpd.conf"
# CHECK TO SEE IF FILE EXIST
if [[ -e $FILE ]]; then
  if [[ ! -z `echo -e $(ls -al $FILE)` ]]; then
    if [[ -z `echo -e $(grep public $FILE)` ]]; then
      FOUND_ITEM="FILE $FILE EXISTS WITH NO DEFAULT PUBLIC STRING"
      EXPECTED_ITEM="FILE $FILE EXISTS WITH NO DEFAULT PUBLIC STRING"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    else
      FOUND_ITEM=`echo -e $(grep public $FILE) | grep -o public`
      EXPECTED_ITEM=" "
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
    if [[ -z `echo -e $(grep private $FILE)` ]]; then
      FOUND_ITEM="FILE $FILE EXISTS WITH NO DEFAULT PRIVATE STRING"
      EXPECTED_ITEM="FILE $FILE EXISTS WITH NO DEFAULT PRIVATE STRING"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    else
      FOUND_ITEM=`echo e $(grep private $FILE) | grep -o private`
      EXPECTED_ITEM=" "
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
  fi
else
  NOTES="FILE $FILE DOES NOT EXIST, THIS IS NOT APPLICABLE"
  FOUND_ITEM="$FILE DOES NOT EXIST"
  EXPECTED_ITEM="$FILE DOES NOT EXIST"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
  FILL_RESULTS 
fi
