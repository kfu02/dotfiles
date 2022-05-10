# dotfiles

A repo to backup my dotfiles. Currently includes:

```
init.vim
.zshrc
```

and a script (./link.zsh) to auto-link the relevant dotfiles on my system. (I switched from vim to neovim. TODO: delete vimrc.)

## Neovim Customizations

First, install Neovim 0.6 with [these instructions](https://github.com/neovim/neovim/releases/tag/v0.6.1). Then put the neovim executable into root.
Start Neovim according to the instructions above, then run `:help nvim` to configure a blank `init.vim` file.

## Functional Customizations

Follow comments in .zshrc and init.vim as errors come up. :)

## Terminal Theme Installs

### [pure](https://github.com/sindresorhus/pure)

*Main terminal style.*
```
npm install --global pure-prompt
# (.zshrc already configured correctly)
```

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

*Syntax highlighting.*
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# (.zshrc already configured correctly)
```

### Tomorrow-Night-Eighties

TODO: I've changed to everforest, change instructions here
(find iterm2/Everforest and GNOME/everforest)

[(MacOS)](https://github.com/chriskempson/tomorrow-theme/tree/master/OS%20X%20Terminal) /
[(GNOME)](https://github.com/aaron-williamson/base16-gnome-terminal)

*Color theme to work with Pure & match vim-hybrid.*
```
# MacOS
Download `.terminal` script from: https://github.com/chriskempson/tomorrow-theme/blob/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal
# Restart Terminal, then select profile in Preferences/Profiles.

# GNOME
cd ~/.config
git clone https://github.com/aaron-williamson/base16-gnome-terminal.git
cd base16-gnome-terminal/color-scripts/
./base16-tomorrow-night-eighties-256.sh
# Restart Terminal, then select profile in Preferences/Profiles.
```
