#!/bin/bash

ls -1 | while read name ; do
newname=`echo $name | iconv -f KOI8-R -t UTF-8`
if [ "$name" != "$newname" ] ; then
  echo "$name => $newname"
  mv -f "$name" "$newname"
fi
done
