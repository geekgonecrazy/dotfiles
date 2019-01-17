# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export GPG_TTY=$(tty)

# Start Oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(git)
source $ZSH/oh-my-zsh.sh
# End Oh-my-zsh stuff

export GOPATH=~/go

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$GOPATH/bin:/snap/bin

alias snapcraft='docker run -it --rm -v "$PWD:$PWD" -w "$PWD" snapcore/snapcraft snapcraft' 
alias mongorestore='docker run --rm -v $PWD:$PWD -w "$PWD" --link db:db mongo mongorestore --host=db'
alias mongodump='docker run --rm -v $PWD:$PWD -w "$PWD" --link db:db mongo mongodump --host=db'
alias mongo='docker run -it --rm -v $PWD:PWD -w "$PWD" --link db:db mongo mongo --host=db'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export PATH="/usr/local/opt/node@8/bin:$PATH"
