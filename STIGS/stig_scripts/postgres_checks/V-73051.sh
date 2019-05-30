#!/bin/bash
echo -e "$lmagentafont"
read -p "ARE USERS REQUIRED TO TERMINATE DATABASE SESSIONS AUTOMATICALLY?
" TERMINATE
echo -e "$resetfont"
FILE=
FOUND_ITEM=
EXPECTED_ITEM=
RESULTS=0

shopt -s nocasematch

case $TERMINATE in 

  yes )

    echo -e "$lgreenfont DISA STIG recommends using a script similar to \"no_login.sh\" script. See\
 Supplementary content APPENDIX-A for a bash script for this example."
  
    echo -e "$magentafont"
    read -p "PLEASE ENTER THE FULL PATH OF THE \"no_login.sh\" script:
    " no_login_script
    echo -e "$resetfont"

    if [ -z $no_login_script ]; then

      FOUND_ITEM="TEST RESULT IS NULL"
      FILE=$FOUND_ITEM
      EXPECTED_ITEM=$FOUND_ITEM
      RESULTS="FAIL"

      RESULT_TABLE

    elif [ -f $no_login_script ]; then 

      FILE=$no_login_script
      FOUND_ITEM=$no_login_script
      EXPECTED_ITEM=$no_login_script
      RESULTS="PASS"

      RESULT_TABLE

    fi

  ;;

  no )

    FILE=" " 
    FOUND_ITEM="AUTOMATIC TERMINATION OF SESSIONS IS NOT REQUIRED"
    EXPECTED_ITEM="AUTOMATIC TERMINATION OF SESSIONS IS NOT REQUIRED"
    RESULTS="PASS"          
    RESULT_TABLE

  ;;

  * )

  ;;

esac

