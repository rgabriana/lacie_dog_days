#!/bin/bash

FILE="/etc/security/limits.conf"
FOUND_ITEM=`echo -e $(grep hard.*maxlogins "$FILE")`
EXPECTED_ITEM="*	hard	maxlogins 10"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
