#!/bin/zsh
ln -sf $HOME/dotfile-backup/vimrc $HOME/.vimrc
echo '.vimrc linked'
ln -sf $HOME/dotfile-backup/init.vim $HOME/.config/nvim/init.vim
echo 'init.vim (nvim) linked'
ln -sf $HOME/dotfile-backup/zshrc $HOME/.zshrc
echo '.zshrc linked'
