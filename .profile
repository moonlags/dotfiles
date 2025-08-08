export ENV="~/.config/oksh/rc"
export EDITOR="nvim"
export BROWSER="firefox"
export TERM="alacritty"

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi
