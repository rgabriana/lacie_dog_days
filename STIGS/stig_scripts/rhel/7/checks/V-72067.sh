#!/bin/bash 
# Check to see if the "dracut-fips" package is installed
FILE="dracut-fips.x86_64"
FOUND_ITEM=`yum -q list installed dracut-fips| awk 'FNR==2{print $1}'`

if [ $FOUND_ITEM ]
  then
    EXPECTED_ITEM="$FOUND_ITEM"
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
else
  EXPECTED_ITEM="$FILE IS NOT INSTALLED"
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
  FILL_RESULTS
fi

# Check to see if FIPS is enabled from GRUB2
FILE='/boot/grub2/grub.cfg'
CHECK_ITEM=`echo -e $(grep fips $FILE|awk '{for(i=1;i<=NF;i++){if ($i ~ /fips/){print $i}}}')`
EXPECTED_ITEM=1

if [ $CHECK_ITEM ]
then
  for list in $CHECK_ITEM
    do
      FOUND_ITEM=`awk -F '=' '{print $2}'`
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    done
else
  FOUND_ITEM=$CHECK_ITEM
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
  FILL_RESULTS
fi

FILE='/proc/sys/crypto/fips_enabled'
FOUND_ITEM=`echo -e $(cat $FILE)`
EXPECTED_ITEM=1

LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
