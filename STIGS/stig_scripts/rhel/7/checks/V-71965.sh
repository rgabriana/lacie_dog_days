#!/bin/bash 
old_IFS=$IFS
IFS=","
if  test -e /etc/pam_pkcs11; 
then
FILE="/etc/pam_pkcs11/pkcs11_eventmgr.conf"
FINDS="pam_pkcs11,smartcard removal action,smartcard module"
for F in $FINDS
do
case "$F" in
"pam_pkcs11" )
FOUND_ITEM=`authconfig --test | grep "pam_pkcs11"|awk -F ' is ' '{print $2}'`
EXPECTED_ITEM="enabled"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
FILL_RESULTS
;;
"smartcard removal action" )
FOUND_ITEM=`authconfig --test | grep "smartcard removal action"|awk -F ' = ' '{print $2}'`
EXPECTED_ITEM="Lock"
NOTES="Verify if system uses pki."
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
FILL_RESULTS
;;
"smartcard module" )
FOUND_ITEM=`authconfig --test | grep "smartcard module"|awk -F ' = ' '{print $2}'`
EXPECTED_ITEM='"coolkey"'
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
FILL_RESULTS
;;
* )
FOUND_ITEM="Alternate Case * chosen"
EXPECTED_ITEM="There are no alternate cases available."
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
FILL_RESULTS
;;
esac
done
else
FOUND_ITEM="Package pam_pkcs11 does not exist on this system."
EXPECTED_ITEM="Mitigation is necessary."
NOTES="CHECK ON MODULES AVAILABLE CASE and Please provide Plan of Action and Mitigation (POAM)"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
fi
