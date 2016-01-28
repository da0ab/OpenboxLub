#!/bin/bash

mencoder 3.avi -o output.flv -of lavf \     -oac mp3lame -lameopts abr:br=56 -srate 22050 -ovc lavc \     -lavcopts vcodec=flv:vbitrate=500:mbd=2:mv0:trell:v4mv:cbp:last_pred=3

