#!/bin/bash

#  Attach terminal to either a persistent tmux session, or a disposable
#+ one if persistent session is already in use.
#
#  This is useful in a setup where you want only one terminal window 
#+ running and use tmux for multitasking.
#
#+ Usage: tmux-autoattach [session_name (default=main)]
tmux-autoattach() {
  if ( ! command -v tmux &> /dev/null ) \
       || [[ "$SSH_CLIENT" != "" ]] \
       || [[ -n "$TMUX" ]] \
       || [[ "$(tty)" == /dev/tty* ]] \
       || grep -q '^\(n\?vim\|emacs\|node\)' "/proc/$PPID/comm" \
          &> /dev/null; then
    return 1
  fi

  local session="${1:-main}"

  if ( tmux ls -F "#{session_name}::#{?session_attached,1,0}" \
       | grep -q "^$session::1$" ); then
    command tmux new-session -s "$$" \; \
                 set-option destroy-unattached
  else
    command tmux attach -t "$session" \
    || command tmux new-session -s "$session"
  fi 2>/dev/null

  # Attach all terminals to a persistent session as new windows.
  # command tmux has-session -t $session 2>/dev/null \
  # || command tmux new-session -d -s $session
  #
  # if ( tmux ls -F "#{session_name}::#{?session_attached,1,0}" \
  #    | grep -q "$session::1" ); then
  #   command tmux new-session -d -t "$session" -s "$session-$$" \; \
  #                set-option destroy-unattached \; \
  #                new-window \; \
  #                attach-session -t "$session-$$"
  # else
  #   command tmux attach-session -t "$session"
  # fi 2>/dev/null
}
