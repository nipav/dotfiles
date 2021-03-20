export CC='/usr/bin/clang'
export CXX='/usr/bin/clang++'
export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/less'

export GOPATH="$HOME/.golang"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

[[ -f /etc/bash_completion ]] && source /etc/bash_completion
[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc
