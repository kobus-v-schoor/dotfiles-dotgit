#! /bin/bash

export EDITOR=vim
export SUDO_EDITOR=vim
export DIFFPROG='vim -d'
export LS_COLORS=$LS_COLORS:'di=1;35:'

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
