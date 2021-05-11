#!/bin/bash

alias rebash="source ~/.bashrc"

alias ls="ls --human-readable --color=auto"
alias lsl="ls -al"
alias cpv="rsync -ah --info=progress2"

if command -v virtualenv &>/dev/null; then
  alias venvc="virtualenv venv"
  alias venva="source env/bin/activate"
fi
