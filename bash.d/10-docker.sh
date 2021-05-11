#!/bin/bash

if command -v docker &>/dev/null; then
  DOCKER_BUILDKIT=1
fi

if command -v docker-compose &>/dev/null; then
  COMPOSE_DOCKER_CLI_BUILD=1

  # Sh into a docker service
  # Usage: dcsh <service>
  dcsh() { docker-compose exec $1 /bin/sh; }

  alias dc="docker-compose"
  alias dcup="docker-compose up -d"
  alias dckill="sudo killall containerd-shim && docker-compose down"
  alias dclog="docker-compose logs --follow"
  alias dcrebuild="docker-compose down && docker-compose up -d --build"
fi
