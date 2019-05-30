#!/usr/bin/env python
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
# Python V2
# ELEMENT variables for xml_conversion.py

# provides ATTRIB data
groupIdTAG = '{http://checklists.nist.gov/xccdf/1.1}Group'
## allRules contains data for catSeverity, ruleID
allRules = '{http://checklists.nist.gov/xccdf/1.1}Rule'
# provides TEXT data
## allTitles contains data for groupTitles, ruleTitles
allTitles = '{http://checklists.nist.gov/xccdf/1.1}title'
version = '{http://checklists.nist.gov/xccdf/1.1}version'
## description contains data for vulnDiscussion, IAControl
description = '{http://checklists.nist.gov/xccdf/1.1}description'
checkContent = '{http://checklists.nist.gov/xccdf/1.1}check-content'
fixText = '{http://checklists.nist.gov/xccdf/1.1}fixtext'
CCI = '{http://checklists.nist.gov/xccdf/1.1}ident'
# parameters for:
# ruleIDList(listIn, startswith)
rID = 'id: ' ## Also used as a delimiter
# vulnDiscussion(listIn, startsWith)
vuld = '<VulnDiscussion>'
iaControl = '<IAControls>'
# Delimiters for removeDelimiters(listIn, delimiters, repl)
tags = '<[^>]+>'
severe = ' severity: '
mt=''
tk="`"
tka="\\`"
quo='"'
quoa='\\"'
# CAT severities
lo = 'low'
med = 'medium'
hi = 'high'
chi = 'CAT I'
cmed = 'CAT II'
clo = 'CAT III'
new = 'Unknown Severity'
# <tags>
# formatting options re.sub("<.?---[^>]*>|<.?--[--]>|>---[^>]+>|<.?b>","",string)
documentable = "<.?Documentable>"
vulnDiscussion = "<.?vulnDiscussion>"
# variable to add bash scripting, potentially
bashCommand = 's/false\"/\\"/g'
