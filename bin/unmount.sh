#!/bin/sh

directory=$(mount | tail --lines=1 | sed 's/.\+ on \(.\+\) type .\+ (.\+)/\1/')
umount $directory && notify-send -i fsdevice "\"$(echo $directory | sed 's/\/.*\///g')\" unmounted" "Now you can remove last attached device safely" || notify-send -i error "Error on unmounting" "\"$directory\" can not be unmounted"
