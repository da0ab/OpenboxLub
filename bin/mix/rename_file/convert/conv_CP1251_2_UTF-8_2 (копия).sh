#!/bin/bash

for i in `find . -name '*.htm*'`; do iconv -f CP1251  -t UTF-8 "$i" >_temp; cat _temp >"$i" ; done
#for i in `ls -R *.htm*`; do iconv -f CP1251  -t UTF-8 $i -o $i; done

for i in `find . -name '*.htm*'`; do perl -pi -e 's/windows-1251/utf-8/g' "$i"; done
