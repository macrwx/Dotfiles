[ -f "$XDG_DATA_HOME/zap/zap.zsh" ] && source "$XDG_DATA_HOME/zap/zap.zsh"

zstyle ":completion" use-xdg-dirs "yes"
zstyle ":history" use-xdg-dirs "yes"

for plugin in $ZDOTDIR/plugins/*; do
  source $plugin
done

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-completions"

setopt nobeep

alias ls="exa --group-directories-first --icons"
alias ll="ls -lh"
alias la="ll -a"
alias tree="ll --tree --level=2"

eval "$(starship init zsh)"
