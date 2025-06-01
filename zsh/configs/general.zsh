# General ZSH configurations

export EDITOR="vim"

alias vim=nvim

sz() { source ~/.zshrc }


first() { awk '{print $1}' }
second() { awk '{print $2}' }
sum() { paste -sd+ - | bc }

igrep() { grep -i $@ }
