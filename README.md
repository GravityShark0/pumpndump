> im tired
## This is a solution made by me to just "pump n' dump" my dot files and not doing anything after
> i dont know what pump n dump actually means but it sounds cool


### How 3 install
```bash
git clone https://github.com/GravityShark0/pumpndump
cd pumpndump
```
#### GNU Stow
```bash
# to sync home/ to ~/ (/home/$USER/)
stow home --target=$HOME

# to sync root/ to /
stow root --target=/
```
and it should be done,
just don't forget the things like doing <prefix> + I in tmux to update packages

### Everysingle thingy ma doodle you should have installed
- awesomewm / hyprland (kinda not used)
    - [ picom-ftlabs-generalanimation ](https://github.com/FT-Labs/picom/tree/generalanimation)
- betterlockscreen
- doom emacs
- eza
- firefox
- fish
    - mksh so fish can also get env variables
    - zoxide
- htop
- joshuto
- neofetch
- neovim
- pulsemixer
- st
- tmux
- volumeicon
- ~~dmenu~~ rofi
- wpa_cli

### shit that's in also
- gtk-3.0
- X11 shit like .xinitrc
- some random scripts

#### the roots
- gentoo
- keyd
- elogind
- gamemoded
- X11 shit

#### other stuff i expect you to have
- a working breathing X11 config with nvidia
- dash or /bin/sh -> dash
- pipewire
- feh 
- volumeicon
- openntpd from gentoo
- der fonts
