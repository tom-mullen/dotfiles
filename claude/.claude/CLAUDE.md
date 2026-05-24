# User-level guidance for Claude Code sessions
Tom Mullen · tom@standard-innovation.com

## Prefer these CLIs over verbose alternatives

When the task can be done by one of the tools below, use it instead of
curl-ing APIs, constructing URLs by hand, or chaining many generic commands.

| Want to … | Use | Notes |
|---|---|---|
| Read CRM data (HubSpot) | `si hubspot contacts/companies/deals …` | Never curl HubSpot directly. `--account NAME` is required. |
| Read a 1Password field | `si op get -v V -a A -i I -f F` | Decodes JSON escapes correctly. Don't shell out to `op` directly. |
| Write a 1Password field | `si op set … [--create]` | Reads value from stdin so secrets never touch argv. |
| Drive Gmail / Drive / Calendar | `gws` (googleworkspace-cli) | Official Workspace CLI. Don't curl Google APIs. |
| HubSpot CMS / app dev | `hs` (`@hubspot/cli`) | For CMS modules, themes, serverless functions. Not CRM data. |
| Anything on GitHub | `gh` | `gh pr view --web`, `gh repo clone`, `gh pr create`, `gh api …` |
| Complex git operations | `lazygit` | When chaining several git commands gets noisy — interactive TUI. |
| Run / manage git hooks | `lefthook run <hook>` | Don't invoke formatters individually if a lefthook target exists. |
| Project-level workflows | `task <target>` if a Taskfile is present | Read the Taskfile first to see available targets. |
| Drive (rclone remote) | `rclone …` against `gdrive_standard_innovation:` | The configured remote. |
| Deploy / ops on Kamal services | `kamal deploy / console / setup / app logs` | Prefer the kamal CLI over manual ssh + docker. |
| Install brew deps | `brew bundle` against the repo's Brewfile | Not `brew install foo` one-by-one. |

Where a vendor CLI covers the need, prefer it. The custom `si` CLI exists
only for what vendor CLIs don't reach: HubSpot CRM data and a JSON-safe
1Password wrapper.

## Bash tool quirks

- Shell aliases in `~/.aliases` (`gs`, `gd`, `gl`, `ghcl`, …) **don't work**
  through the Bash tool — it runs non-interactively. Use the canonical
  commands (`git status`, `git diff`, `git log`, etc.).
- `cd` doesn't persist across Bash calls — use absolute paths.
- The `chpwd` zsh hook prints the Standard Innovation banner on `cd` into
  `~/code/automation`. It's expected output, not an error.

## Workflow preferences

- nvim is the editor; for review of large diffs / verbose output, suggest
  opening in a tmux popup (`tmux-popup '<cmd>'`) rather than dumping inline.
- `git push` and `git commit` are **never** pre-approved at user level —
  wait for explicit instruction. Reads, pulls, builds, tests, linters and
  task/lefthook invocations are pre-approved (see `~/.claude/settings.json`).
  Specific repos may pre-approve commit/push in their own
  `.claude/settings.json` — respect that scope.
