# oh-my-zsh configuration:
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
plugins=(rails ruby git)
source $ZSH/oh-my-zsh.sh

# My zsh configuration:
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
export PATH=/usr/local/ruby187pl329patched/bin:$PATH
export DISPLAY=:0.0
export INPUTRC=~/.inputrc

alias mysql=/usr/local/mysql/bin/mysql
alias ls='ls -FG'
alias ll='ls -lFG'
alias grep='grep --color=auto'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset — %s%Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gs='git status'
alias ggraph='git log --graph --decorate --oneline'

# XING aliases
alias xe='cd ~/projects/xing/xing-rails && eval `bin/xing_env`'
alias solr_test="RAILS_ENV=test rake solr:start"

# Autoloading 'rubygems'
RUBYOPT="rubygems"
export RUBYOPT

# Share history between multiple shells
setopt SHARE_HISTORY

# Don't overwrite, append!
setopt APPEND_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

export LANG=en_US.UTF-8

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt VI
export EDITOR="vi"
export PAGER=less
setopt IGNORE_EOF

# beeps are annoying
setopt NO_BEEP

