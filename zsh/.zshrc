export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug "plugins/gh", from:gh-r
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-autosuggestions', defer:2
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

zplug load

for zsh_source in $HOME/dotfiles/zsh/configs/*.zsh; do
  source $zsh_source
done

ensure_tmux_is_running

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# mise package manager
eval "$(mise activate zsh)"

# Standard Innovation intro - show when entering automation directory
function chpwd() {
  if [[ "$PWD" == "/Users/temullen/code/automation" ]]; then
    standard-innovation-intro
  fi
}
