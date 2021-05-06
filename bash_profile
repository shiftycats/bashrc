#!/bin/bash

# Source .bashrc in interactive login shells.
if [ -n "$PS1" ] && [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi