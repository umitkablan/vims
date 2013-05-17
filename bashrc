
[[ $- != *i* ]] && return

export TERM="xterm-256color"

bind '"\e[A":history-search-backward'
bind '"\e[A":history-search-backward'

export LS_COLORS="di=01;37:fi=00;35"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias minicom="minicom -w"
alias s="sudo"
alias pwroff="sudo poweroff"

export PATH=/sbin:$PATH
export PATH=~/.gem/ruby/1.9.1/bin:$PATH
export PATH=/opt/flex-sdk/bin:$PATH

export NODE_PATH=/usr/lib/node_modules:$NODE_PATH
export NODE_PATH=/usr/lib/jsctags:$NODE_PATH

BASHCOMPLETE_RCDIR="/etc/bash_completion.d"
for i in $(ls "$BASHCOMPLETE_RCDIR"); do
    if [ -x "$BASHCOMPLETE_RCDIR/$i" ]; then
        source "$BASHCOMPLETE_RCDIR/$i"
    fi
done
