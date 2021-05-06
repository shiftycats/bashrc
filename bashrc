#!/bin/bash
# Minimal bashrc with reasonable defaults 

# Make sure we're running in an interactive shell.
if [ -z "$PS1" ]; then return; fi

# Save the location where this file resides.
BASHRC_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Update window size after each command.
shopt -s checkwinsize 

# Avoid spooky accidents.
set -o noclobber # Use >| instead of > to overwrite files
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# COMPLETION

bind "TAB: menu-complete"
bind "'\e[Z': menu-complete-backward"

bind "set menu-complete-display-prefix on"
bind "set show-all-if-ambiguous on"
bind "set completion-display-width -1"
bind "set colored-stats on"     
bind "set bell-style none"

bind "set completion-ignore-case on" 
bind "set completion-map-case on"
bind "set mark-symlinked-directories on"

# HISTORY

# Bind up/down arrow keys to cycle through history matches.
bind "'\e[A': history-search-backward"
bind "'\e[B': history-search-forward" 

shopt -s histappend # Append to history file intead of overwriting it
shopt -s cmdhist    # Squash multi-line commands into one line

HISTSIZE=100000
HISTFILESIZE=1000000
HISTTIMEFORMAT="%F %T " #  Use ISO 8610 timestamps
HISTCONTROL=ignoreboth  #  Ignore duplicates and commands #+ that start
                        #+ with space

# A list of commands to exlude from history.
HISTIGNORE="ls:[bf]g:history:clear:exit:pwd"

# Save commands immediately after their execution.
if [[ "$PROMPT_COMMAND" != *"history -a"* ]]; then
  PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND};}history -a"
fi

# SOURCE LOCAL STUFF

source_dir() {
  # Usage: source_dir DIRECTORY
  if [ $# -eq 0 ]; then return 1; fi

  # Remove trailing slashes
  local dir="$(shopt -s extglob; echo ${1%%+(/)})" 

  if [ -d "$dir" ]; then
    for file in $dir/*; do
      if [ -f "$file" ]; then source "$file"; fi
    done
  fi
}

if [ -f "${HOME}/.bashrc.local" ]; then
  source "${HOME}/.bashrc.local"
fi
