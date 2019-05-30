#!/bin/bash 
# CHECK IF THE SERVICE IS RUNNING
FILE="/etc/sssd/sssd.conf"
if [[ $(systemctl status sssd.service) ]]
  then

# CHECK FOR THE CONFIG FILE


# CHECK FOR THE ENTRY    

    if [[ -e $FILE ]]
      then
        FOUND_ITEM=`echo -e $(grep ldap_tls_cacert = /etc/pki/tls/certs/ca-bundle.crt $FILE)`
        EXPECTED_ITEM="ldap_tls_cacert = /etc/pki/tls/certs/ca-bundle.crt"
        FILE=`echo -e $FOUND_ITEM | awk -F= '{print $2}'`

# CHECK IF THE FILE EXISTS

        if [[ -e $FILE ]]
          then
            LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
        else
          RESULTS=FAIL
          NOTES=" Verify the ldap_tls_cacert option points to a file that contains the trusted CA certificate. If this file does not exist, or the option is commented out or missing, this is a finding."
          RESULT_TABLE
        fi

    else
        RESULTS=FAIL
        NOTES="SERVICE FOUND, BUT CONFIG FILE WAS NOT FOUND"
        RESULT_TABLE
    fi

else
  FOUND_ITEM="service found NOT running"
  EXPECTED_ITEM="service found running"
  RESULTS="NOT APPLICABLE"
  NOTES="If LDAP is not being utilized, this requirement is Not Applicable. Verify the operating system implements cryptography to protect the integrity of remote LDAP access sessions."
  RESULT_TABLE
fi
