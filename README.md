# kfu02/dotfiles

Dotfile backup and installation for my personal use. Feel free to take whatever
interests you (nearly all of it is taken from someone else, anyhow).

## Installation

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
sudo apt install gnome-tweaks
gnome-tweaks
(follow GUI options)
```

### Both MacOS & Ubuntu

First, `git clone` this repo as `~/.dotfiles`.

 - Homebrew: Follow instructions from [their website](https://brew.sh/).
 - tmux: `brew install tmux`. Window manager.
 - tmux-plugin-manager: See [Github page](https://github.com/tmux-plugins/tpm).
 - ripgrep: `brew install ripgrep`. Needed by Telescope (nvim plugin).
 - Neovim: `brew install neovim`. (This binds neovim to `nvim`.) Create an empty init.vim file at `~/.config/init.vim`.
 - Terminal Colorscheme: Follow linked instructions. [iterm2](https://github.com/one-dark/iterm-one-dark-theme). [Ubuntu](https://github.com/denysdovhan/one-gnome-terminal/blob/master/one-dark.sh).

Then install all plugins:

 - `./link.zsh` to link all dotfiles.
 - Open neovim, Lazy.nvim will install itself, then all other plugins on launch.
 - Hit `prefix + I` in tmux.

Double-check all plugins in neovim are working correctly with `:Lazy`.

## Notes

 - Lazy.nvim allows me to store plugin installs and configuration in the same
   file, so that's why I now have a monolithic `init.lua`. The only catch is
   that I have some old vim binds/options that I didn't want to migrate to Lua
   (because then I'd have to learn Lua) so I simply import those as
   `mappings.vim` in `init.lua`. Someday I should learn
   how to import other Lua files into `init.lua`.
 - `zsh/` stores the config file for
   [powerlevel10k](https://github.com/romkatv/powerlevel10k), which prevents me
   from having to re-configure that for every new machine. p10k can be
   reconfigured easily with `p10k configure`, which opens up a nice CLI config
   widget.

**TODO:** configure dotbot for auto-installation: https://github.com/anishathalye/dotbot, 

**TODO:** OR use bare git repo

**TODO:** commit colorschemes/fonts to this repo so I don't have to reinstall every time

