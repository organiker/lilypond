#!@PYTHON@

# Created 01 September 2003 by Heikki Junes.
# Makes a lilypond.words file which is used by (X)Emacs and Vim.

import string
import re
import sys

outlines = []
prekw = '\\\\'

# keywords not otherwise found
for line in ['include','maininput','version']:
    outlines = outlines + [prekw + line]

# the main keywords
F = open('lily/my-lily-lexer.cc', 'r')
for line in F.readlines():
    m = re.search(r"(\s*{\")(.*)(\",\s*.*},\s*\n)",line)
    if m:
	outlines = outlines + [prekw + m.group(2)]
F.close()

# keywords in markup
F = open('scm/new-markup.scm', 'r')
for line in F.readlines():
    m = re.search(r"^(\s*\(cons\s*)([a-z-]*)(-markup)",line)
    if m:
	outlines = outlines + [prekw + m.group(2)]
F.close()

# identifiers and keywords
for name in [
'ly/a4-init.ly',
'ly/chord-modifiers-init.ly',
'ly/dynamic-scripts-init.ly',
'ly/engraver-init.ly',
'ly/grace-init.ly',
'ly/gregorian-init.ly',
'ly/performer-init.ly',
'ly/property-init.ly',
'ly/scale-definitions-init.ly',
'ly/script-init.ly',
'ly/spanners-init.ly',
]:
    F = open(name, 'r')
    for line in F.readlines():
        m = re.search(r"^([a-zA-Z]+)(\s*=)",line)
        if m:
	    outlines = outlines + [prekw + m.group(1)]
    F.close()

# more identifiers
for name in [
'ly/declarations-init.ly',
'ly/paper11-init.ly',
'ly/paper13-init.ly',
'ly/paper16-init.ly',
'ly/paper19-init.ly',
'ly/paper20-init.ly',
'ly/paper23-init.ly',
'ly/paper26-init.ly',
'ly/paper-as5-init.ly',
'ly/paper-as9-init.ly',
'ly/paper-init.ly',
'ly/params-init.ly',
'ly/params-as-init.ly',
]:
    F = open(name, 'r')
    for line in F.readlines():
        m = re.search(r"^(\s*)([a-zA-Z]+)(\s*=)",line)
        if m:
	    outlines = outlines + [prekw + m.group(2)]
    F.close()

# more identifiers
for name in [
'ly/declarations-init.ly',
'ly/paper11-init.ly',
'ly/paper13-init.ly',
'ly/paper16-init.ly',
'ly/paper19-init.ly',
'ly/paper20-init.ly',
'ly/paper23-init.ly',
'ly/paper26-init.ly',
'ly/paper-as5-init.ly',
'ly/paper-as9-init.ly',
'ly/paper-init.ly',
'ly/params-init.ly',
'ly/params-as-init.ly',
]:
    F = open(name, 'r')
    for line in F.readlines():
        m = re.search(r"^(\s*)([a-zA-Z]+)(\s*=)",line)
        if m:
	    outlines = outlines + [prekw + m.group(2)]
    F.close()

# note names
for name in [
'ly/catalan.ly',
'ly/deutsch.ly',
'ly/drumpitch-init.ly',
'ly/english.ly',
'ly/espanol.ly',
'ly/italiano.ly',
'ly/nederlands.ly',
'ly/norsk.ly',
'ly/suomi.ly',
'ly/svenska.ly',
]:
    F = open(name, 'r')
    for line in F.readlines():
      	for pattern in [
	r"^(\s*\()([a-z]+)([^l]+ly:make-pitch)",
	]:
	    m = re.search(pattern,line)
	    if m:
                print(m.group(2))
	        outlines = outlines + ['' + m.group(2)]
    F.close()
    
# reserved words
for name in [
'ly/engraver-init.ly',
'ly/performer-init.ly',
]:
    F = open(name, 'r')
    for line in F.readlines():
      	for pattern in [
	r"^(\s*.consists\s+\")([a-zA-Z_]+)(\")",
	r"([\\]name\s+[\"]?)([a-zA-Z_]+)([\"]?)",
	r"(\s+)([a-zA-Z_]+)(\s*[\\]((set)|(override)))",
	]:
	    m = re.search(pattern,line)
	    if m:
	        outlines = outlines + ['' + m.group(2)]
    F.close()

# the output file
if sys.argv[1:] == []:
  out = open('lilypond.words', 'w')
else:
  out = open(sys.argv[1], 'w')

# the menu in lilypond-mode.el
for line in [
'/( - _ /) -',
'/[ - _ /] -',
'< - _ > -',
'<< - _ >> -',
'///( - _ ///) -',
'///[ - _ ///] -',
'///< - _ ///! -',
'///> - _ ///! -',
'//center - / << _ >> -',
'//column - / << _ >> -',
'//context/ Staff/ = - % { _ } -',
'//context/ Voice/ = - % { _ } -',
'//markup - { _ } -',
'//notes - { _ } -',
'//relative - % { _ } -',
'//score - { //n /? //simultaneous { //n _ //n } /! //n //paper {  } //n /? //midi {  } //n /! } //n -',
'//simultaneous - { _ } -',
'//sustainDown - _ //sustainUp -',
'//times - % { _ } -',
'//transpose - % { _ } -',
]:
    # urg. escape char '/' is replaced with '\\' which python writes as a '\'.
    out.write(string.join(string.split(line,'/'),'\\') + '\n')
    
# alphabetically ordered words
outlines.sort()
prevline = ''
for line in outlines:
    if line != prevline:
        out.write(line + '\n')
    prevline = line

out.close()
