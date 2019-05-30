#!/bin/bash 
FILE='/etc/fstab'
EXPECTED_ITEM="nosuid"
LIST_NFS=`echo -e $(grep -v ^# $FILE|grep -i nfs)`
old_IFS=$IFS
IFS=$'\n'
if [[ $LIST_NFS ]]
  then
    for NFS in $LIST_NFS
      do
        FOUND_ITEM=`echo -e $(grep -o nosuid $NFS)`
        NOTES="CHECK WITH ISSO TO SEE IF USE OF NFS IMPORTED BINARIES ARE DOCUMENTED"
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
      done

else
  
   FOUND_ITEM=`echo -e "NO NFS ENTRIES FOUND IN THE SYSTEM"`
   RESULTS="NOT APPLICABLE"
   RESULT_TABLE
fi
IFS=$old_IFS
