#!/bin/bash 
# Check to see if GNOME is installed 
GNOME_DESKTOP=`yum -q list installed gnome-desktop* | awk -F " " 'FNR>=2 {print $1}'|awk -F " " '{print $1}'`
if [ -z $GNOME_DESKTOP ]
 then
   for FILE in "screen.x86_64 tmux.x86_64"
     do
       FOUND_ITEM=`yum -q list installed "$FILE" | awk -F " " 'FNR>=2 {print $1}'`
       EXPECTED_ITEM=$fILE
       RESULTS=0
       LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
       FILL_RESULTS
     done
else
   FILE="$GNOME_DESKTOP"
   FOUND_ITEM="$FILE package found"
   EXPECTED_ITEM="$FOUND_ITEM"
   NOTES="THIS CHECK IS NOT APPLICABLE"
   RESULTS="NOT APPLICABLE"
   RESULT_TABLE
#   LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
