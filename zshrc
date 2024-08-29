# SETUP

# oh-my-zsh
ZSH_THEME='gozilla'
export ZSH=$HOME/.oh-my-zsh
plugins=(asdf git bundler)
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# tmux
if [[ ! $TERM =~ screen ]]; then
  exec tmux
fi

# vim
export EDITOR='vim'

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

export PATH="${HOME}/.pyenv/shims:${PATH}"
export PATH="${HOME}/.pyenv/shims:${PATH}"

. /usr/local/opt/asdf/libexec/asdf.sh
