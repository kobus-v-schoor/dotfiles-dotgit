[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s autocd

alias v=vim
alias sv='sudoedit'

alias ls='ls -lh --color=auto'
alias lsa='ls -lha --color=auto'
alias sl=ls

alias grep='grep --color=auto'
alias rm='rm -I'
alias du='du -h'

PS1='\[$(tput setaf 74)\]\u@\h \w >\[$(tput sgr0)\] '

[ -f ~/.bash_extra ] && source .bash_extra
[ -f ~/.bash_local ] && source .bash_local
