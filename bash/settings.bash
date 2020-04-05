# History options
export HISTCONTROL=ignoredups:erasedups
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1048576
export HISTFILESIZE=1048576
export SAVEHIST=$HISTSIZE

# Bash options
shopt -s histappend

# Default editor
export EDITOR=nvim
export VISUAL=nvim

# Golang
# XXX: Is it a good place to keep this conf in?
export GOPATH="/Users/${USER}/Development/golang"
export GOROOT=/usr/local/opt/go/libexec
export GO111MODULE=on
PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/Users/${USER}/Library/Python/3.7/bin

# Fix locale complains
export LC_ALL=en_US.UTF-8
