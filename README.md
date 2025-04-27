These are my shell settings.

I prefer to keep a system-generated `~/.bashrc` and source all my settings from `~/.bashrc.d/` directory.
The only purpose of `bashrc` file in this repository is to check if session is interactive and load `~/.bashrc.d/`. 

# Installation

### 1. Clone the repository
```sh
$ git clone https://github.com/shiftycats/bashrc ~/.config/bashrc
```

### 2. Install `inputrc` and `bashrc.d`
```sh
# Symlink `.inputrc` to enable Vi mode, custom key bindings, and other GNU Readline settings
$ ln -s ~/.config/bashrc/inputrc ~/.inputrc

# Create `.bashrc.d` in the home directory if it doesn't exist
$ mkdir -d ~/.bashrc.d

# Create symlinks for files in `bashrc.d` to enable them selectively, or enable everything by running:
$ ln -s ~/.config/bashrc/bashrc.d/* ~/.bashrc.d/
```

### 3. Install `bashrc` and `bash_profile` (Optional)

This step can be skipped on systems that source `~/.bashrc.d/` by default.
```sh
# Source `bashrc` at the end of existing `~/.bashrc` or create a symlink if `~/.bashrc` doesn't exist
$ ln -s ~/.config/bashrc/bashrc ~/.bashrc || printf "\nsource ~/.config/bashrc/bashrc\n" >> ~/.bashrc

# Symlink `.bash_profile` if it doesn't exist
$ ln -s ~/.config/bashrc/bash_profile ~/.bash_profile
```
