#!/bin/bash
mkdir t;
mogrify -resize 200x114^ -path t -gravity center -extent 200x114 -quality 85  +profile "*" *.jpg



