#!/bin/bash

#for x in *.log; do mv $x `echo $x | tr [A-Z] [a-z]`; done
#файлы и каталоги в нижний регистр
#Вместо части "mv $FILE $FILE2;" можно подставлять любые операции с файлами и их именами.
find ./ -type f -print0 | while read -d '' FILE; do FILE2=`echo "$FILE"|tr [A-Z] [a-z]`; mv $FILE $FILE2; wait; done

