# oh-my-zsh configuration:
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
plugins=(rails ruby git bundler)
source $ZSH/oh-my-zsh.sh

alias mysql=/usr/local/mysql/bin/mysql
alias ls='ls -FG'
alias ll='ls -lFG'
alias grep='grep --color=auto'
alias g='git'
alias gl='git lg'
alias gs='git status'

# Generates ctags file in . for project in directory specified as the argument
generate_ctags(){
  if [[ -z $1 ]]; then
    source_dir='.'
  else
    source_dir=$1
  fi
  find $source_dir -iname "*.rb" | grep -v db | xargs ctags -a -f TAGS
}

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
setopt AUTO_CD # type 'dir' instead of 'cd dir'
setopt CORRECT # spellcheck commands
setopt RM_STAR_WAIT #wait 10 second before executing rm *
export EDITOR="vim"
export PAGER=less
setopt IGNORE_EOF
setopt NO_BEEP # remove beeps

export REPORTTIME=10 # reports time of long-running commands
export LANG=en_US.UTF-8

# Loads RVM
[[ -s "/Users/sharnik/.rvm/scripts/rvm" ]] && source "/Users/sharnik/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Fixes MySQL for pow.cx:
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
