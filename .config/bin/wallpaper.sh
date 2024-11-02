#!/usr/bin/env sh

get_random_wallpaper() {
    find ~/.config/wallpapers/ -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1
}

set_wallpaper() {
  local wallpaper = "$1"
  swww img "$wallpaper" \
    --transition-bezier .43,1.19,1,.4 \
    --transition-type grow \
    --transition-duration 0.4 \
    --transition-fps 75 \
    --invert-y \
    --transition-pos "$(hyprctl cursorpos | grep -E '^[0-9]' || echo "0,0")"
}

wallpaper=$(get_random_wallpaper)

set_wallpaper "$wallpaper"
