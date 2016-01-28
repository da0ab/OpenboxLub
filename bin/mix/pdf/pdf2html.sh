#!/bin/bash
#sudo aptitude install poppler-utils
while [ $# -gt 0 ]; do
filename=$1
html_file=`echo "$filename" | sed 's/\.\w*$/.html/'`
pdftohtml -q "$filename" "$html_file"
shift
done
