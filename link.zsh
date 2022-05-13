#!/bin/zsh
ln -sf $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
echo 'init.vim (nvim) linked'
ln -sf $HOME/.dotfiles/zsh/p10k.zsh $HOME/.p10k.zsh
echo '.p10k linked'
ln -sf $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
echo '.zshrc linked'
