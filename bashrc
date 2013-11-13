
[[ $- != *i* ]] && return

export TERM="screen-256color"
export EDITOR="vim"

bind '"\e[1;3A":history-search-backward'
bind '"\e[1;3B":history-search-forward'

export LS_COLORS="di=01;37:fi=00;35"
alias ls='ls --color=auto'
if [ "$PS1" == "" ]; then
    PS1='[\u@\h \W]\$ '
fi

alias minicom="minicom -w"
alias s="sudo"
alias pwroff="sudo poweroff"
alias mm="make menuconfig"
alias m="make"
alias ps="ps -ef"
alias vim="vim --servername VIM"
alias bvim="vim -u NONE -U NONE -N"
alias bgvim="gvim -u NONE -U NONE -N"

export PATH=$PATH:/sbin
export PATH=$PATH:~/.gem/ruby/1.9.1/bin
export PATH=$PATH:/opt/flex-sdk/bin

export NODE_PATH=/usr/lib/node_modules:$NODE_PATH
export NODE_PATH=/usr/lib/jsctags:$NODE_PATH

BASHCOMPLETE_RCDIR="/etc/bash_completion.d"
for i in "$BASHCOMPLETE_RCDIR"/*; do
    if [ -x "$BASHCOMPLETE_RCDIR/$i" ]; then
        source "$BASHCOMPLETE_RCDIR/$i"
    fi
done

if [ -e "$HOME/.bashrc.local" ]; then
    source "$HOME/.bashrc.local"
fi
