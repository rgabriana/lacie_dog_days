#!/bin/bash 
PKGS=`echo -e "firewalld" "tcpwrappers"`
FIREWALL_ACTIVE=FALSE

for PKG in $PKGS
  do
    
    if [[ ! -z $(yum -q list installed $PKG) ]]; then
       CHK_PKG=`echo -e $(yum -q list installed $PKG) | grep -o "Installed Packages $PKG"`
       if [  "$CHK_PKG" == "Installed Packages $PKG" ]
         then
# Check to see if the firewalld package is installed, check to see if it is configured to grant or deny access to specific hosts or services
           CHK_ACTIVE=`echo -e $(systemctl status $PKG | grep -o "Active: active")`                
           if [[ "$CHK_ACTIVE" == "Active: active" && $PKG == "firewalld" ]]; then
             DEFAULT_ZONE=`echo -e $(firewall-cmd --get-default-zone)`
             CHK_ZONE=`echo -e $(firewall-cmd --list-all --zone="$DEFAULT_ZONE") | grep "$DEFAULT_ZONE"`
             FIREWALL_ACTIVE=TRUE 
             FOUND_ITEM="PACKAGE $PKG IS INSTALLED AND ACTIVE"
             EXPECTED_ITEM="PACKAGE $PKG IS INSTALLED AND ACTIVE"
             LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
             FILL_RESULTS
           elif [[ "$CHK_ACTIVE" == "Active: active" && $PKG == "tcpwrappers" && ! FIREWALL_ACTIVE ]]; then
# FIREWALLD is not active check to see if TCPWRAPPERS is used
             CHK_ALLOW=`echo -e $(ls -al /etc/hosts.allow) | awk '{print $5}'`
             CHK_DENY=`echo -e $(ls -al /etc/hosts.deny) | awk '{print $5}'`
             if [ $CHK_ALLOW == 0 || $CHK_DENY == 0 ] 
               then
                  FOUND_ITEM="$PKG IS NOT CONFIGURED TO GRANT OR DENY ACCESS TO HOST"
                  EXPECTED_ITEM=$PKG
                  LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM" 
                  FILL_RESULTS
             fi
           else
              FOUND_ITEM="PACKAGE $PKG IS NOT ACTIVE"
              EXPECTED_ITEM=$PKG
              LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
              FILL_RESULTS
           fi
       else
         NOTES="IF both are not installed, ask SA if another access control program is installed" 
         FOUND_ITEM="PACKAGE $PKG IS NOT INSTALLED, CONFIGURED, OR ACTIVE"
         EXPECTED_ITEM=$PKG
         LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
         FILL_RESULTS
       fi
    else
      NOTES="IF both are not installed, ask SA if another access control program is installed" 
      FOUND_ITEM="PACKAGE $PKG IS NOT INSTALLED, CONFIGURED, OR ACTIVE"
      EXPECTED_ITEM=$PKG
      LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
      FILL_RESULTS
    fi
done
