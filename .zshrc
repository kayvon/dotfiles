
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -s "/Users/kayvon/.nvm/nvm.sh" ] && . "/Users/kayvon/.nvm/nvm.sh" # This loads nvm

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
