# Samdots
All my dots I want to keep track of to follow my Linux ricing and fun.

Just personal projects and stuff I liked from other places and added my personal touch to!

## .zshrc and samBoM
- I mostly care about the cowsay command where I have a specific version popping up in the terminal at the start of each terminal session. See the samBoM file I am adding right now to this repo, which I save with the other dat files for fortune in the /usr/share/games/fortunes. To edit said samBoM file to add more verses, simply go into the file at that path, then run sudo strfile samBoM to turn it into a usable .dat file!

## Fun packages I like
- cbonsai - https://gitlab.com/jallbrit/cbonsai
- cmatrix - https://github.com/abishekvashok/cmatrix
- cowsay - https://github.com/piuccio/cowsay
- fortune - https://github.com/shlomif/fortune-mod

### tldr not working
- tldr seems to not work with ubuntu on the apt install, so here are steps for tealdeer install as tldr:
```
sudo wget -O /usr/local/bin/tldr https://github.com/tealdeer-rs/tealdeer/releases/latest/download/tealdeer-linux-x86_64-musl
sudo chmod +x /usr/local/bin/tldr
tldr --update
```
