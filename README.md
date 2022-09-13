<img src="https://shields.io/badge/jonasleonhard.de-offline-red?style=flat-square&logo=statuspal" />

<img src="https://shields.io/badge/pipelines-offline-red?style=flat-square&logo=github" />

<br/><br/>

# Description

Custom <a href="https://www.lunarvim.org/)">Lvim</a> Neovim Configuration. Aiming to make Neovim usable as a replacement for VSCode

## Status

- [x] _in progress_
- [ ] _finished_
- [ ] _no longer continued_

## Table of contents

- [Description](#description)
- [Status](#status)
- [Table of contents](#table-of-contents)
- [General Info](#general-info)
- [Screenshots](#screenshots)
- [Technologies](#technologies)
- [Setup](#setup)
- [Known Issues](#known-issues)

## General Info

This Project aims to provide a personal portfolio about me and my work, aswell as a blog where
i write what comes to my mind.
UNDER CONSTRUCTION

config code:

1. Plugins are beeing loaded with packer in lua/user/plugins via "Packer"
2. general or plugin specific Configuration is loaded in lua/user/\*.

Install LSP's, run:

```
:Mason
```

Install Treesitter Syntax highlighting, run:

```
:TSInstall all // or :TSInstallInfo for a list of installable options
```

## Screenshots

<![UNDER CONSTRUCTION](./readme/Dashboard.png)
<![MainView](./readme/MainView.png)

>

## Technologies

This config configures Plugins with Packer on top of the Lunarvim base-configuration. Added Configs / Plugins are:

- Gui Client: Neovide
- MesloLGSDZ Nerd Font
- kaicataldo/material.vim Material theme
- phazoon/hop.nvim fast motions
- lukas-reineke/indent-blankline.nvim with custom highlighting for current_context
- petertriho/nvim-scrollbar scrollbar with diagnostic indicators
- kevinhwang91/nvim-ufo nvim-fold customization with cusmized clickable icons and highlighted fold lines
- folke/todo-comments.nvim Highlighting for Todo comments
- norcalli/nvim-colorizer.lua Color highlighting in code
- lumiliet/vim-twig .twig file syntax highlighting
- windwp/nvim-ts-autotag autotag closing for div...
- Custom Alpha Dashboard Icon
- Null-Ls config for prettier & eslint

## Setup

Setup neovim, lunarvim & neovide. Add this config to '~/.config/lvim'

```
rm -rf ~/.config/lvim
git clone https://github.com/JonasLeonhard/lvim-config.git ~/.config/lvim
```

add a nvim command alias to your ~/zshrc

```
alias nvim=~/.config/lvim/lvim-gui.sh
```

now open neovide nvim and run to install config

```
:PackerSync
```

install Lazygit config + delta gitdiff view:

```
brew install lazygit
brew install git-delta
cp ./lazygit.config.yml ~/Library/Application\ Support/lazygit
mv ~/Library/Application\ Support/lazygit/lazygit.config.yml ~/Library/Application\ Support/lazygit/config.yml
```

## MacOS

copy the NVIMRunner into the /Applications folder:
This allows to Start Nvim via Spotlight / via right click of a file -> open with.
The script used to generate the NvimRunner.app in Automator can be found in nvimRunner.applescript (credit goes to <a href="https://gregrs-uk.github.io/2018-11-01/open-files-neovim-iterm2-macos-finder/">Open files in Nvim</a>)

Issues: To Update the icon, right-click and get info.

```
cp -R NvimRunner.app /Applications/
```

## Known Issues / Missing Features

---

```

```
