#!/bin/sh


alias sc='script/console'
alias ss='script/server' # start up the beast; use "ss -d" to detach
alias sg='script/generate'



export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
	COMPREPLY=($(compgen -W "`rake -s -T | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
	return 0
}
complete -o default -o nospace -F _rakecomplete rake
