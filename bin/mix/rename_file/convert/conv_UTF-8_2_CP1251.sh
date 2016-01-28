#!/bin/bash


for i in `ls -R *.htm*`; do iconv -f UTF-8  -t CP1251  $i -o $i; done


