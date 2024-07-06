#!/bin/sh
# Pull in the submodules
git submodule update --init --recursive

# to stop fish_variables from constantly updating
git update-index --skip-worktree home/.config/fish/fish_variables

# to sync home/ to ~/ or /home/$USER/
stow home --target=$HOME
