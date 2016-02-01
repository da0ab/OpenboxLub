#!/bin/bash
echo " "
echo " "
 
mkdir SVG; 
for i in *.cdr ; 
do 
echo "Working on $i ..."
uniconvertor "$i" "SVG/${i%.svg}.svg" ; 
 
done
 
echo " "
echo "... Done!"
echo " "
 
exit 0
