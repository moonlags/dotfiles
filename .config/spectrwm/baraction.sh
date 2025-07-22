#!/bin/sh

network() {
  echo "$(ip route | grep default | awk '{print $5}' | head -1)"
}

volume () {
  vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%\n", $2*100}')
  echo "Vol ${vol}"
}

# Echo the amount of memory currently being used.
memory () {
  mem=$(free -m | awk '/^Mem:/{print $3}')
  echo "Mem ${mem}MiB"
}

keyboard_layout() {
    echo "$(xkblayout-state print '%s')"
}

# Update the bar utilities every five seconds.
while :; do
  echo "$(network)  ∙  $(memory)  ∙  $(keyboard_layout)  ∙  $(volume) "
  sleep 5
done
