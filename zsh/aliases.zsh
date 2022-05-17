################################################################################
#
# aliases.zsh
#
# Add useful aliases to zsh.
#
################################################################################

# python aliases
# alias python='python3'
# alias pip='python -m pip'

# shell aliases
alias sl='ls'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# go to dotfiles + open nvim to edit without leaving pwd
alias dots="(cd ~/.dotfiles && nvim .)"

# OS-specific aliases
case `uname` in
  Darwin)
    # commands for OS X go here
    alias o='open'
  ;;
  Linux)
    # commands for Linux go here
    alias open='xdg-open'
    alias o='open'
  ;;
esac
