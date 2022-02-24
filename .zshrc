export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -s "/Users/kayvon/.nvm/nvm.sh" ] && . "/Users/kayvon/.nvm/nvm.sh" # This loads nvm

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

eval "$(starship init zsh)"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kayvon/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kayvon/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kayvon/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kayvon/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

