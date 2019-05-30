#!/bin/bash 
# Gather a list of users with semanage
OLD_IFS=$IFS
IFS=$'\n'
SE_LIST_USERS=`semanage login -ln`

for FILE in $SE_LIST_USERS
  do 
    SE_LOGIN_NAME=`echo -e $FILE | awk -F " " '{print $1}'`
    SE_SELinux_User=`echo -e $FILE | awk -F " " '{print $2}'`
    SE_MLS_MCS_Range=`echo -e $FILE | awk -F " " '{print $3}'`
    SE_SERVICE=`echo -e $FILE | awk -F " " '{print $4}'`
    FOUND_ITEM="$SE_SELinux_User"
    EXPECTED_ITEM="user_u"
# Exclude the users "root" or "system_u" as we still don't know what they are suppose to be.
    if [[ ! $SE_LOGIN_NAME == "root"  &&  ! $SE_LOGIN_NAME == "system_u" ]]
      then
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
    fi
  done
