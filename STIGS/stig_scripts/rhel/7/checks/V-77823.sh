#!/bin/bash 
FILE='/usr/lib/systemd/system/rescue.service'
if [ ! -e $FILE ]
  then
    FOUND_ITEM="FILE $FILE IS NOT A REGULAR FILE OR DOES NOT EXIST"
    EXPECTED_ITEM=$FILE
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
else
    FOUND_ITEM=`echo -e $(grep 'ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"' $FILE)`
    EXPECTED_ITEM='ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"'
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
