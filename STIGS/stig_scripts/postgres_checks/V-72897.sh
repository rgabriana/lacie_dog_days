#!/bin/bash

for LIST in {dn,dt,ds,dv,df}; do 

  case $LIST in

    dn )

#    IFS=$'\n'
    FILE="List of schemas"
    for FOUND_ITEM in $($db_exec  --tuples-only --no-align -U $db_user -c '\dn \*\.\*'); do
  
      ITEM=`echo $FOUND_ITEM | awk -F "|" '{print $2}'`
      EXPECTED_ITEM=$db_owner
      RESULTS=0

        if [[ $EXPECTED_ITEM == $ITEM ]]; then
          RESULTS=PASS
        elif [[ -z $ITEM ]]; then
          FOUND_ITEM="TEST RESULT IS NULL"
          RESULTS=FAIL
        else
          RESULTS=FAIL
        fi

    RESULT_TABLE
    FILL_RESULTS
    done

    ;;

    dt )

    FILE="List of tables"
    for FOUND_ITEM in $($db_exec  --tuples-only --no-align -U $db_user -c "\dt *.*"); do
  
      ITEM=`echo $FOUND_ITEM | awk -F "|" '{print $4}'` 
      EXPECTED_ITEM=$db_owner
      RESULTS=0

      if [[ $EXPECTED_ITEM == $ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $ITEM ]]; then
        FOUND_ITEM="TEST RESULT IS NULL"
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

    RESULT_TABLE
    FILL_RESULTS

    done

    ;;

    ds )

    FILE="List of sequence"
    for FOUND_ITEM in $($db_exec  --tuples-only --no-align -U $db_user -c "\ds *.*"); do 

      ITEM=`echo $FOUND_ITEM`
      EXPECTED_ITEM=$db_owner
      RESULTS=0

      if [[ $EXPECTED_ITEM == $ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $ITEM ]]; then
        FOUND_ITEM="TEST RESULT IS NULL"
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

    RESULT_TABLE
    FILL_RESULTS
   
    done

    ;;

    dv )

    FILE="List of views"
    for FOUND_ITEM in $($db_exec  --tuples-only --no-align -U $db_user -c "\dv *.*"); do

      ITEM=`echo -e $FOUND_ITEM | awk -F "|" '{print $4}'`
      EXPECTED_ITEM=$db_owner
      RESULTS=0

      if [[ $EXPECTED_ITEM == $ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $ITEM ]]; then
        FOUND_ITEM="TEST RESULT IS NULL"
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

    RESULT_TABLE
    FILL_RESULTS

    done

    ;;

    df )

    FILE="List of functions"
    for FOUND_ITEM in $($db_exec  --tuples-only --no-align -U $db_user -c "\df+ *.*"); do
      ITEM=`echo -e $FOUND_ITEM | awk -F "|" '{print $8}'`
      EXPECTED_ITEM=$db_owner 
      RESULTS=0

      if [[ $EXPECTED_ITEM == $ITEM ]]; then
        RESULTS=PASS
      elif [[ -z $ITEM ]]; then
        RESULTS=FAIL
      else
        RESULTS=FAIL
      fi

    RESULT_TABLE
    FILL_RESULTS
    done

    ;;

    * )

    ;;

  esac

done
