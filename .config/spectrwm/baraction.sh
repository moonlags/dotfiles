#!/bin/sh

volume () {
  vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%\n", $2*100}')
  echo "vol ${vol}"
}

keyboard_layout() {
    echo "$(xkblayout-state print '%s')"
}

# Update the bar utilities every five seconds.
while :; do
  echo "$(keyboard_layout)  ∙  $(volume) "
  sleep 5
done
