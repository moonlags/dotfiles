#!/usr/bin/env bash

get_url() {
  playerctl metadata --format "{{xesam:url}}"
}

show_status() {
  player=$1
  url=$2
  if [ "$player" == "firefox" ] && [[ "$(get_url)" != *"$url"* ]]; then
    echo "" && exit
  fi

  status=$(playerctl --player="$player" status 2>/dev/null)
  if [ "$status" == "Playing" ]; then
    icon=" "
  elif [ "$status" == "Paused" ]; then
    icon=" "
  else
    echo "" && exit
  fi

  metadata=$(playerctl --player="$player" metadata --format "{{artist}} - {{title}}" 2>/dev/null)
  if [ -n "$metadata" ]; then
    echo -e "$icon$metadata"
  else
    echo ""
  fi
}

case "$1" in
  --player)
    case "$3" in
    --url)
      show_status "$2" "$4";;
    *)
      echo "Usage: $0 --player <player_name> [--url <url>]";;
    esac;;
  *)
    echo "Usage: $0 --player <player_name> [--url <url>]";;
esac
