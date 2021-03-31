# dotfile-backup

A repo to backup my dotfiles.

## Terminal Theme Installs

[Pure](https://github.com/sindresorhus/pure):
Main terminal style.
```
npm install --global pure-prompt
# (.zshrc already configured correctly)
```

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting):
Syntax highlighting.
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# (.zshrc already configured correctly)
```

[(MacOS) tmrw-night-80s](https://github.com/chriskempson/tomorrow-theme/tree/master/OS%20X%20Terminal)

[(GNOME) tmrw-night-80s](https://github.com/aaron-williamson/base16-gnome-terminal)
Color theme to work with Pure & match vim-hybrid.
```
# MacOS
Download `.terminal` script from: https://github.com/chriskempson/tomorrow-theme/blob/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal
# Restart Terminal, then select profile in Preferences/Profiles.

# GNOME
cd ~/.config
git clone https://github.com/aaron-williamson/base16-gnome-terminal.git
cd color-scripts
./base16-tomorrow-night-eighties-256.sh
# Restart Terminal, then select profile in Preferences/Profiles.
```


