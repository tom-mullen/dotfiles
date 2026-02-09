# General ZSH configurations

export EDITOR="vim"

alias vim=nvim

sz() { source ~/.zshrc }


first() { awk '{print $1}' }
second() { awk '{print $2}' }
sum() { paste -sd+ - | bc }

igrep() { grep -i $@ }

itree() {
  if [ -f .gitignore ]; then
    tree -I "$(cat .gitignore | paste -s -d'|' -)" -C | less -R
  else
    tree -I node_modules -C
  fi
}

cdup() {
  cd "$(git rev-parse --show-toplevel)"
}
