#!/bin/bash

# Django
alias pm="python manage.py"

# Virtualenv
if command -v virtualenv &>/dev/null; then
  alias venvc="virtualenv venv"
  alias venva="source env/bin/activate"
fi
