#!/bin/bash
 i=file_2; echo "$i" "${i%%_}_$((${i##_}+1))"

find . -name '*.pdf' | while read i; do gs -r300 -dFirstPage=1 -dLastPage=11 -dJPEGQ=90 -sDEVICE=jpeg -o "${i%.pdf}_%d.jpg" "$i"; done


#find . -name '*.pdf' | while read i; do gs -r72 -dFirstPage=1 -dLastPage=11 -dJPEGQ=70 -sDEVICE=jpeg -o i=file_2; echo "$i" "${i%_}_$((${i##_}+1))"
#; done



#find . -name '*.pdf' | while read x; do i="${x%.pdf}"; gs -r72 -dFirstPage=1 -dLastPage=11 -dJPEGQ=70 -sDEVICE=jpeg -o "${i%_}_$((${i##_}+1))" "$x"; done
