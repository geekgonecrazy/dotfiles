# dotfiles

Alias created as config that will reference the repo.

Current zshrc depends on this:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

To pull into a new system:

``` 
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare https://github.com/geekgonecrazy/dotfiles.git $HOME/.dotfiles

config config --local status.showUntrackedFiles no

config checkout

source .zshrc
```
