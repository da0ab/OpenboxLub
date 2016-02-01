#!/bin/bash
#*.jpg
mogrify -format jpg -path ./ -resize 700x700 *.{jpg,JPG,gif,png}
