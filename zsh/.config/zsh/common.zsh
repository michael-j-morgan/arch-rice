alias vi="nvim"
alias vim="nvim"

source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS

typeset -U path PATH
path=("$HOME/.local/bin" $path)
