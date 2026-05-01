# My Omarchy config

My config is rather close to the stock Omarchy, at least to this day (v3.5.1) **APRIL 18 2026**.
Therefore, most of it lies in .dotfiles:

- .config/hypr/*
- .config/waybar/*
- starship.toml

## Manual config steps

- `ssh-keygen` and then set it up with Bitbucket and GH;
- install 1password extension in the browser and set it up;
- install extra themes;

## Extra applications

Depending on their sources, packages should be installed in the following ways:
- pacman stuff: use the script that comes with Omarchy: `omarchy-pkg-add [package-name]` instead of straight `pacman`;
- AUR stuff: use `omarchy-pkg-aur-install`
- other: follow their instructions...

### List:
- uv: `curl -LsSf https://astral.sh/uv/install.sh | sh` and that's it!
- Plex media server: AUR install -> enable systemd service with `sudo systemctl enable plexmediaserver`
- Slack: use as a webapp. There is a keybinding for it in `.config/hypr`. Not sure that i need to install a webapp at all if i only run it with the shortcut
- waybar-timer: download binary from [GH](https://github.com/jbirnick/waybar-timer) -> put it in `~/.scripts/` -> its start command is already in `hyprland.conf`
- metronome: simple cli metronome on my github. There is an alias for it in .bashrc
- Postman: AUR install -> `postman-bin`
- ipyton: pacman install -> 
- cmake: pacman install
- blanket (background noise): pacman install 
- qbittorrent: pacman

## WIP

There are a few things i would like to add:

- handling system snapshots
- setting up ChezMoi to a useful state:
  - triple setup: 4Ksingle / single laptop / laptop+HDscreen
  - good commit routine
- find a better browser. (Chromium might be all i need but looking around could still show interesting options)
