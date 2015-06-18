#!/usr/bin/env python

# A quick script for pulling addresses from mailboxes.

import fileinput
import re

emailpattern = re.compile("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,8}\\b")
emailset = set()

for line in fileinput.input() : 
    if(not (line.startswith("From:") or line.startswith("To:") or line.startswith("Cc:"))) :
        continue


    for address in emailpattern.findall(line):
        emailset.add(address)

emaillist = list(emailset)
emaillist.sort()
for address in emaillist :
    print address
