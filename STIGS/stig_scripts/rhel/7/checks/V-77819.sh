#!/bin/bash 
FILE='/etc/dconf/profile/user'
DIR_DISTRO=`echo -e $(find /etc/dconf/db/distro.d/*)`
DIR_GDM=`echo -e $(find /etc/dconf/db/gdm.d/*)`
DIR_IBUS=`echo -e $(find /etc/dconf/db/ibus.d/*)`
DIR_LOCAL=`echo -e $(find /etc/dconf/db/local.d/*)`
DIR_SITE=`echo -e $(find /etc/dconf/db/site.d/*)`

shopt -s nocasematch 

CHECK_SMARTCARD () {

# THIS CHECKS TO SEE IF THE ENABLE-SMARTCARD-AUTHENTICATION IS SET IN A SPECIFIC DIRECTORY

DIR_LIST=$1
                         
for CHK_DIR in $DIR_LIST 
  do 
    if [[ ! -z `echo -e $(grep -i enable-smartcard-authentication $CHK_DIR) && ! -d $CHK_DIR` ]];  then 
        CHK_ENABLE=`echo -e $(grep -i enable-smartcard-authentication $CHK_DIR)`
        if [[ $CHK_ENABLE != "enable-smartcard-authentication=true" && $CHK_ENABLE != "enable-smartcard-authentication=false" ]]; then
          FILE=$CHK_DIR
          NOTES="THIS REQUIREMENT IS NOT APPLICABLE IF SYSTEM DOES NOT HAVE GNOME INSTALLED"
          FOUND_ITEM="ENABLE-SMARTCARD-AUTHENTICATION IS NOT TRUE OR FALSE"
          EXPECTED_ITEM="TRUE OR FALSE VALUE FOR ENABLE-SMARTCARD-AUTHENTICATION"
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
        else
          FILE=$CHK_DIR
          NOTES="THIS REQUIREMENT IS NOT APPLICABLE IF SYSTEM DOES NOT HAVE GNOME INSTALLED"
          FOUND_ITEM=" "
          EXPECTED_ITEM=" "
          RESULTS="PASS"
          RESULT_TABLE
        fi
    else
      FILE=$CHK_DIR
      NOTES="THIS REQUIREMENT IS NOT APPLICABLE IF SYSTEM DOES NOT HAVE GNOME INSTALLED"
      FOUND_ITEM="ENABLE-SMARTCARD-AUTHENTICATION IS MISSING"
      EXPECTED_ITEM="ENABLE-SMARTCARD-AUTHENTICATION"
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
done 

}


CHECK_IT=`echo -e $(grep -i system-db $FILE | cut -f1)`
for CHK_ENTRY in $CHECK_IT
  do
    case $CHK_ENTRY in
      "system-db:distro" )      CHECK_SMARTCARD $DIR_DISTRO   
                                ;;  
        "system-db:gdm"  )      CHECK_SMARTCARD $DIR_GDM
                                ;;
        "system-db:ibus" )      CHECK_SMARTCARD $DIR_IBUS 
                                ;;  
       "system-db:local" )      CHECK_SMARTCARD $DIR_LOCAL 
                                ;;  
       "system-db:site"  )      CHECK_SMARTCARD $DIR_SITE
                                ;;
                      *  )      RESULTS="FAIL"
                                RESULT_TABLE
    esac
done

shopt -u nocasematch
