#!/bin/bash 
FILE=`find /etc/dconf/db/local.d/locks/ -maxdepth 1 -type f`

for files in $FILE; do 

	set +e
	FOUND_ITEM=`grep idle-delay $files`
	EXPECTED_ITEM="/org/gnome/desktop/screensaver/idle-delay"
	RESULTS=0
	set -e
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

done
