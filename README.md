## Prerequisites

* `bash >= 4.2`

## Installation

```bash
# Set the destination.
BASHRC_DIR=~/.config/bashrc

# Clone the repository.
$ git clone https://github.com/shiftycats/bashrc $BASHRC_DIR

# Symlink it up.
$ ln -s $BASHRC_DIR/bashrc ~/.bashrc
$ ln -s $BASHRC_DIR/bashrc.local ~/.bashrc.local # Optional
$ ln -s $BASHRC_DIR/bash_profile ~/.bash_profile # Optional
```

## Files and directories

### `bash_profile` 
Sources `~/.bashrc` in interactive login shells.

### `bashrc` 
A clean, barebones rc with sane defaults. 

Sources `~/.bashrc.local`.

### `bashrc.local` 
Default local config. Replace it with a machine-specific one if needed:

```bash
$ ( LOCALRC=$BASHRC_DIR/bash.local.$(uname -n) && touch $LOCALRC && ln -s $LOCALRC ~/.bashrc.local )
```

Sources `bash.d`.

### `bash.d` 
This is where the bulk of the configuration lays.
