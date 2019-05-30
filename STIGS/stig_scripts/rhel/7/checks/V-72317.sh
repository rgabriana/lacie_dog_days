#!/bin/bash 
FILE=`echo -e "/etc/ipsec.conf" $(find /etc/ipsec.d/)`
PKG="libreswan"

CHK_PKG=`echo -e $(yum -q list installed libreswan) | grep -o "Installed Packages $PKG"` 
if [  "$CHK_PKG" == "Installed Packages $PKG" ]
      then
# The libreswan package is install, check to see if the IPsec service is active
    IPSEC_CHK=`echo -e $(systemctl status ipsec | grep -o "Active: inactive")`         
# If the IPsec service is active, check tunnels configured       
    if [ "$IPSEC_CHK" != "Active: inactive" ]
      then
         for FILE_CHK in $FILE
           do
             TUNNEL_CONFIG=`echo -e $(grep -iw conn $FILE_CHK | grep -o conn)`
             if [ $TUNNEL_CONFIG == "conn" && ! -d $FILE_CHK ] 
               then
                  FOUND_ITEM="LIBRESWAN INSTALLED, IPSEC ACTIVE, TUNNEL CONFIGURED IN $FILE_CHK"
                  EXPECTED_ITEM="LIBRESWAN INSTALLED, IPSEC ACTIVE, TUNNEL CONFIGURED IN $FILE_CHK"
                  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
                  FILL_RESULTS
             else 
                  FOUND_ITEM="LIBRESWAN INSTALLED, IPSEC ACTIVE, BUT TUNNEL NOT CONFIGURED"
                  EXPECTED_ITEM="LIBRESWAN INSTALLED, IPSEC ACTIVE, BUT TUNNEL NOT CONFIGURED"
                  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
                  FILL_RESULTS
             fi   
         done
     else
         FOUND_ITEM="LIBRESWAN INSTALLED, IPSEC INACTIVE, AND TUNNEL NOT CONFIGURED"
         EXPECTED_ITEM="LIBRESWAN INSTALLED, IPSEC INACTIVE, AND TUNNEL NOT CONFIGURED"
         LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
         FILL_RESULTS
     fi
else 
    FOUND_ITEM="PACKAGE $PKG is not INSTALLED"
    EXPECTED_ITEM=$PKG
    LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
    FILL_RESULTS
fi
