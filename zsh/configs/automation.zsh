# Automatically update and sync dotfiles
sync_dotfiles() {
  /Users/temullen/dotfiles/bin/bin/dotfiles-sync
}

# Wrapper for brew to auto-dump and sync
brew() {
  local command="$1"
  command brew "$@"

  case "$command" in
    install|uninstall|tap|untap|upgrade)
      echo "📦 Updating Brewfile..."
      sync_dotfiles
      ;;
  esac
}

# Check git status for unpushed/unpulled changes in the current directory
check_git_sync() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # If we are in the dotfiles directory, just sync it automatically
    if [[ "$PWD" == "$HOME/dotfiles" ]]; then
      sync_dotfiles
      return
    fi

    echo "Checking git status for $(basename "$PWD")..."
    git fetch --quiet &
    
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
      local status=$(git status --porcelain)
      local unpushed=$(git log @{u}..HEAD 2>/dev/null | wc -l)
      local unpulled=$(git log HEAD..@{u} 2>/dev/null | wc -l)

      if [[ -n "$status" ]]; then
        echo "⚠️  Uncommitted changes!"
      fi
      if [[ "$unpushed" -gt 0 ]]; then
        echo "⬆️  $unpushed commits to push."
      fi
      if [[ "$unpulled" -gt 0 ]]; then
        echo "⬇️  $unpulled commits to pull! (Run 'git pull')"
      fi
      
      if [[ -n "$status" || "$unpushed" -gt 0 || "$unpulled" -gt 0 ]]; then
        echo "Press any key to continue or Ctrl-C to stop..."
        read -k 1 -s
      fi
    fi
  fi
}
