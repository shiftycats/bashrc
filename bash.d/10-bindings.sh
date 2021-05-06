#!/bin/bash

set -o vi

bind "'\C-j': history-search-backward"
bind "'\C-k': history-search-forward"
bind "'\C-h': backward-char"
bind "'\C-l': forward-char"

# Get last command with `!!<space>`.
bind Space:magic-space

# Change cursor depending on the mode.
bind "set show-mode-in-prompt on"
bind "set vi-cmd-mode-string \1\e[1 q\2"
bind "set vi-ins-mode-string \1\e[5 q\2"

# Restore cursor.
PS0="${PS0/\\e[5 q/}"
PS0+="\e[5 q"