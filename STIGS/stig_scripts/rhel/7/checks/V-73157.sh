#!/bin/bash 
FILE="/etc/dconf/profile/user"
DIR_DISTRO=`echo -e $(find /etc/dconf/db/distro.d/locks/*)`
DIR_LOCAL=`echo -e $(find /etc/dconf/db/local.d/locks/*)`
DIR_SITE=`echo -e $(find /etc/dconf/db/site.d/locks/*)`
DIR_GDM=`echo -e $(find /etc/dconf/db/gdm.d/locks/*)`
DIR_IBUS=`echo -e $(find /etc/dconf/db/ibus.d/locks/*)`

shopt -s nocasematch 

CHECK_DELAY () {

# THIS CHECKS TO SEE IF THE IDLE DELAY IS SET

DIR_LIST=$1
                         
for CHK_DIR in $DIR_LIST 
  do 
    if [[ ! -z `echo -e $(grep -i idle-delay $CHK_DIR)` && ! -d $CHK_DIR ]];  then 
        FILE=$CHK_DIR
        NOTES="THIS REQUIREMENT IS NOT APPLICABLE IF SYSTEM DOES NOT HAVE GNOME INSTALLED"
        FOUND_ITEM=`echo -e $(grep -i "idle-delay" $CHK_DIR)`
        EXPECTED_ITEM=$FOUND_ITEM
        LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
        FILL_RESULTS
    else
      FILE=$CHK_DIR
      NOTES="THIS REQUIREMENT IS NOT APPLICABLE IF SYSTEM DOES NOT HAVE GNOME INSTALLED"
      FOUND_ITEM=`echo -e $(grep -i "idle-delay" $CHK_DIR)`
      EXPECTED_ITEM="IDLE-DELAY"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
done 
}

CHK_SYS_DB=`echo -e $(grep system-db $FILE)`
for CHK_ENTRY in $CHK_SYS_DB
  do
    case $CHK_ENTRY in
      "system-db:distro" )      CHECK_DELAY $DIR_DISTRO                
                                ;;  
       "system-db:local" )      CHECK_DELAY $DIR_LOCAL 
                                ;;  
       "system-db:site"  )      CHECK_DELAY $DIR_SITE
                                ;;
       "system-db:gdm"   )      CHECK_DELAY $DIR_GDM
                                ;;
       "system-db:ibus"  )      CHECK_DELAY $DIR_IBUS
                                ;;
                      *  )      RESULTS="FAIL"
                                RESULT_TABLE
                                ;;
    esac
done

shopt -u nocasematch
