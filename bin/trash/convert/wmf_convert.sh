#!/bin/bash
find . -name "*.wmf" | while read x; do
  convert "$x" "${x/%.wmf/.png}"
done


#need aptitude install gs
