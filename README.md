# kfu02/dotfiles

Dotfile backup and installation for my personal use. Feel free to take whatever
interests you (nearly all of it is taken from someone else, anyhow).

## Brief Install List

**Disclaimer:** this is not meant to be installed by someone else, so if it's
buggy or the instructions are vague, that's why.

### Ubuntu-only

*These are installed by default on MacOS.*

 - zsh: `sudo apt install zsh`. Then search "how to make zsh default shell" and
   follow instructions. Pick the option that creates an empty .zshrc.
 - git: `sudo apt install git`.
 - Lua: `sudo apt install lua`.

For your sanity, bind caps lock to ESC with gnome-tweaks:

```
sudo apt install gnome-tweak-tool
gnome-tweaks
(follow GUI options)
```

### Both MacOS & Ubuntu

First, `git clone` this repo as `~/.dotfiles`.

 - Homebrew: Follow instructions from [their website](https://brew.sh/).
 - tmux: `brew install tmux`. Window manager.
 - ripgrep: `brew install ripgrep`. Needed by Telescope (nvim plugin).
 - nodeJS: `brew install node`. Needed by coc.nvim (nvim plugin). 
 - Neovim: `brew install neovim`. (This binds neovim to `nvim`.) Create an empty init.vim file at `~/.config/init.vim`.
 - Vim-Plug: Follow instructions from the [GitHub page](https://github.com/junegunn/vim-plug#neovim). 
 - Terminal Colorscheme: Search for "iterm2/GNOME One Dark themes" and follow
   instructions.

Then install all plugins:

 - `./link.zsh` to link all dotfiles.
 - Run `:PlugInstall` in neovim.
 - Hit `prefix + I` in tmux.

Double-check all plugins in neovim are working correctly with `:checkhealth`.

## Structure

I change stuff often, but this covers what won't change often (I hope).

I structured the `nvim/` folder to comply with
[Sourcery](https://github.com/jesseleite/vim-sourcery), a vim plugin that helps
organize init.vim configs and auto-loads changes on source. I enjoyed this
organization so much that I used it for the `zsh/` folder too, to organize an
unruly zshrc file. 

For reference, here's the `nvim/` folder:
```
nvim/
 |--init.vim
 |--plugins.vim
 |--mappings.vim
 |--config/
```
`plugins.vim` handles plugin installation, `mappings.vim` handles basic config
options + vim binds, and `config/` handles any more complex plugin
configurations.

The `zsh/` folder is similar, but splits `mappings.vim` into two files:
`aliases.zsh` and `config.zsh`. Why? I didn't like the Sourcery default
of having binds/aliases and basic config options in the same file, so I
changed it. `zsh/` also stores the config file for
[powerlevel10k](https://github.com/romkatv/powerlevel10k), which prevents
me from having to re-configure that for every new machine. p10k can be
reconfigured easily with `p10k configure`, which opens up a nice CLI
config widget.

Finally, there's `link.zsh`, which symlinks the dotfiles on any machine to the
dotfiles in this repo. At some point I would like to avoid manually writing
this, but for now...

**TODO:** configure dotbot for auto-installation: https://github.com/anishathalye/dotbot
