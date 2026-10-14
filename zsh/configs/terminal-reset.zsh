# A dropped ssh session leaves the remote app's terminal modes enabled, so
# scrolling in the pane prints escape sequences at the prompt. Each time the
# prompt is drawn, turn off mouse tracking (1000/1002/1003/1006/1015), focus
# reporting (1004), application cursor keys (1), the alternate screen (1049)
# and modifyOtherKeys, show the cursor (25), and pop kitty keyboard flags.
_reset_terminal_modes() {
  [[ -t 1 ]] || return
  printf '\e[?1000l\e[?1002l\e[?1003l\e[?1006l\e[?1015l\e[?1004l\e[?1l\e[?1049l\e[>4;0m\e[?25h\e[<u'
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _reset_terminal_modes
