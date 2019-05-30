#!/bin/bash 
# Create a function that lists the attched disks and transport type
DISK_FUNCTION () {

  lsblk --all --list --path -o +tran

}

EXPECTED_ITEM="nosuid"
NOTES="This check requires manual review"

# Create a list of disks that has a transport type of USB

DEVICE=`DISK_FUNCTION | awk -F " " '$NF == "usb" {print $1}'`

# additional known optical media devices.
if [[ $DEVICE ]]
  then
    for USB in $DEVICE
      do
        PARTS=`DISK_FUNCTION | grep $USB | awk -F " " '{print $1}'`
          for FILE in $PARTS
            do
              FOUND_ITEM=`echo -e $(grep ^"$FILE" /etc/fstab | grep -o nosuid)`
              LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
              FILL_RESULTS
            done
      done
else
  FOUND_ITEM="NO USB MEDIA FOUND ON THE SYSTEM"
  RESULTS="NOT APPLICABLE"
  NOTES="THIS IS A MANUAL CHECK"
  RESULT_TABLE
fi
