#!/bin/bash 
# Check for gnome desktop installation
if [ ! $(yum -q list installed gnome-desktop*)] 
  then
    FILE="FILE NOT FOUND"
    FOUND_ITEM="GNOME DESKTOP NOT FOUND"
    EXPECTED_ITEM="CHECK NOT APPLICABLE"
    NOTES="If the system does not have GNOME installed, this requirement is Not Applicable."
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
else
# Determine which profile the system database is using
  FILE="/etc/dconf/db/local.d/locks/"
  EXPECTED_ITEM="/org/gnome/desktop/screensaver/idle-activation-enabled"
  FOUND_ITEM=`echo -e $(grep -r "$EXPECTED_ITEM" "$FILE"|awk -F ':' '{print $2}')`
  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
fi
