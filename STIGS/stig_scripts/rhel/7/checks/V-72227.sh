#!/bin/bash 
# CHECK IF THE SERVICE IS RUNNING
FILE="/etc/sssd/sssd.conf"
if [[ $(systemctl status sssd.service) ]]
  then

# CHECK FOR THE CONFIG FILE


# CHECK FOR THE ENTRY    

    EXPECTED_ITEM="ldap_id_use_start_tls = true"
    if [[ -e $FILE ]]
      then
        FOUND_ITEM=`echo -e $(grep \"$EXPECTED_ITEM\" $FILE)`
        LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM
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
