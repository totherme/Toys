#!/usr/bin/env python
import datetime
import codecs
import os
import sys
from pyquery import PyQuery as pq

directory = "."
if len(sys.argv)>1:
    directory = sys.argv[1]
os.chdir(directory)
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

ls = os.listdir(directory)
ls.sort()
with codecs.open('index.html', 'w', encoding='utf-8') as out:
    out.write("<html><head><title>A History of Riverford Box Data</title></head><body>")
    for f in ls:
        if f.startswith('riverford_') and f.endswith('.htmlfrag'):
            with codecs.open(f,'r', encoding='utf-8') as infrag:
                out.write(infrag.read())
    out.write("</body></html>")

