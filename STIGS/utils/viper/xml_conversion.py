#!/usr/bin/env python2.7.5
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
# Parse xml STIG-SCAP Format
# xml file is user input
# Modular:
# Editable by user config files
# Program creates reference files for security script check
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Give user option to input path to stig files
# Check that path is valid and the name given doesn't already exist
# If it exists, give user option to obliterate old file or rename
# ---- may need to utilize bash
# Remove false from inner tag items &gt and &lt

import xml.etree.ElementTree as ET
import subprocess as sp
import sys,re,os,codecs
from xcVariables import *
from FUNCTIONS import *
from test import *
reload(sys)
sys.setdefaultencoding('utf8')

def main():
    print "\nThis program parses STIG xml pages. Disable program with CTRL-C at anytime.\n"
    PATH=getPath()
    ROOT=getRoot(PATH)

    groupIDList = removeDelimiters(displayElementsWithAttrib(ROOT,groupIdTAG),rID,mt)
    groupTitleList = groupTitles(displayElementsWithText(ROOT, allTitles))
    ruleIdLst = removeDelimiters(ruleIDList(displayElementsWithAttrib(ROOT,allRules),rID),rID,mt)
    severityLst = convertCAT(removeDelimiters(severityList(displayElementsWithAttrib(ROOT, allRules)),severe,mt))
    ruleVersionList = displayElementsWithText(ROOT, version)
    ruleVersionList.pop(0)
    ruleTitlesList = ruleTitles(displayElementsWithText(ROOT, allTitles))
    ruleTitlesList.pop(0)
    ### vulnDisc contains \u201c---\u201d encoding
    vulnDisc = removeDelimiters(tagSelection(displayElementsWithText(ROOT,description),vuld),tags,mt)
    ## iaControls NEEDS TUNING
    iaControls = iaControl(splitItem(removeDelimiters(tagSelection(displayElementsWithText(ROOT,description),vuld),tags,mt)))
    chkContent = displayElementsWithText(ROOT, checkContent)
    ### chkContent contains \u201c---\u201d encoding
    fxTxt = displayElementsWithText(ROOT, fixText)
    ### fxTt contains \u201c---\u201d formatting
    cci = displayElementsWithText(ROOT, CCI)

    new_directory = raw_input("\nName the new folder to contain new files: ")
    os.makedirs(new_directory)

    for gi, gt, ri, s, rv, rt, vd, cc, ft in zip(groupIDList,
            groupTitleList, ruleIdLst, severityLst, ruleVersionList,
            ruleTitlesList, vulnDisc, chkContent, fxTxt):
        file_O = open(os.path.join(new_directory,gi), "w")
        file_O.write('vulid='+'"'+gi+'"')
        file_O.write('\nGROUP_TITLE='+'"'+gt+'"')
        file_O.write('\nRULE_ID='+'"'+ri+'"')
        file_O.write('\nSEVERITY='+'"'+s+'"')
        file_O.write('\nRULE_VERSION='+'"'+rv+'"')
        file_O.write('\nRULE_TITLE='+'"'+rt+'"')
        file_O.write('\n\n\nVULNERABILITY_DISCUSSION='+'"'+vd+'"')
        file_O.write('\n\n\nCHECK_CONTENT='+'"'+cc+'"')
        file_O.write('\n\n\nFIX_TEXT='+'"'+ft+'"')
        file_O.close()

    #sp.call(["sed -i 's|false\"|\"|g'", new_directory, "/*"], shell=True)
    print "\nRun sed command to remove false.\" without harming \"\n"
    print "\nProgram Complete. Check your new directory and files for accuracy.\n"
if __name__ == "__main__":
    sys.exit(main())
# main() end
