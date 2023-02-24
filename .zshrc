# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export GPG_TTY=$(tty)
export EDITOR=nvim

# Needed if using alacritty otherwise things like vim act lost
export TERM=xterm-256color

# Start Oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(git)
source $ZSH/oh-my-zsh.sh
# End Oh-my-zsh stuff

HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000

export EDITOR=nvim

export GOPATH=~/go

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$GOPATH/bin:/snap/bin

alias snapcraft='docker run -it --rm -v "$PWD:$PWD" -w "$PWD" -v "$HOME/.config/snapcraft:/root/.config/snapcraft" snapcore/snapcraft snapcraft'
alias mongorestore='docker run --rm -v $PWD:$PWD -w "$PWD" --link db:db mongo mongorestore --host=db'
alias mongodump='docker run --rm -v $PWD:$PWD -w "$PWD" --link db:db mongo mongodump --host=db'
alias mongo='docker run -it --rm -v $PWD:PWD -w "$PWD" --link db:db mongo mongo --host=db'
alias redis-cli='docker run -it --rm -v $PWD:PWD -w "$PWD" redis redis-cli'
alias jekyll='docker run -it --rm -v $PWD:$PWD -w $PWD -p 4000:4000 jekyll/jekyll jekyll'

alias butane='podman run --rm --interactive       \
              --security-opt label=disable        \
              --volume ${PWD}:/pwd --workdir /pwd \
              quay.io/coreos/butane:release'


alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH="/usr/local/opt/node@8/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/aaron/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
