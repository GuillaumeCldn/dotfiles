# About

This repo stores the configuration files of my most used TUIs using GNU stow:

- ZShell
- Tmux
- Neovim
- Vim

## Instructions

### Adding files to the repo

- Move the file(s) to ~/.dotfiles/<_stow directory_> with the same structure as in their original location.
- Run `$ stow <stow directory>`
- Update remote with git

### Removing files from the repo

- Run `$stow -D <stow directory>` to unstow the file(s)
- Move the file back(s) to their original location.
- Update remote with git

## Links

The manual for GNU stow can be found [here](https://www.gnu.org/software/stow/manual/).

A good tutorial can be found [here](https://youtu.be/06x3ZhwrrwA?si=4gCTKejHl8rzeBwX).
