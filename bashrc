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


export PS1="[\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`][\e[0m \e[0;33m\]\w\[\e[0m]\e[0;31m\]\$(__git_ps1 \"[%s]\")\[\e[0m\] -> "

# User specific aliases and functions
umask  002
export CSCOPE_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
alias ls="ls --color"
set -o vi

#unset PROMPT_COMMAND
#
#if [ -z "$STY" ]; then
#	screen -dRR
#fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
bind -x '"\C-l": clear;'
