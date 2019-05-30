#!/bin/bash 
FILE="/etc/yum.conf"
FOUND_ITEM=`echo -e $(grep ^clean_requirements_on_remove $FILE)`
if [[ -r $FILE ]]
  then
  case $FOUND_ITEM in 
    clean_requirements_on_remove=1 )
      EXPECTED_ITEM=$FOUND_ITEM
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    ;;
    clean_requirements_on_remove=True )
      EXPECTED_ITEM=$FOUND_ITEM
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    ;;
    clean_requirements_on_remove=yes )
      EXPECTED_ITEM=$FOUND_ITEM
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    ;;
    * )
      EXPECTED_ITEM="clean_requirements_on_remove=yes"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    ;;

  esac
else
  FOUND_ITEM="$FILE does not exist"
  EXPECTED_ITEM="This is a finding."
  NOTES="If not using YUM, verify OS to check what should be used if not YUM."
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
