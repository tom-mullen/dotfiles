# Pure Prompt Configuration with Standard Innovation Colors
# This configures the sindresorhus/pure prompt with custom colors

# Standard Innovation color scheme for Pure
# Pure uses zstyle for configuration

zstyle :prompt:pure:prompt color magenta

# Path color (green lime)
zstyle :prompt:pure:path color yellow

# Git branch color (green neon)
zstyle :prompt:pure:git:branch color cyan

# Prompt symbol colors
zstyle :prompt:pure:prompt:success color magenta
zstyle :prompt:pure:prompt:error color magenta

# Git status colors
zstyle :prompt:pure:git:dirty color magenta
zstyle :prompt:pure:git:arrow color cyan

# Execution time color
zstyle :prompt:pure:execution_time color green

# Other Pure options
zstyle :prompt:pure:git:stash show yes # show stash indicator
zstyle :prompt:pure:prompt:continuation color magenta #pink

# Optional: Change the prompt symbol (default is ❯)
# export PURE_PROMPT_SYMBOL='❯'
# export PURE_PROMPT_VICMD_SYMBOL='❮'  # for vi mode

# Optional: Show git status info
export PURE_GIT_DOWN_ARROW='⇣'
export PURE_GIT_UP_ARROW='⇡'
export PURE_GIT_STASH_SYMBOL='≡'
