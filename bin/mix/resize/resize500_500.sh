#!/bin/bash
#*.jpg
mogrify -format jpg -path ./ -resize 500x500 *.{jpg,JPG,gif,png}
