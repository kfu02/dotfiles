################################################################################
#
# magic-enter.zsh
#
# When enter pressed on an empty prompt, clear screen. Otherwise enter
# prompt.
#
# https://superuser.com/questions/625652/alias-empty-command-in-terminal/625663#625663
# https://superuser.com/questions/1389834/can-i-have-the-terminal-prompt-at-the-vertical-middle-of-a-window
#
################################################################################

magic-enter () {
    if [[ -z $BUFFER ]]
    then
            zle clear-screen
    else
            zle accept-line
    fi
}
zle -N magic-enter
bindkey "^M" magic-enter
