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

### nvim tabs to be 4 spaces instead of 2
- in the lua/config/options.lua config file
```
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
```
- where expandtab turns tab into multiple spaces instead of a tab character
- shiftwidth helps when we're shifting a line by a tab amount (If you also want to use tabs for indentation, you should also set shiftwidth to be the same as tabstop)
- tabstop selects how many spaces the tab will be

### KDE Connect
- Great replacement for localsend, more natural, also seems to work on more networks more reliably, and allows for remote access of the laptop/computer screen from the phone! I'm considering using Weylus for cleaner drawing capability on the screen. Could test USB connection to see if helps.
- To connect through IP address, you need to find your computer's IP address. The easiest way is taking the first IP address that shows up when using the command: `hostname -I`
- You may also need to configure the Ubuntu firewall to allow the ports KDE Connect needs to use with the following 2 commands:
```
sudo ufw allow 1714:1764/tcp
sudo ufw allow 1714:1764/udp
```
- Supposedly typing those commands in should also require a `sudo ufw reload`, and this command should work `sudo ufw status | grep 171
`. I say *should* work because it didn't seem to do anything, saying something about there being no firewall. So I might be cool anyway. But it worked for me!

### audit-repo.sh
- When I download some package off github, I wonder if it's sus. A simple check I can run, using the audit-repo.sh in my home directory is to run the script on the file and see if anything pops up as suspicious or malicious.
- (When initializing this script on a new device, remember to use `chmod +x audit-repo.sh` to allow the .sh file to execute.)
- You can also enter the github editor on any github page by pressing the '.' key, and that will allow you to ctrl+shift+f for `exec(` calls encrypting bytes or long `base64` strings that could hide things that aren't pictures. 
