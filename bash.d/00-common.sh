#!/bin/bash
# Common functions and aliases

countfiles() {
  local in_cwd=1
  local ext

  for arg in "$@"; do
    case "$arg" in
      -h|--help)
        echo "Usage: ${FUNCNAME[0]} [-r|--recursive] [EXTENSION]"
        return ;;
      -r|--recursive)
	in_cwd= ;;
      *)
        ext="$arg" ;;
    esac
  done

  find . ${in_cwd:+-maxdepth 1} -type f -name "*.${ext:-*}" | wc -l
}

ff() { find . -name "$1"; }

alias ls="ls --human-readable --color=auto"
alias lsl="ls -al"
alias cpv="rsync -ah --info=progress2"

alias rebash="source ~/.bashrc"
