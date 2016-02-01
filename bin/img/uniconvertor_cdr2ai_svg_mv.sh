#!/bin/bash
echo " "
echo " "
mkdir CDR;  
mkdir AI; 
mkdir SVG; 
for i in *.cdr ; 
do 
echo "Working on $i ..."
uniconvertor "$i" "AI/${i%.ai}.ai" ; 
uniconvertor "$i" "SVG/${i%.svg}.svg" ; 
mv "$i" "CDR/${i%.cdr}.cdr"; 
done
 
echo " "
echo "... Done!"
echo " "
 
exit 0
