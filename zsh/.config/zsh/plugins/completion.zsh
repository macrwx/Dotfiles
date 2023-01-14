if zstyle -T ':completion' use-xdg-dirs; then
  _cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh
  [[ -d "$_cache_dir" ]] || mkdir -p "$_cache_dir"

  _zcompdump="$_cache_dir/compdump"
  _zcompcache="$_cache_dir/compcache"
else
  _zcompdump="${ZDOTDIR:-$HOME}/compdump"
  _zcompcache="${ZDOTDIR:-$HOME}/compcache"
fi

setopt AUTO_LIST          # Automatically list choices on an ambiguous completion. 
setopt ALWAYS_TO_END      # Move cursor to the end of completed word.
setopt AUTO_MENU          # Show completion menu on <TAB> press.
setopt MENU_COMPLETE
setopt EXTENDED_GLOB

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$_zcompcache"

autoload -Uz compinit
_comp_files=($_zcompdump(Nmh-20))
if (( $#_comp_files )); then
  compinit -i -C -d "$_zcompdump"
else
  compinit -i -d "$_zcompdump"
  touch "$_zcompdump"
fi

unset _zcompdump _zcompcache _comp_files _cache_dir
