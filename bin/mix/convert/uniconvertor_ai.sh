#!/bin/bash
echo " "
echo " "
 
mkdir AI; 
for i in *.cdr ; 
do 
echo "Working on $i ..."
uniconvertor "$i" "AI/${i%.ai}.ai" ; 
 
done
 
echo " "
echo "... Done!"
echo " "
 
exit 0
