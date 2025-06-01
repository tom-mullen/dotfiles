# Color settings

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Configure zsh-syntax-highlighting colors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
