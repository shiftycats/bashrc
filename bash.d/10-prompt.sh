#!/bin/bash

# Black        \e[0;30m    Dark Gray     \e[1;30m    Bold  \e[1m
# Red          \e[0;31m    Light Red     \e[1;31m    Reset \e[0m
# Green        \e[0;32m    Light Green   \e[1;32m
# Blue         \e[0;34m    Light Blue    \e[1;34m
# Yellow       \e[0;33m    Light Yellow  \e[1;33m
# Magenta      \e[0;35m    Light Magenta \e[1;35m
# Cyan         \e[0;36m    Light Cyan    \e[1;36m
# Light Gray   \e[0;37m    White         \e[1;37m

function _make_prompt {
  local exit_status=$?

  PS1=

  # Virtualenv
  if [ -n "$VIRTUAL_ENV" ]; then
    PS1+="\e[0m[$(basename $VIRTUAL_ENV)] "
  fi

  if [ -n "$SSH_CLIENT" ]; then
    PS1+="\e[1;33m\h:"
  fi

  PS1+="\e[1;33m\w\e[1;35m$(__git_ps1) "

  # Background jobs
  if [ -n "$(jobs -p)" ]; then
    PS1+="\e[1;36m\j< "
  fi

  # Exit status
  if ! [ "$exit_status" -eq 0 ]; then
    PS1+="\e[1;31m${exit_status} "
  fi

  PS1+="\e[0m\$ "
}

PROMPT_DIRTRIM=1 # Trim path of the working directory

if [[ "$PROMPT_COMMAND" != *"_make_prompt"* ]]; then
  PROMPT_COMMAND="_make_prompt${PROMPT_COMMAND:+;${PROMPT_COMMAND}}"
fi
