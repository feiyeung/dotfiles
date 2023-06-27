#!/bin/bash

# for initial population. early exit if autocomplete script already exist 
script="$HOME/.bashrc.d/03.chezmoi_complete.bashrc"
[ -e "$script" ] && return 0

echo "populate chezmoi autocomplete script for the first time"
chezmoi=""
if which chezmoi 2>&1 >> /dev/null ; then
	chezmoi="chezmoi"
else
	[ ! -f "$HOME/bin/chezmoi" ] || chezmoi="$HOME/bin/chezmoi" 
fi

$chezmoi completion bash --output="$script"
chmod +x "$script"
source "$script"
