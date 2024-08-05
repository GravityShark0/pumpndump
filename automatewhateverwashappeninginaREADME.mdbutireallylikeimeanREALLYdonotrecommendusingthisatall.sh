#!/bin/sh

# THINGS IN THE GIT REPO SHIT
git remote set-url --add --push origin git@github:GravityShark0/pumpndump.git
git remote set-url --add --push origin gravity@clr:Git/pumpndump.git

# GNU Stow
## Pull in the submodules
## MAKE SURE TO DO THIS BEFORE DELETING SHIT LIKE HOSTS AND RESOLV CAUSE YEAH
## git submodule update --init --recursive

## to stop fish_variables from constantly updating
git update-index --skip-worktree home/.config/fish/fish_variables
rm ~/.config/fish/fish_variables

## to sync home/ to ~/ or /home/$USER/
mkdir ~/.config --parents
mkdir ~/.tmux/plugins/ --parents
stow home --target=$HOME || echo "=====FIX THAT CONFLICT YOURSELF=====" && unlink ~/use\ ls\ -a\ to\ see\ all
sudo chmod 700 .gnupg --recursive
sudo chmod 700 .ssh --recursive

## to sync root/ to /
## this is dangerous cause people could edit it that dont have the correct permissions (duh)
# sudo stow root --target=/ || echo "=====FIX THAT CONFLICT YOURSELF TOO=====" && returnunlink use\ ls\ -a\ to\ see\ all

## doas.conf needs to be owned by root for it to work
# sudo cp root/etc/doas.conf.bak /etc/doas.conf

## fstab cant be used as a symlink for obvious reasons
# sudo cp root/etc/fstab.bak /etc/fstab
