#!/bin/bash

alias rebash="source ~/.bashrc"

alias ls="ls --human-readable --color=auto"
alias lsl="ls -al"
alias cpv="rsync -ah --info=progress2"

if command -v virtualenv &>/dev/null; then
  alias venvc="virtualenv venv"
  alias venva="source env/bin/activate"
fi

if command -v docker-compose &>/dev/null; then
  alias dc="docker-compose"
  alias dcup="docker-compose up -d"
  alias dckill="sudo killall containerd-shim && docker-compose down"
  alias dclog="docker-compose logs --follow"
  alias dcrebuild="docker-compose down && docker-compose up -d --build"
fi
