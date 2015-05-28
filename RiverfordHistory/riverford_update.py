#!/usr/bin/env python

# This is a quick-and-dirty script which archives the contents of each week's
# riverford organics box, and indexes that archive so we can check it in a
# browser. It is intended to run once per week in a cron job.

import datetime
import codecs
import os
import sys
from pyquery import PyQuery as pq

# Run where we're asked, or in the current directory.
directory = "."
if len(sys.argv)>1:
    directory = sys.argv[1]
os.chdir(directory)

# Get the current riverford box contents for wash farm.
url = 'http://www.riverford.co.uk/isl/box-contents/'
doc = pq(url=url)
heading = doc('h1:last')
table = doc('table')
time = datetime.datetime.now().isoformat()
with codecs.open('riverford_'+time+'.htmlfrag', 'w', encoding='utf-8') as f:
    f.write('<div id="'+time+'">\n')
    f.write(heading.html())
    f.write('<table>')
    f.write(table.html())
    f.write('</table>')
    f.write('</div>')

# Stitch together all the saved box contents into a single page.
ls = os.listdir(directory)
ls.sort()
with codecs.open('index.html', 'w', encoding='utf-8') as out:
    out.write("<html><head><title>A History of Riverford Box Data</title></head><body>")
    for f in ls:
        if f.startswith('riverford_') and f.endswith('.htmlfrag'):
            with codecs.open(f,'r', encoding='utf-8') as infrag:
                out.write(infrag.read())
    out.write("</body></html>")

