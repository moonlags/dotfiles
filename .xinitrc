pipewire &

dunst &

xinput set-prop "9" "libinput Accel Profile Enabled" 0 1 0
xset b off
setxkbmap us,ru -option 'grp:alt_shift_toggle,caps:ctrl_modifier'

xsetroot -solid black

exec dbus-run-session spectrwm
