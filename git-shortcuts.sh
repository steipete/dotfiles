#!/bin/sh


##################
# git section
#
alias g="git "
alias gs='git status'
alias gst='git status'
alias gsub='git submodule'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias ga='git add'
alias gc='git commit -v'
alias gci='git commit -v -m'
alias gca='gc -a'
alias gb='git branch'
alias gl='git log'
alias gpl='git pull origin master'
alias gp='git push'
alias gpp='git pull; git push'

function gco {
	if [ -z "$1" ]; then
		git checkout master
	else
		git checkout $1
	fi
}

function st {
	if [ -d ".svn" ]; then
		svn status
	else
		git status
	fi
}

if [ -x `which colordiff` ]; then
	alias diff=colordiff
	function cvsdiff () { cvs diff $@ | colordiff; }
	function svndiff () { svn diff $@ | colordiff; }
fi
#
##################


