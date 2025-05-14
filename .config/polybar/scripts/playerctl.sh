#!/bin/sh

trim_string() {
    local str="$1"
    local max_length="${2:-60}"

    if [ ${#str} -le $max_length ]; then
	echo "$str"
    else
	echo "$(echo "$str" | cut -c 1-"$max_length")..."
    fi
}

playerctlstatus=$(playerctl status 2> /dev/null)
url=$(playerctl metadata xesam:url 2> /dev/null)

case "$url" in
    *soundcloud*)
	artist_title=$(trim_string "$(playerctl metadata xesam:artist) - $(playerctl metadata xesam:title)")
	if [ "$playerctlstatus" = "Playing" ]; then
	    echo " $artist_title  %{A1:playerctl play-pause:} %{A}"
	else
	    echo " $artist_title  %{A1:playerctl play-pause:} %{A}"
	fi
	;;
    *)
	echo " Offline "
	;;
esac
