# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History configuration
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups
HISTFILE=~/.local/state/bash/history

# Create history directory if it doesn't exist
[ -d ~/.local/state/bash ] || mkdir -p ~/.local/state/bash

# History options
shopt -s histappend
shopt -s histverify
shopt -s autocd
shopt -s checkwinsize

# Make bash append to history file rather than overwriting it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Case-insensitive completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Aliases
alias ssh="TERM=linux ssh"

# Upload function
upload() {
  echo "$(curl -Ffile=@$1 https://0x0.st)"
}

# Key bindings for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Colors
GREEN='\[\033[0;32m\]'
RESET='\[\033[0m\]'

# Set colorful PS1
PS1="${GREEN}\w${RESET} > "

# vim: set et sw=2 sts=2 tw=78 ft=sh:
