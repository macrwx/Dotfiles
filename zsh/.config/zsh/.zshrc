[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

HISTFILE="$HOME/.local/share/zsh/zsh-history"

eval "$(starship init zsh)"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

plug "zsh-users/zsh-completions"

fpath=("$HOME/.local/share/zap/plugins/zsh-completions/src" $fpath)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
