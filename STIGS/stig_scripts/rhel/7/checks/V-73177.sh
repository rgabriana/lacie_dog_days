#!/bin/bash
NOTES="THIS IS NOT APPLICABLE FOR SYSTEMS THAT DO NOT HAVE WIRELESS NETWORK ADAPTERS.\n If a wireless interface is configured and its use on the system is not documented with the Information System Security Officer (ISSO), this is a finding."
FOUND_ITEM=`nmcli device | grep wifi | awk '{print $3}'`
EXPECTED_ITEM="unavailable"
LOGIC_TEST $EXPECTED_ITEM $FOUND_ITEM 
