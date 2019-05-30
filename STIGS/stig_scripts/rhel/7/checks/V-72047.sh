#!/bin/bash 
FILE_SYSTEM_TYPES="adfs\
 affs\
 autofs\
 cifs\
 coda\
 coherent\
 cramfs\
 debugfs\
 devpts\
 efs\
 ext\
 ext2\
 ext3\
 ext4\
 hfs\
 hfsplus\
 hpfs\
 iso9660\
 jfs\
 minix\
 msdos\
 ncpfs\
 nfs\
 nfs4\
 ntfs\
 proc\
 qnx4\
 ramfs\
 reiserfs\
 romfs\
 squashfs\
 smbfs\
 sysv\
 tmpfs\
 ubifs\
 udf\
 ufs\
 umsdos\
 usbfs\
 vfat\
 xenix\
 xfs\
 xiafs"

for FSTYPE in $FILE_SYSTEM_TYPES
  do
    FOLDER=`find / -xdev -perm -002 -type d -fstype $FSTYPE`
    for FILE in $FOLDER
      do
        FOUND_ITEM=`stat -c %G $FILE`
        case $FOUND_ITEM in 
        root )
          EXPECTED_ITEM="root"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
        sys )
          EXPECTED_ITEM="sys"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
        bin )
          EXPECTED_ITEM="bin"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS

        ;;
        * )
          EXPECETED_ITEM="root sys bin"
          NOTES="If any world-writable directories are not owned by $EXPECTED_ITEM or an application group associated with the directory, this is a finding."
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        ;;
        esac
      done
   done
# LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
# LOGIC_TEST_PLUS_MINUS < GREATER_THAN || LESS_THAN > $EXPECTED_ITEM $FOUND_ITEM
