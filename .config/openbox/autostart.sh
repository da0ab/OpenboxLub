#!/bin/bash
#. $GLOBALAUTOSTART
# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi


#sleep 1 &
tint2 &
xscreensaver -no-splash &
#feh --bg-center ~/.themes/fon.png &
#torchat &
#volti &
google-chrome https://mail.google.com/ http://habrahabr.ru/posts/collective/ https://web.skype.com/ru/ &
setxkbmap us,ru -option grp_led:caps,grp:caps_toggle,compose:ralt,grp:rwin_switch &
numlockx &
dropbox start &
xxkb &
#pidgin &
transmission-gtk &

