export ZDOTDIR=$HOME/.config/zsh
export EDITOR="nvim"
export BROWSER="firefox"

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi
