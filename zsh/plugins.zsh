################################################################################
#
# plugins.zsh
#
# Install zsh plugin manager + all plugins.
#
################################################################################


# Install zplug - plugin manager
# bootstrap script stolen from: https://github.com/romkatv/zsh-bench/blob/master/configs/zplug/skel/.zshrc
if [[ ! -e ~/.zplug ]]; then
  git clone --depth=1 https://github.com/zplug/zplug.git ~/.zplug
  () {
    emulate -L zsh -o extended_glob
    local f
    for f in ~/.zplug/**/*.zsh(.) ~/.zplug/autoload/**/^*.zsh(.); do
      zcompile -R -- $f.zwc $f
    done
  }
fi

# Install plugins with zplug
# https://github.com/zplug/zplug
source ~/.zplug/init.zsh

# zsh-syntax-highlighting - give color to zsh prompts
zplug "zsh-users/zsh-syntax-highlighting", depth:1

# powerlevel10k - make zsh fast af + pretty
zplug "romkatv/powerlevel10k", as:theme, depth:1

# z.lua - jump by "frecency" (fast lua port of z.sh)
zplug "skywind3000/z.lua", depth:1

zplug check || zplug install
zplug load

