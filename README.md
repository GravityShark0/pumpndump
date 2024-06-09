> im tired

## This is a solution made by me to just "pump n' dump" my dot files and not doing anything after

> i dont know what pump n dump actually means but it sounds cool

### How 3 install

```bash
git clone https://github.com/GravityShark0/pumpndump
cd pumpndump
```

#### GNU Stow

````bash
# Pull in the submodules
git submodule update --init --recursive

# to stop fish_variables from constantly updating
git update-index --skip-worktree home/.config/fish/fish_variables

# to sync home/ to ~/ or /home/$USER/
stow home --target=$HOME

# to sync root/ to /
# this is dangerous cause people could edit it that dont have the correct permissions (duh)
stow root --target=/

# doas.conf needs to be owned by root for it to work
cp ./root/etc/doas.conf.bak /etc/doas.conf

# fstab cant be used as a symlink for obvious reasons
cp ./root/etc/fstab.bak /etc/fstab
```bash
````

and it should be done,
just don't forget the things like doing <prefix> + I in tmux to update packages
and the world file should also be synced if you remove yuor original world file

### Root Requirements

1. Gentoo (amd64 openrc)
   - Profile (default/linux/amd64/23.0)
2. Nvidia GPU (GTX 1050ti Mobile)
3. Install all the stuff in the predefined world file
4. - symlink dash -> /bin/sh

### Home Requirements

> Outside stuff that you can't really automate

1. Applications used in scripts and such (in the selected anywas)
   - tesseract
     > currently tesseract doesnt work in gentoo so i use a binary instead
   - [sesh](https://github.com/joshmedeski/sesh)
     > this one is kinda important cause there is no gentoo ebuild for it

```bash
go install github.com/joshmedeski/sesh@latest
```

2. chsh -> /bin/mksh
3. GTK

- [Catppuccin-Mocha-Standard-Mauve-Dark](https://github.com/catppuccin/gtk)

### Stuff not used but still there just incase

- Root
  - tlp
  - genkernel.conf
- Home
  - Doom Emacs
    - Alternative could be [minemacs](https://github.com/abougouffa/minemacs)
  - hyprwm

> cat /var/lib/portage/world > selected-packages.txt
