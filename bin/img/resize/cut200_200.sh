#!/bin/bash
mkdir t; 
#mogrify -format jpg -path tt -region  200x135 *.jpg
mogrify -resize 200x114^ -path t -gravity center -extent 200x114 -quality 85  +profile "*" *.jpg


 
