# dotfiles

Get your machine purring with this selection of dotfiles.

## Requirements

Use zsh as your default shell:

```
chsh -s $(which zsh)
```

Install [rcm](https://github.com/thoughtbot/rcm):

```
brew tap thoughtbot/formulae
brew install rcm
```

## Installation

```
git clone https://github.com/DVELP/dotfiles.git ~/dotfiles
```

Install the dotfiles with rcm:

```
env RCRC=$HOME/dotfiles/rcrc rcup
```

After the initial installation, you can run rcup without the one-time variable
RCRC being set (rcup will symlink the repo's rcrc to ~/.rcrc for future runs of
rcup). See example.

This command will create symlinks for config files in your home directory.
Setting the RCRC environment variable tells rcup to use standard configuration
options:

* Exclude the README.md and LICENSE files, which are part of the dotfiles
repository but do not need to be symlinked in.
* Give precedence to personal overrides which by default are placed in
~/dotfiles-local
* Please configure the rcrc file if you'd like to make personal overrides in a
different directory

## Update

You can update your dotfiles by pulling the repo and running:

```
rcup
```

## License

The code is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
