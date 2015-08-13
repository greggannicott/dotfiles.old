dotfiles
========

This is a collection of the dotfiles I use primarily on the Mac, in Linux, but in Vim's case it's files also get used on Windows.

Usage
=====

These instructions are for the Mac and Linux. You're on your own with Windows.

Initial Install
---------------

1. Open a terminal 
1. `cd ~/`
1. `git clone https://github.com/greggannicott/dotfiles.git`
1. `cd ~/dotfiles`
1. `chmod 777 makesymlinks.sh`
1. `./makesymlinks.sh`

`makesymlinks.sh` will:

- Move aside any existing dot files to `~/dotfiles_old`.
- Create symlinks to the relevant files in `~/dotfiles/`.

Updating
--------

This will get the latest versions from github, and take care of any newly added files.

1. `cd ~/dotfiles`
1. `git pull`
1. `./makesymlinks.sh`

Notes
-----

- A symlink to `.bash_profile` isn't currenly created. This is because I'm not confident that the `.bash_profile` in this repository is appropriate for both the Mac and Ubuntu.

Configuration
=============

Configuring which Dotfiles are Symlinked
----------------------------------------

1. Edit `makesymlinks.sh`.
1. Update the `files` array to include the files you wish to create symlinks for.
