# Claude Code saves settings.json by writing a new file, which replaces the
# stow link (e.g. on a plugin install). Warn, so the change reaches the repo.
if [[ -e ~/.claude/settings.json && ! -L ~/.claude/settings.json ]]; then
  print -u2 "~/.claude/settings.json is not a link to dotfiles. Copy wanted changes to ~/dotfiles/claude/.claude/settings.json, then: mv ~/.claude/settings.json{,.bak} && stow -d ~/dotfiles -t ~ -R claude"
fi
