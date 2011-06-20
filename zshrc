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
# Generates ctags file in . for project in directory specified as the argument
generate_ctags(){
  if [[ -z $1 ]]; then
    source_dir='.'
  else
    source_dir=$1
  fi
  find $source_dir -iname "*.rb" | grep -v db | xargs ctags -a -f TAGS
}

# XING aliases
alias xe='cd ~/projects/xing/xing-rails; eval `~/projects/xing/xing-rails/bin/xing_env`'
alias solr_test="RAILS_ENV=test rake solr:start"

# Autoloading 'rubygems'
RUBYOPT="rubygems"
export RUBYOPT

# RVM stuff:
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Share history between multiple shells
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
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

export EDITOR="vi"
export PAGER=less
setopt IGNORE_EOF

# beeps are annoying
setopt NO_BEEP

