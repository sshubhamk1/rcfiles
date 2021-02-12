# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# shobhit's updates
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
else
    source ~/.git-prompt.sh
fi

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

export PS1="[\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`][\[\e[0;32m\]\u@\h\[\e[0m \e[0;36m\]j:\j p:\$( ps -eo user=|sort|uniq -c|grep shokumar|tr -s \" \"|cut -d\" \" -f2)\[\e[0m \e[0;33m\]\W\[\e[0m]\e[0;31m\]\$(__git_ps1 \"[%s]\")\[\e[0m\] -> "

# User specific aliases and functions
umask  002
export CSCOPE_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
alias ls="ls --color"
set -o vi
