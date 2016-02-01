#!/bin/sh
for i in `find . -name "*.*" -type f`
    do
    echo $i
    iconv -f WINDOWS-1251 -t UTF-8 "$i" > tmp 
    mv -f tmp "$i"
    done

