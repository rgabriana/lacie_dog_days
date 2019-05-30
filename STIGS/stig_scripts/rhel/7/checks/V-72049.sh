#!/bin/bash 
FILE="/etc/passwd"
# find all interactive users
USER_LIST=`awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd`
# for every interactive users,  make a list of possible init files
for USER in $USER_LIST
  do
    FILE_LIST=`find -H /home/$USER/ -maxdepth 1 -type f -name \.\*`
# for every init files search for the umask entry
    for ENTRY_LIST in $FILE_LIST
      do
        FILE=$ENTRY_LIST
        ENTRIES=`echo -e $(sed 's|^[ \t]*||g' $FILE | grep -v ^# | grep -i ^umask | awk -F " " '{print $2}')|sort -u`
# ignore blank results bacause there's a global init in one of the init files
        if [[ -n $ENTRIES ]]
          then
# Loop through every iteration of the found umask entries
            for FOUND_ITEM in $ENTRIES
              do
                EXPECTED_ITEM=077
                LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
                FILL_RESULTS
              done
        fi
     done
   done
#Now process the global init files
GLOBAL_INIT="/etc/bashrc /etc/profile"
for FILE in $GLOBAL_INIT
  do 
    ENTRY_LIST=`sed 's|^[ \t]*||g' $FILE | grep -v ^# | grep -i ^umask | awk -F " " '{print $2}'`
    for FOUND_ITEM in $ENTRY_LIST
      do
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
      done
  done
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
