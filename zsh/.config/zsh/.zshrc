[ -f "$XDG_DATA_HOME/zap/zap.zsh" ] && source "$XDG_DATA_HOME/zap/zap.zsh"
[ -f "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"

zstyle ":completion" use-xdg-dirs "yes"
zstyle ":history" use-xdg-dirs "yes"

for plugin in $ZDOTDIR/plugins/*; do
  source $plugin
done

plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-completions"

setopt NOBEEP

alias ls="exa --group-directories-first --icons"
alias ll="ls -lh"
alias la="ll -a"
alias tree="ll --tree --level=2"
alias cat="bat"

pcd() { 
  cd $(find "$HOME/Programming" -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | fzf || pwd)
}

ped() { 
  find "$HOME/Programming" -name ".git" 2> /dev/null | sed 's/\/.git/\//g' | fzf | xargs -r nvim
}

ss() { 
  eval "$(xdotool selectwindow getwindowgeometry --shell)"
  region="${WIDTH}x${HEIGHT}+${X}+${Y}" 
  flameshot gui --region "$region"

  unset region
}

eval "$(starship init zsh)"
