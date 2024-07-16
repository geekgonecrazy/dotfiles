# dotfiles

## Pre-req
* brew - mac
* go
* tmux
* neovim
* fzf -- needed by telescope neovim plugin
* [starship](https://starship.rs)
* [Atuin](https://atuin.sh/)

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

### Tmux 
To initialize tmux plugins:

prefix + I (capital i, as in Install) to fetch the plugins

### Neovim

Launch nvim and do `:PackerInstall`  from here Mason should kick off and start installing some other needed plugins
