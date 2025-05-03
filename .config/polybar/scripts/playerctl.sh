#!/bin/sh

playerctlstatus=$(playerctl status 2> /dev/null)
url=$(playerctl metadata xesam:url 2> /dev/null)

case "$url" in
    *soundcloud*)
	if [ "$playerctlstatus" = "Playing" ]; then
	    echo " $(playerctl metadata xesam:artist) - $(playerctl metadata xesam:title)   "
	else
	    echo " $(playerctl metadata xesam:artist) - $(playerctl metadata xesam:title)   "
	fi
	;;
    *)
	echo " Offline "
	;;
esac
