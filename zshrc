# SETUP
export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dracula-pro"

# plugins
plugins=(asdf tmux git bundler)
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# nvim
export EDITOR='nvim'

