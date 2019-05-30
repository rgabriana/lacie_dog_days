
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4

import xml.etree.ElementTree as ET
import subprocess as sp
import sys,re
from xcVariables import *

# User inputs path directory and filename
def getPath():
    PATH=raw_input("\nPlease enter the full path and filename of the STIG XML file")
    if PATH is None:
        print PATH
    return PATH
# Get the root of the tree from path
def getRoot(PATH):
    return ET.parse(PATH).getroot()
# Return list of the attributes text with select Elements 
def displayElementsWithAttrib(ROOT, ELEMENT):
    newList=[]
    for e in ROOT.iter():
        rATTRIB = str(e.attrib) # converting to string because dictionaries can re-order
        if e.tag == ELEMENT:
            #TAG = str(re.sub('{.+?}','',rTAG))
            ATTRIB = str(re.sub('[\'{}]','',rATTRIB))
            newList.append(ATTRIB)
    return newList
# Return list of the text with select Elements
def displayElementsWithText(ROOT, ELEMENT):
    textList = []
    for e in ROOT.iter():
        TEXT = e.text
        if e.tag == ELEMENT:
            textList.append(TEXT)
    return textList
# Isolate Group Titles
def groupTitles(listIn):
    return listIn[10::2]
    #groupTitleList=[]
    #for t in textList:
    #    if t.startswith('SRG-APP-') or t.startswith('WG') or t.startswith('WA'):
    #        groupTitleList.append(t)
    #return groupTitleList
# Isolate vulnDiscussion
def tagSelection(listIn, startsWith):
    newList=[]
    for i in listIn:
        if i.startswith(startsWith):
            newList.append(i)
    return newList
# split item in list
def splitItem(listIn):
    newList=[]
    for i in listIn:
        newL = i.split("falseWeb Administrator")
        ''.join(newL)
        newList.append("HERE IS A NEW ITEM ")
        newList.append(newL)
    return newList
# return list of vulnerability discussion items
def vulnDiscussion(listIn):
    newList=[]
    for i in listIn:
        newList.append(i[0])
    return newList
# return list of IAControls~~~~~NEEDS TUNING
def iaControl(listIn):
    newList=[]
    for i in listIn:
        newList.append(i[-1])
    return newList
# Isolate Rule Titles
def ruleTitles(listIn):
    return listIn[9::2]
# Removing tags and/or unecessary data
def removeDelimiters(listIn,delim,repl):
    newList=[]
    for e in listIn:
        nf = re.sub(delim,repl, e)
        newList.append(nf)
    return newList
# replacing bash key characters
def specialChar(listIn):
    newList=[]
    for i in listIn:
        #sp.call(["sed -e 's|\"|\\\"|g'", i],shell=False)
        sp.Popen(['/bin/sh',"sed -e 's|\"|\\\"|g'"])
        newList.append(i)
    return newList
# format severity to CAT
def convertCAT(listIn):
    newList=[]
    for e in listIn:
        if e==med:
            ce=re.sub(e,cmed,e)
        if e==lo:
            ce=re.sub(e,clo,e)
        if e==hi:
            ce=re.sub(e,chi,e)
        if e!=lo and e!=med and e!=hi:
            ce=re.sub(e,new,e)
        newList.append(ce)
    return newList
# sort allRules list and return list RuleId's
def ruleIDList(listIn, startswith):
    newList=[]
    for i in listIn:
        nl = i.split(',')
        for e in nl:
            if e.startswith(startswith):
                newList.append(e)
    return newList
# sort allRules list and return  list of severities
def severityList(listIn):
    newList=[]
    for e in listIn:
        li = e.split(',')
        newList.append(li[2])
    return newList
def rm_fn(trgt,dsrd):
    print "\nYour text files contain false data."
    path = raw_input("To remove false data, enter path/your_directory: ")
    files=glob.glob(os.path.join(path,'^V-'))
    for f in files:
        fopen=open(f, 'r')
        for word in fopen:
            if word.startswith(trgt):
                word.replace(dsrd, '')
        fopen.close()
'================================ Troubleshoot ========================================='
# Identify element tags
# Display tags
def displayTag(NODE):
    print NODE.tag
# Recusively calls tags form the root
def recur_node(NODE, function):
    if NODE != None:
        function(NODE)
        for i in NODE.getchildren():
            recur_node(i, function)
    else:
        return 0
# View those tags
def viewTags(PATH):
    try:
        root=ET.parse(PATH).getroot()
    except:
        return -1
    return recur_node(root, displayTag)
