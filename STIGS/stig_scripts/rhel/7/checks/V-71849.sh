#!/bin/bash 

# FUNCTION BEGINS

#_EXPECTED_MODE () {
#  pkg=`rpm -q --whatprovides $1`
#  rpm -qlv $pkg|grep "$1"|awk -F ' ' '{print $1}'
#
#}

# FUNCTION ENDS
# Check the default file permissions, ownership, and group membership of system files and commands
_FILE_LIST () {
  for i in `rpm -Va | grep '^.M' | cut -d " " -f4,5|sed -e 's| ||g'`
    do
      for j in `rpm -qf "$i"`
       do
        rpm -ql --dump "$j"| cut -d " " -f 1,5,6,7  
       done
     done
}
old_IFS=$IFS
IFS=$'\n'
for _ITEMS_ in $(_FILE_LIST)
  do
    FILE=`echo -e $_ITEMS_ | awk -F " " '{print $1}'`
    if [[ -f $FILE ]]
      then
	FOUND_ITEM=`stat -c %a $FILE`
        EXPECTED_ITEM=`echo -e $_ITEMS_ | awk -F " " '{print $2}'| cut -c 5-`
        LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" less_than "$FOUND_ITEM"
        FILL_RESULTS
    elif [[ -d $FILE ]]
      then
	FOUND_ITEM=`stat -c %a $FILE`
        EXPECTED_ITEM=`echo -e $_ITEMS_ | awk -F " " '{print $2}'| cut -c 4-`
        LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" less_than "$FOUND_ITEM"
        FILL_RESULTS
    elif [[ -L $FILE ]]
      then
        FOUND_ITEM=`stat -c %a $FILE`
        EXPECTED_ITEM=`echo -e $_ITEMS_ | awk -F " " '{print $2}'| cut -c 5-`
        LOGIC_TEST_PLUS_MINUS "$EXPECTED_ITEM" less_than "$FOUND_ITEM"
        FILL_RESULTS
    else
      FOUND_ITEM="No such file or directory"
      EXPECTED_ITEM=`echo -e $_ITEMS_ | awk -F " " '{print $2}'| cut -c 5-`
      NOTES="$FILE was not found in the system but found in the RPM"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
  done
IFS=$old_IFS
