> im tired

> i dont know what pump n dump actually means but it sounds cool
## This is a solution made by me to just "pump n' dump" my dot files and not doing anything after
> Future Idea
> Emacs for navigating my life and kakoune for coding

> Sat Jul 20 21:54:55 2024 I saw some stuff about Kakoune and how even if Kakoune uses less keystrokes, it uses the alt key more heavily which is kind of cheating tbh.
> Helix seems alot better than Kakoune (due to the fact all of the things you would want is built in) but also the commands are less likely to be used with alt (although it is still prominent)
> I am now confused to what editor next I should use because I stil love the idea of piping in Kakoune

> I currently use Emacs for editing org and markdown files cause its amazing at that
> For code I still use neovim because its still an amazing editor


### How 3 install

```bash
# por me
jit clone --recursive git@github.com:GravityShark0/pumpndump ~/.pumpfiles
# por u
git clone --recursive https://github.com/GravityShark0/pumpndump ~/.pumpfiles
cd ~/.dotfiles
```

#### GNU Stow

### Pull in the submodules

```bash
git submodule update --init --recursive
```

### to stop fish_variables from constantly updating

```bash
git update-index --skip-worktree home/.config/fish/fish_variables
```

### to sync home/ to ~/ or /home/$USER/

```bash

stow home --target=$HOME
```

### to sync root/ to /

### this is dangerous cause people could edit it that dont have the correct permissions (duh)

```bash
sudo stow root --target=/
```

### doas.conf needs to be owned by root for it to work

```bash
sudo cp ./root/etc/doas.conf.bak /etc/doas.conf
```

### fstab cant be used as a symlink for obvious reasons

```bash
sudo cp ./root/etc/fstab.bak /etc/fstab
```

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
### software to remember
```
app-editors/helix
app-misc/ani-cli
net-fs/sshfs
net-wireless/iw
sys-apps/smartmontools
sys-fs/ncdu-bin
sys-power/powerstat
www-client/uget
```
