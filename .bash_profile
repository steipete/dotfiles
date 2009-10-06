PATH=/opt/local/bin:/opt/local/sbin:/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/bin:$PATH:$HOME/bin:/usr/local/bin
alias lc=ls
SHELL=/bin/bash
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PS1="\u@\w\$ "
export TERM=xterm-color

MANPATH=${MANPATH}:/opt/local/man
export PAGER="less -E -r"

alias ..="cd .."
alias ...="cd ../.."

# helper for web development
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'
alias apachestart='sudo /opt/local/apache2/bin/apachectl start'

# jumplist code is there
source ~/.bashrc

# support bash_completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# better support for git!
. ~/.bashrc.d/misc-env.sh 
. ~/.bashrc.d/aliases
. ~/.bashrc.d/rails.sh
. ~/.bashrc.d/path.sh 
. ~/.bashrc.d/terminal.sh 
. ~/.bashrc.d/git.sh