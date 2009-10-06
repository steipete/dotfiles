#!/bin/sh

case "$TERM" in
	xterm*|rxvt*|screen*)
	PS1='${debian_chroot:+($debian_chroot)}\[\033[0;32m\]\u@\h\[\033[00m\] \[\033[00m\]\w\[\033[00m\] \$ '
	#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
	;;
	*)
	;;
esac
HISTCONTROL=ignoreboth
shopt -s checkwinsize
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

