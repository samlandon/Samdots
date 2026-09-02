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

### USB Mouse not working??
- If the USB Mouse isn't working randomly but works when you plug in, it might be autosuspend.
- To check, run `cat /sys/module/usbcore/parameters/autosuspend`. If it's 2 or something low, autosuspend is likely active
- Use `lsusb` to find the USB mouse, and find the ID, with parts like 046d:c52b
- Using those parts of the ID, you can create/edit a rule for the usb power with `sudo nvim /etc/udev/rules.d/99-usb-power.rules`
- Here you will enter this line: `ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c52b", TEST=="power/control", ATTR{power/control}="on"` noting that ATTR{idVendor} and ATTR{idProduct} correspond to the two parts of the ID!

### Copying a file into the clipboard:
- using cat and xclip
- `cat "FILE_TO_READ_FROM" | xclip -selection clipboard`
- Replace the "FILE_TO_READ_FROM" with the file path you want to read from and you can also shorten `-selection clipboard` to `-sel clip`

### Copying to clipboard from vim!!!
- select the region you want such as everything with `ggvG` (like `ctrl+a`) or select an area and then use `"+y`, where + is the OS clipboard register

### Find and replace in vim
- If you only want to select a specific area, select it in visual mode, then type `:s/replaceMe/withMe/gc` (g matches all in a line and c gets confirmation each time, where y = yes, n = no, a = all, q = quit)
- If you want to select all occurrences in the file, use '%', like so `:%s/replaceMe/withMe/gc`

### nvim UltiSnips and plugins for LaTex etc.
- [Using UltiSnips](https://castel.dev/post/lecture-notes-1/)
- my plugins: `~/.config/nvim/lua/plugins`
- UltiSnips snippets location for LaTex snippets
  - `~/.config/nvim/UltiSnips/tex.snippets`
  - The tex. part means only tex files will be touched!

### Multi-cursor for vim
- `ctrl + v` sets block visual mode and you can navigate around in a box with hjkl and then yank like normal!
- See epic link for more tips on stuff like `/find+enter cgn .` which is op title: "You don't need more than one cursor in vim" with awesome alternatives.
- [Vim Multi Cursor](https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db)

### Consider Swapping to LuaSnips from UltiSnips (why?)
1. I mean, just look at the options for insert nodes, choice nodes, dynamic nodes, it's gorgeous!!!
2. [LuaSnips](https://github.com/L3MON4D3/LuaSnip)

### Personal nvim config ideas
- I don't want bloat. Lazy.nvim is nice but I don't want to depend on a bunch of different plugins if I can avoid it.
- [Single config file](https://github.com/fatih/dotfiles/blob/main/init.lua?ref=arslan.io), [Other Single config file](https://github.com/creativenull/nvim-oneconfig/blob/main/init.lua)
- I want basic LSP, and they have it built in on v0.12, as well as a new vim.pack which is going to be very similar to mini.deps, which has now() and later() functions that do most of what lazy does by queueing the plugins to load only the important ones 'now' and the others 'later', crazy right! Although, it does look like I might need to play around with that because there seem to be no plans to implement `now()` and `later()` functions into the `vim.pack` built in
- For LSP, I don't want more than the built in stuff as much as I can, though Mason might end up being a must-have for managing the language protocols I have. We can try without first though and only use the built in 
4. [LSP Basics](https://lugh.ch/switching-to-neovim-native-lsp.html), [LSP Pro Help Builtin LSP](https://gpanders.com/blog/whats-new-in-neovim-0-11/#lspa)
5. [Easy tutorial for setup nvim config](https://www.youtube.com/watch?v=zHTeCSVAFNY)
6. [The Simple Suckless route (I still want lazy package management, but good to see how it can be done)](https://github.com/radleylewis/nvim-lite/blob/pluginless/init.lua)

### No Plugins Nvim
- [Native vim](https://boltless.me/posts/neovim-config-without-plugins-2025/)
- [Native LSP pretty](https://dx13.co.uk/articles/2023/04/24/neovim-lsp-without-plugins/), and [this video](https://www.youtube.com/watch?v=yI9R13h9IEE)
- 

### Fix for No Wifi Popups
- create the following file as such `sudo nvim /etc/NetworkManager/conf.d/20-connectivity.conf`
- and paste the following into it:
```
[connectivity]
enabled=true
uri=http://connectivity-check.ubuntu.com/
response=NetworkManager is online
interval=300
```
- The uri=http://connect... is the ubuntu option that checks for your wifi popups and this enabled part allows it to actually get past the DNS blocking popups

### Where to Find the LazyVim Keymappings to Find my Favorites like line 195 <C-/>
- `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua`
- Looks like we'll need to look into the Snacks, but i want to also add <C-/> to insert mode!

### Functionality I Want in My nvim Config
- deletion puts the delete buffer into a different key than the y copy paste buffer so that I can copy something, delete something, and paste the thing I wanted to paste before originally!
- Popup terminal VSCode style at the bottom of the screen with <C-/> like in LazyVim. See the LazyVim Snacks.
- Snippets and VimTex to use vim as a LaTeX editor
- LSP support? Built in or Mason? Still not sure, but lsp-config is at least a good place to get good syntax
- use built in vim.pack instead of lazy? Could try mini.deps, but the `later()` thing I like about it doesnt seem to be implemented in vim.pack which is dumb
- I think its built in, but `@@` or `@:` should repeat the last `:` command and the `.` repeats normal mode commands. Also, see all `:` command history with `q:`
- Figure out if its needed but I really like mini.ai for () completions. Try without first, though.
- I think I want LuaSnip for snippets because of the insert, choice, dynamic and other nodes that just aren't built in, but are super handy

### Windows Fresh nvim Install Notes
- `:echo stdpath('config')` (this is where my init.lua is)
- use `:luafile %` to source the init.lua from within the file
- use `:Explore` to pull up netrw to manage files, and use `%` to create a file and `d` to create a directory.

### LaTeX Tips:
* `\infty`, `|absoluteval|`, `$\int_{lowerbound}^{upperbound}{actualintegralpart}$` inline math
* `\lim_{t \to \infty}theExpression`
* Helpful Latex Cheat Sheets
  * [Super good!](https://en.wikibooks.org/wiki/LaTeX)
  * [Condensed](https://wch.github.io/latexsheet/)
  * [Useful!](https://ctan.org/pkg/undergradmath)
  * [DRAW on the go!!!!](https://detexify.kirelabs.org/#/)
  * [quickref](https://quickref.me/latex.html)
  * [cheatsheet](https://fg.informatik.uni-goettingen.de/file/latex-cheatsheet.pdf)
  * [good lookup](https://resources.latex-cloud-studio.com/learn/latex/formatting/headers-footers)
  * [og intro to snippets](https://castel.dev/post/lecture-notes-1/)
```
\begin{itemize}
  \item firstitem
\end{itemize}
```


  
