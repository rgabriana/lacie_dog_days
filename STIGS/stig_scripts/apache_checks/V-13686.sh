#!/bin/bash 
OLD_IFS="$IFS"
IFS=$'\n'

UPLOAD_QUESTION () {

  echo -e "$greenfont"
  read -p "DOES THE WEBSERVER ALLOW USERS TO UPLOAD FILES INTO THE WEBSERVER?
  " UPLOAD
  echo -e "$resetfont"

}

CONFIG_CHECK () {

  UPLOAD_QUESTION

  case $UPLOAD in 

    yes )

      for i in $A2_conf; do 
        set +e
        for x in {VirtualHost,Directory,Location}; do

          IFS=$'\n'
          APACHE_CONFIG_PARSE ${i} ${x}
          IFS=$OLD_IFS
  
          FILE=${i}
          EXPECTED_ITEM="on"
          FOUND_ITEM=`cat $FILE | grep -i sslengine\ on | awk -F " " '{print $2}'`
          RESULTS=0
  
          if [[ $EXPECTED_ITEM == $FOUND_ITEM ]]; then
            RESULTS=PASS
          elif [[ -z $FOUND_ITEM ]]; then
            FOUND_ITEM=`echo -e "TEST RESULT IS NULL"`
            RESULTS=FAIL
          else
            RESULTS=FAIL
          fi

          RESULT_TABLE
          FILL_RESULTS
          set -e
        done
      done

    ;;

    no )

      FILE="THIS IS A MANUAL CHECK"
      EXPECTED_ITEM=
      FOUND_ITEM="THIS IS A MANUAL CHECK"
      RESULTS=FAIL
      RESULT_TABLE
  
    ;;
  
    * )

      echo -e "$yellowfont PLEASE ENTER $redfont YES $yellowfont OR $redfont NO $resetfont"
      CONFIG_CHECK

    ;;
  esac

}

CONFIG_CHECK  

    
    
