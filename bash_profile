# Note: at present this file is only appropriate for OS X.

# Set the colour mode. We want things to look nice.
export TERM=xterm-256color

# If using tmux, use the appropriate colour mode.
[ -n "$TMUX" ] && export TERM=screen-256color

# Enable vi mode. Once you get in the habit, it's bloody hard to break it.
set -o vi

# Set vim as the default editor.
export EDITOR=vim

# Set a lazy alias to handle `ls -la`.
alias l='ls -la'

# Enable tab complete for git.
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

source ~/.git-completion.bash

# Used to include Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set the prompt
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Used by MacPorts:
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
