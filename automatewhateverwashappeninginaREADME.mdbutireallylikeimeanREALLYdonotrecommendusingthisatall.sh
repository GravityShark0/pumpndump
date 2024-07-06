#!/bin/sh

#### GNU Stow
# Pull in the submodules
git submodule update --init --recursive

# to stop fish_variables from constantly updating
git update-index --skip-worktree home/.config/fish/fish_variables
rm ~/.config/fish/fish_variables

# to sync home/ to ~/ or /home/$USER/
stow home --target=$HOME

# to sync root/ to /
# this is dangerous cause people could edit it that dont have the correct permissions (duh)
sudo stow root --target=/

# doas.conf needs to be owned by root for it to work
sudo cp root/etc/doas.conf.bak /etc/doas.conf

# fstab cant be used as a symlink for obvious reasons
sudo cp root/etc/fstab.bak /etc/fstab

# install the flatpaks

flatpak install flatpak-list--app.txt
