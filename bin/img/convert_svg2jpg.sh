#!/bin/bash
echo " "
echo " "

mkdir SVG;
for i in *.svg ;
do
echo "Working on $i ..."
convert "$i" "SVG/${i%.jpg}.jpg" ;

done

echo " "
echo "... Done!"
echo " "

exit 0
