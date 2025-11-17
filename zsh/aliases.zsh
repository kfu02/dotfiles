################################################################################
#
# aliases.zsh
#
# Add useful aliases to zsh.
#
################################################################################

# git aliases
alias gd='git diff'
alias gs='git status'
alias gco='git checkout'
alias gc='git commit'
alias gr='git restore'
alias gpu='git push -u origin HEAD'
alias ga='git add'

# python aliases
# alias python='python3'
# alias pip='python -m pip'

# shell aliases
alias sl='ls'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# go to dotfiles + open nvim to edit without leaving cwd
alias dots="(cd ~/.dotfiles && nvim .)"

# no need to add -t for tmux a
# tmuxa $name => tmux a -t $name
alias tmuxa='(){ tmux a -t $1;}'

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
