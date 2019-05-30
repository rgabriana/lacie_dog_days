#!/bin/bash 
PKG_LIST="esc pam_pkcsll authconfig-gtk"

shopt -s nocasematch
for PKG in $PKG_LIST 
   do
       if [ ! $(yum -q list installed $PKG) ] 
         then
          NOTES=" "
          FOUND_ITEM="PACKAGE $PKG IS NOT INSTALLED"
          EXPECTED_ITEM=$PKG
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
      else
          NOTES=" "
          FOUND_ITEM=$PKG
          EXPECTED_ITEM=$PKG
          LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
          FILL_RESULTS
      fi
done 
shopt -u nocasematch
