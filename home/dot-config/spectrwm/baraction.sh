#!/bin/sh

volume () {
  vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%\n", $2*100}')
  echo "vol ${vol}"
}

cpu_usage() {
  usage=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')
  echo "cpu ${usage}%"
}

mem_usage() {
  usage=$(free | awk '/Mem/ {printf "%d", $3/$2*100}')
  echo "mem ${usage}%"
}

# Update the bar utilities every five seconds.
while :; do
  echo "$(volume)  ∙  $(cpu_usage)  ∙  $(mem_usage) "
  sleep 1
done
