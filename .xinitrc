pipewire &

dunst &

[ ! -d "$HOME/.local/state/mpd" ] && mkdir -p "$HOME/.local/state/mpd"
[ ! -d "$HOME/.local/share/mpd/playlists" ] && mkdir -p "$HOME/.local/share/mpd/playlists"

[ ! -s ~/.config/mpd/pid ] && mpd

xinput set-prop "9" "libinput Accel Profile Enabled" 0 1 0
xset b off
setxkbmap us,ru -option 'grp:alt_shift_toggle,caps:ctrl_modifier'

xsetroot -solid gray

exec dbus-run-session spectrwm
