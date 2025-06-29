pipewire &

dunst &

xinput set-prop "12" "libinput Accel Profile Enabled" 0 1 0
xset b off
setxkbmap us,ru -option 'grp:alt_shift_toggle,caps:ctrl_modifier'

xsetroot -gray

exec dbus-run-session spectrwm
