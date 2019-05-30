#!/bin/bash 
if [[ `yum list installed gnome-desktop*` ]]
  then
    FILE=`echo -e $(grep -lr media-keys /etc/dconf/db/local.d/)`
    FOUND_ITEM=`gsettings get org.gnome.settings-daemon.plugins.media-keys logout`
    EXPECTED_ITEM=
    NOTES="THIS SETTING IS EXPECTED TO BE BLANK"
    LOGIC_TEST $EXPECTED_ITEM "$FOUND_ITEM"
    FILL_RESULTS
fi

FOUND_ITEM=`systemctl list-unit-files | grep ctrl-alt-del | awk -F " " '{print $2}'`
EXPECTED_ITEM="disabled"
LOGIC_TEST "$EXPECTED_ITEM" "$FOUND_ITEM"
