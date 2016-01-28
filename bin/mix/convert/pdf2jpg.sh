#!/bin/bash

 find . -name '*.pdf' | while read i; do gs -r200  -dFirstPage=1 -dLastPage=5 -dJPEGQ=80 -sDEVICE=jpeg -o "${i%.pdf}-%d.jpg" "$i"; done
