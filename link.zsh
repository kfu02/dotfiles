#!/bin/zsh
# ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
# echo '.vimrc linked'
ln -sf $HOME/.dotfiles/init.vim $HOME/.config/nvim/init.vim
echo 'init.vim (nvim) linked'
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
echo '.zshrc linked'
