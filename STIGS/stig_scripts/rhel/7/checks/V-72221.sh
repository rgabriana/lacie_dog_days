#!/bin/bash 
FILE="/etc/ssh/sshd_config"
CIPHERLIST=`echo -e $(grep ^Ciphers $FILE|awk -F " " '{print $2}')`
if [ -z $CIPHERLIST ]
  then
    EXPECTED_ITEM="aes128-ctr,aes192-ctr,aes256-ctr"
    NOTES="The default ciphers are:\n\tchacha20-poly1305@openssh.com,\n\taes128-ctr,aes192-ctr,aes256-ctr,\n\taes128-gcm@openssh.com,aes256-gcm@openssh.com,\n\taes128-cbc,aes192-cbc,aes256-cbc"

    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
else
  IFS=","
  for FOUND_ITEM in $CIPHERLIST
    do
      case $FOUND_ITEM in
        aes128-ctr )
          EXPECTED_ITEM=$FOUND_ITEM
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
        aes192-ctr )
          EXPECTED_ITEM=$FOUND_ITEM
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
        aes256-ctr )
          EXPECTED_ITEM=$FOUND_ITEM
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
        * )
          NOTES="$FOUND_ITEM is not a valid cipher"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
      esac
    done
fi
