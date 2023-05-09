#!/bin/zsh

# simple script to sym-link dotfiles

# after git clone, put this repo at this location
# (duplicate in zshrc)
DOTFILES_PATH="$HOME/.dotfiles"

# link entire nvim/ directory
ln -sf $DOTFILES_PATH/nvim/* $HOME/.config/nvim/
echo 'nvim linked'

# link .p10k
ln -sf $DOTFILES_PATH/zsh/config/p10k.zsh $HOME/.p10k.zsh
echo '.p10k linked'

# link zshrc
ln -sf $DOTFILES_PATH/zsh/zshrc $HOME/.zshrc
echo '.zshrc linked'

# link tmux.conf
ln -sf $DOTFILES_PATH/tmux/tmux.conf $HOME/.tmux.conf
echo '.tmux.conf linked'

# restart shell to apply changes
exec zsh
