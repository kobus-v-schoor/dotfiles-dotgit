#! /bin/bash

export EDITOR=nvim
export DIFFPROG='nvim -d'
export LS_COLORS=$LS_COLORS:'di=1;35:'

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
