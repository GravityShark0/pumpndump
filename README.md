> im tired
#### This is a solution made by me to just "pump n' dump" my dot files and not doing anything after
> i dont know what pump n dump actually means but it sounds cool


### How 3 install
```
$ git clone https://github.com/GravityShark02/pumpndump
$ cd pumpndump
```
#### GNU Stow
```bash
# to sync home/ to ~/ (/home/$USER/)
stow home --target=$HOME

# to sync root/ to /
stow root --target=/
```

### Everysingle thingy ma doodle
- awesomewm / hyprland
    - [ picom-ftlabs-generalanimation ](https://github.com/FT-Labs/picom/tree/generalanimation) cause it kinda works better than
- doom emacs
- eza
- firefox
- fish
    - mksh so fish can also get env variables
    - zoxide
- joshuto
- neovim
- some lesser ones like 
- some random scripts (you should set /bin/sh to /bin/dash)
- st
- tmux
- ~~dmenu~~ rofi
    - gtk-3.0
    - htop
    - neofetch
    - volumeicon
- X11 shit like .xinitrc
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
