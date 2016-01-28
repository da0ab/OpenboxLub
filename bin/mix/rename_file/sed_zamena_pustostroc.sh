#!/bin/bash
filename=*.html
res=`sed -e "/^$/{:a N; /[^\n]/{s,^\n\+,\n,; b}; b a}" $filename`
echo "$res" > $filename
