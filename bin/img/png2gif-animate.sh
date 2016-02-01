#!/bin/bash
convert  -channel Alpha -threshold 90%  -delay 180 *.png animation.gif
#-adjoin  -dispose Background
