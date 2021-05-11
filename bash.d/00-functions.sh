#!/bin/bash

dcsh() { docker-compose exec $1 /bin/sh; }
ff() { find . -name "$1"; }

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
