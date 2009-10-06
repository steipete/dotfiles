#!/bin/sh

if [ -x `which git` ]; then
	. ~/.bashrc.d/git-completion.sh
	. ~/.bashrc.d/git-shortcuts.sh
fi
export PS1="\[\033[0;33m\]\$(__git_ps1 '%s ')\[\033[00m\]$PS1"
