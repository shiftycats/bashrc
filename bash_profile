# .bash_profile

# Source .bashrc in interactive login shells
if [ -n "$PS1" ] && [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi

# vim: ft=sh:expandtab:ts=4:sw=4
