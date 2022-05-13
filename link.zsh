#!/bin/zsh

# simple script to sym-link dotfiles

# link nvim dotfile
ln -sf $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
echo 'init.vim (nvim) linked'

# link .p10k
ln -sf $HOME/.dotfiles/zsh/config/p10k.zsh $HOME/.p10k.zsh
echo '.p10k linked'

# link zshrc
ln -sf $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
echo '.zshrc linked'

# restart shell to apply changes
exec zsh
