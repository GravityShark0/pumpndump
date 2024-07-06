> im tired

## This is a solution made by me to just "pump n' dump" my dot files and not doing anything after

> Future Idea
> Emacs for navigating my life and kakoune for coding
> For

> i dont know what pump n dump actually means but it sounds cool

### How 3 install

```bash
git clone https://github.com/GravityShark0/pumpndump ~/.dotfiles
cd ~/.dotfiles
```

#### GNU Stow

# Pull in the submodules

```bash
git submodule update --init --recursive
```

# to stop fish_variables from constantly updating

```bash
git update-index --skip-worktree home/.config/fish/fish_variables
```

# to sync home/ to ~/ or /home/$USER/

```bash
stow home --target=$HOME
```

# to sync root/ to /

# this is dangerous cause people could edit it that dont have the correct permissions (duh)

```bash
sudo stow root --target=/
```

# doas.conf needs to be owned by root for it to work

```bash
sudo cp ./root/etc/doas.conf.bak /etc/doas.conf
```

# fstab cant be used as a symlink for obvious reasons

```bash
sudo cp ./root/etc/fstab.bak /etc/fstab
```

# install the flatpaks

flatpak install flatpak-list--app.txt

and it should be done,
just don't forget the things like doing <prefix> + I in tmux to update packages
and the world file should also be synced if you remove yuor original world file
and probably change rc-update or somethin

### Root Requirements

1. Gentoo (amd64 openrc)
   - Profile (default/linux/amd64/23.0)
2. Nvidia GPU (GTX 1050ti Mobile)
3. Install all the stuff in the predefined world file
4. - symlink dash -> /bin/sh

### Home Requirements

> Outside stuff that you can't really automate

1. Applications used in scripts and such (in the selected anywas)

- [tesseract](https://github.com/tesseract-ocr/tesseract/releases/)
  > currently tesseract doesnt work in gentoo so i use a binary instead
- [sesh](https://github.com/joshmedeski/sesh)
  > this one is kinda important cause there is no gentoo ebuild for it

```bash
go install github.com/joshmedeski/sesh@latest
```

2. chsh -> /bin/mksh
3. GTK Theme

- [Catppuccin-Mocha-Standard-Mauve-Dark](https://github.com/catppuccin/gtk)
