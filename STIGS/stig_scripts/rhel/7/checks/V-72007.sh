#!/bin/bash 
FILE="/etc/fstab"
for i in adfs affs autofs cifs coda coherent cramfs debugfs devpts efs ext ext2 ext3 ext4 hfs hfsplus hpfs iso9660 jfs minix msdos ncpfs nfs nfs4 ntfs proc qnx4 ramfs reiserfs romfs squashfs smbfs sysv tmpfs ubifs udf ufs umsdos usbfs vfat xenix xfs xiafs
  do
    FOUND_ITEM=`echo -e $(find / -fstype $i -nouser)`
    if [ -z $FOUND_ITEM ]
    then
      EXPECTED_ITEM="List is blank for $i"
      RESULTS=PASS
      NOTES="echo -e \$(find / -fstype $i -nouser)"
      RESULT_TABLE
      FILL_RESULTS

    else
      EXPECTED_ITEM="no user found for $i"
      RESULTS=FAIL
      RESULT_TABLE
      FILL_RESULTS
    fi

  done
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
