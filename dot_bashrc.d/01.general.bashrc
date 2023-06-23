#!/bin/bash
export EDITOR="vim"
export PATH="$HOME/.local/bin:$PATH"

#if [ ! -z "$DISPLAY" ]; then
#     xrdb -merge ~/.Xresources
#fi

export PS1="\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\\$ \[$(tput sgr0)\]"

alias reboot="echo 'use sudo for reboot'"
alias poweroff="echo 'use sudo for poweroff'"

if which thefuck 2>&1 >> /dev/null ; then
	eval "$(thefuck --alias)"
	alias f="fuck"
fi

alias g="git"
alias gl="git log"
alias gl1="git log --oneline"

git-config-add-remote-to-fetch() {
    git config --local --add remote.origin.fetch +refs/heads/$1:refs/remotes/origin/$1
}

alias grep-cwd-parallel='find . -type f -print0 | xargs -0 -P 32 -n 50 grep --color=always '

# export XDG_CURRENT_DESKTOP=GNOME

[ ! -f "$HOME/.cargo/env" ] || . "$HOME/.cargo/env"

export CCACHE_DIR=~/.ccache
export CCACHE_MAXSIZE=20G
