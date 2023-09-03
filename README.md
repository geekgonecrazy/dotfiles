# dotfiles

## Pre-req
* tmux
* neovim
* [starship](https://starship.rs)

Alias created as config that will reference the repo.

To pull into a new system:

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/geekgonecrazy/dotfiles.git $HOME/.dotfiles

config config --local status.showUntrackedFiles no

config checkout

# bring in any submodules
config submodule update --init --recursive

source .zshrc
```

To initialize tmux plugins:

prefix + I (capital i, as in Install) to fetch the plugins
