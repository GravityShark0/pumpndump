# BRANCH THAT IS FOR MY ARCH LAPTOP INSTEAD

> im tired

## This is a solution made by me to just "pump n' dump" my dot files and not doing anything after

> i dont know what pump n dump actually means but it sounds cool

### How 3 install

```bash
git clone https://github.com/GravityShark0/pumpndump -b arch
cd pumpndump
```

#### GNU Stow

````bash
# to sync home/ to ~/ (/home/$USER/)
stow home --target=$HOME

# to sync root/ to /
stow root --target=/
# this is dangerous cause people could edit it that dont have the correct permissions (duh)

# doas.conf needs to be owned by root for it to work
# chown root /etc/doas.conf

# fstab cant be used as a symlink for obvious reasons
# cp ./root/etc/fstab.bak /etc/fstab
```bash
# to stop fish_variables from constantly updating
git update-index --skip-worktree home/.config/fish/fish_variables
````

and it should be done,
just don't forget the things like doing <prefix> + I in tmux to update packages
and just installing selected-packages.txt

### Root Requirements

1. EnvdeavourOS with everything disabled
2. Intel Laptop!?!
3. Use Waylan!?!?
4. Systemd Boot
5. just install applications when you need it

### Home Requirements

> Yeah im not updating this

1. Applications used in scripts and such (in the selected anywas)

   - dash and /bin/sh -> dash
   - ffmpeg (compress)
   - pipewire
   - xrandr
   - libnotify
   - pulsemixer
   - betterlockscreen
   - maim
   - tesseract
     > currently tesseract doesnt work in gentoo so i use a binary instead
   - fzf
   - xrdb
   - openntpd
   - [sesh](https://github.com/joshmedeski/sesh)
     > this one is kinda important cause there is no gentoo ebuild for it
   - modprobed

2. fish shell
   - mksh to allow for Gentoo exports to work
   - zoxide
3. awesomeWM
4. GIMP
5. tmux
6. LibreWolf (browser)
7. htop
8. GTK
   - [Catppuccin-Mocha-Standard-Mauve-Dark](https://github.com/catppuccin/gtk)
9. neovim
10. [my suckless terminal](https://github.com/GravityShark0/st-grav-flexipatch)
11. joshuto
12. rofi
13. [picom-ft-labs](https://github.com/FT-Labs/picom)
    - animation support in the [future](https://github.com/yshui/picom/pull/1219)

### Stuff not used but still there just incase

- Root
  - tlp
  - genkernel.conf
- Home
  - Doom Emacs
    - Alternative could be [minemacs](https://github.com/abougouffa/minemacs)
  - hyprwm

> cat /var/lib/portage/world > selected-packages.txt
