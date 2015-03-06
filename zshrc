# oh-my-zsh configuration:
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
plugins=(rails ruby git bundler zsh-syntax-highlighting wd)
source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/bin:$PATH" # make /usr/local/bin preced /usr/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export REPORTTIME=10 # reports time of long-running commands
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export PAGER=less
#export DOCKER_HOST=tcp://:2375 # boot2docker port

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

alias ls='ls -FG'
alias ll='ls -lFG'
alias grep='grep --color=auto'
alias v='vim'
alias g='git'
alias gl='git ls'
alias gst='git status -sb'
alias gd='git d'
alias gshow='git show --word-diff'
alias gc='git commit -v'
alias gca='git commit -av'
alias gcaa='git add . && git commit -av'
alias tmk='tmux kill-session -t'
alias j='fasd_cd -d'
alias x='exit'

# Generates ctags file in . for project in directory specified as the argument
generate_ctags(){
  if [[ -z $1 ]]; then
    source_dir='.'
  else
    source_dir=$1
  fi
  find $source_dir -iname "*.rb" | grep -v db | xargs ctags -a -f TAGS
}

# make vim a pager
function vless() {
 local less_path=`find $(vim --version | awk ' /fall-back/ { gsub(/\"/,"",$NF); print $NF }'  )/ -name less.sh`
 if [[ -z $less_path ]]; then
   echo 'less.sh not found'
   exit 1
 fi
 $less_path $*
}

# Easy en/decryption in command line using openssl
encrypt () { openssl des3 -in $1 -out $1.encrypted }
decrypt () { FILENAME=$(echo $1|sed -e 's/\.encrypted$//g'); openssl des3 -d -in $1 -out $FILENAME }

unsetopt correct_all

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
setopt IGNORE_EOF
setopt NO_BEEP # remove beeps

# Homebrew
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh # autojump

# fasd
eval "$(fasd --init auto)"

