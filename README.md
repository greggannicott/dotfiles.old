# dotfiles

This is a collection of the dotfiles I use primarily on OS X, in Linux, and in Vim's case it's files also get used on Windows.

These instructions are for OS X and Linux. You're on your own with Windows.

# Installation

## Checkout of Files

1. `cd ~/ && git clone https://github.com/greggannicott/dotfiles.git`

## Symlink Creation

1. `cd ~/dotfiles`
1. `chmod 777 makesymlinks.sh`
1. `./makesymlinks.sh`

`makesymlinks.sh` will:

- Move aside any existing dot files to `~/dotfiles_old`.
- Create symlinks to the relevant files in `~/dotfiles/`.


## Vim Plugins Install

Plugins are managed using `vundle`.

If you haven't already done so, install `vundle` as follows:

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Install the plugins listed in the `.vimrc` file by running:

    vim +PluginInstall +qall

# Performing Updates

## Updating Dotfiles and Plugins

This will get the latest dotfiles from github, and take care of the symlinks for any newly added files.

1. `cd ~/dotfiles`
1. `git pull`
1. `./makesymlinks.sh`

If `.vimrc` contains any new plugins, run:

    vim +PluginInstall +qall

# Configuration

## Configuring which Dotfiles are Symlinked

1. Edit `makesymlinks.sh`.
1. Update the `files` array to include the files you wish to create symlinks for.

# Notes

- A symlink to `.bash_profile` isn't currenly created. This is because I'm not confident that the `.bash_profile` in this repository is appropriate for both the Mac and Ubuntu.
