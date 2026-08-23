alias vi="nvim"
alias vim="nvim"

source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

export PATH="$HOME/.local/bin:$PATH"
