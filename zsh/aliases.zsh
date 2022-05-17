################################################################################
#
# aliases.zsh
#
# Add useful aliases to zsh.
#
################################################################################

# python aliases
alias python='python3'
alias pip='python -m pip'

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

    # GREENZIE
    # clang format current file
    alias cf='git add *.cpp *.h *.hpp *.ino && clang-format-9 -i -style=file $(comm -12 \
    <(git diff origin/master --name-only | sort) \
    <(find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.ino" \) | cut -c 3- | sort)) && \
    git add *.cpp *.h *.hpp *.ino'
  ;;
esac
