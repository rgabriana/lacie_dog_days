#!/bin/bash 
# CHECK FOR NFS MOUNTED FILESYSTEMS AND ITS SECURITY FLAVOR
EXPECTED_ITEM="sec=krb5:krb5i:krb5p"
FILE="/etc/fstab"
MOUNTED_FS=`nfsstat -c -m -l | grep -e ".*from.*"|awk -F" " '{print $1}'`
FSTAB_LIST=`echo -e $(grep -v ^# $FILE | grep "nfs" | awk -F " " '{print $2}')`
FSTAB_CHECK () {

  FOUND_ITEM=`echo -e $(grep "$1" $FILE | awk -F" " '{print $4}')`

}

if [[ $MOUNTED_FS ]]
  then
    for nfs_mounts in $MOUNTED_FS
      do
        FOUND_ITEM=`echo -e $(mountstats -n $nfs_mounts|grep "NFS\ mount\ options:"|awk -F, '{for (i=1;i<=NF;i++){if ($i ~ "sec=") {print $i}}}')`
        NOTES="$nfs_mounts IS AN NFS MOUNTED FILESYSTEM"
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
      done
# CHECK FOR NFS ENTRIES IN FSTAB
    for fstab_entries in $FSTAB_LIST
      do
        FSTAB_CHECK $fstab_entries
        NOTES="$fstab_entries IS AN FSTAB ENTRY"
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
      done
else
  if [[ $FSTAB_LIST ]]
    then
      for fstab_entries in $FSTAB_LIST
        do
          FSTAB_CHECK $fstab_entries
          NOTES="$fstab_entries IS AN FSTAB ENTRY"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        done
   else
     FOUND_ITEM="NO NFS ENTRIES FOUND IN FSTAB AND NO NFS MOUNTED FILESYSTEMS FOUND"
     RESULTS="NOT APPLICABLE"
     RESULT_TABLE
   fi
fi
