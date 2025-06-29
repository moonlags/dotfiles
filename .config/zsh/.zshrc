if [[ -r "~/.cache/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "~/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ];then
	mkdir -p "$ZINIT_HOME"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

PROMPT_EOL_MARK=

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

[ -d ~/.cache/zsh ] || mkdir -p ~/.cache/zsh
zstyle ':completion:*' cache-path ~/.cache/zsh/zcompcache
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

zinit cdreplay -q

HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

[ -d ~/.local/state/zsh ] || mkdir -p ~/.local/state/zsh
HISTFILE=~/.local/state/zsh/history

setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt sharehistory
setopt appendhistory
setopt autocd
setopt interactive_comments

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf=preview 'ls --color $realpath'

eval "$(fzf --zsh)"

alias ls="ls --color"
alias ssh="TERM=linux ssh"

alias xi="doas xbps-install"
alias xr="doas xbps-remove"

upload() {
  echo "$(curl -Ffile=@$1 https://0x0.st)"
}

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
