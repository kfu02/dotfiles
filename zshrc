# python aliases
alias python='python3'
alias py='python'
alias pip='python -m pip'

# shell aliases
alias ..="cd .."
alias sl='ls'
alias rm='rm -i'

# vim aliases
alias v='nvim'
alias -g nvrc='~/.config/nvim/init.vim'

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

# pure theme
#
# install:
# mkdir -p "$HOME/.zsh"
# git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
#
# config:
fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# fasd replaced with z
# download: https://raw.githubusercontent.com/rupa/z/master/z.sh
. ~/z.sh
# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# use Vi keybindings on the command line
bindkey -v

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# zsh-syntax-highlighting

# OS-specific aliases
case `uname` in
  Darwin)
    # commands for OS X go here
    source /Users/kevinfu/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
  Linux)
    # commands for Linux go here
    source /home/kfu/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
esac
