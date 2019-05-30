#!/bin/bash 

LIST=$A2_main_conf
OLD_IFS=$IFS

for i in $LIST; do
  set +e
  IFS=$'\n'
# Remove comments and leading whitespaces
  FOUND_ITEM=`grep -v "^#\|^[[:blank:]].*#" ${i} | grep -i LogFormat`

  for a in $FOUND_ITEM; do 
    FILE=$i
    FOUND_ITEM=`echo -e "$a" | sed -e 's|LogFormat||g' | tr -d [[:blank:]]`
    EXPECTED_ITEM='%a%A%h%H%l%m%s%t%u%U%{Referer}icombined' 
    RESULTS=0

    if [[ -z $(echo -e $EXPECTED_ITEM |tr -d ${FOUND_ITEM}) ]]; then
      RESULTS=PASS
    else
      RESULTS=FAIL
    fi

    RESULT_TABLE
    FILL_RESULTS
  done
  set -e
done
