source "$HOME/.config/zsh/common.zsh"

if (( $+commands[pacman] )); then
  source "$HOME/.config/zsh/arch.zsh"
fi
