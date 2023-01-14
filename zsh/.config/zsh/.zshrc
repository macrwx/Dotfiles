[ -f "$XDG_DATA_HOME/zap/zap.zsh" ] && source "$XDG_DATA_HOME/zap/zap.zsh"

zstyle ":completion" use-xdg-dirs 'yes'
zstyle ":history" use-xdg-dirs 'yes'

for plugin in $ZDOTDIR/plugins/*; do
  source $plugin
done

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-completions"

eval "$(starship init zsh)"
