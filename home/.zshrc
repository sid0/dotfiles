# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 100000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias m=mosh --ssh="ssh -a"


function precmd() {
	print -Pn "\033]0;%~\007"
}
function preexec() {
	print -Pn "\e]0;$1\a"
}

export EDITOR=vim

# Hope pyenv and rbenv are installed!
eval "$(pyenv init -)"
eval "$(rbenv init -)"

function _sourcebk() {
	# grab the backup version of the script from within the dotfiles directory
	local bk="${0:A:h}/bk/${1:t}"
	if [[ -f "$1" ]]; then
		source "$1"
	elif [[ -f "$bk" ]]; then
		source "$bk"
	fi
}

_sourcebk ~/.iterm2_shell_integration.zsh
_sourcebk /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
_sourcebk /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# history up and down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
