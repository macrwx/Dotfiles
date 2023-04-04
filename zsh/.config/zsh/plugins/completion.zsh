if zstyle -T ":completion" use-xdg-dirs; then
  _cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
  [[ -d "$_cache_dir" ]] || mkdir -p "$_cache_dir"

  _zcompdump="$_cache_dir/zcompdump"
  _zcompcache="$_cache_dir/zcompcache"
else
  _zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  _zcompcache="${ZDOTDIR:-$HOME}/.zcompcache"
fi

zstyle ":completion::complete:*" use-cache on
zstyle ":completion::complete:*" cache-path "$_zcompcache"
zstyle ':completion:*' menu yes select

autoload -Uz compinit
_comp_files=($_zcompdump(Nmh-20))
if (( $#_comp_files )); then
  compinit -i -C -d "$_zcompdump"
else
  compinit -i -d "$_zcompdump"
  touch "$_zcompdump"
fi

unset _zcompdump _zcompcache _comp_files _cache_dir
