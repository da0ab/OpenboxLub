#!/bin/bash
find . -name "*.jpg" | while read x; do
  composite -dissolve 15 -tile watermark.png "$x" "${x/%.jpg/.jpg}"
done

