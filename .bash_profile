export CC='gcc'
export CXX='g++'
export EDITOR='vim'
export PAGER='less'

export GOPATH="$HOME/src/go"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

[[ -f /etc/bash_completion ]] && source /etc/bash_completion
[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc
