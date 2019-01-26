# oh-my-zsh configuration:
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
plugins=(git bundler zsh-syntax-highlighting wd)
source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/Applications"
export PATH="/usr/local/bin:$PATH" # make /usr/local/bin preced /usr/bin
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="$PATH:$HOME/Applications/gradle-2.8/bin"

export REPORTTIME=10 # reports time of long-running commands
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export PAGER=less

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# JS stuff
export NODE_PATH="/usr/local/lib/node_modules"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export PATH="$PATH:$(yarn global bin)"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

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
alias m='mux'
alias t='tmux'
alias tmk='tmux kill-session -t'
alias j='fasd_cd -d'
alias x='exit'
alias spoof-nsa='sudo spoof set 00:20:91:34:56:78 en0'
alias yt='cclive --filename-format=%t.mp4'
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'
alias android-emulator='/Users/sharnik/Library/Android/sdk/tools/emulator -avd '
alias cat='bat'
alias ping='prettyping'
alias httpstat='httpstat.py'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'

# Generates ctags file in . for project in directory specified as the argument
generate_ctags(){
  if [[ -z $1 ]]; then
    source_dir='.'
  else
    source_dir=$1
  fi
  find $source_dir -iname "*.rb" | grep -v db | xargs ctags -a -f TAGS
}

# make nvim a pager
function vless() {
 local less_path=`find $(nvim --version | awk ' /fall-back/ { gsub(/\"/,"",$NF); print $NF }'  )/ -name less.sh`
 if [[ -z $less_path ]]; then
   echo 'less.sh not found'
   exit 1
 fi
 $less_path $*
}

# Notifies when a terminal command finishes in the background
function f_notifyme {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notifyme "$CMD" "$LAST_EXIT_CODE" &
}
export PS1='$(f_notifyme)'$PS1

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

# Android SDK paths for React Native
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK=~/Applications/android/android-ndk-r10e
export PATH=${PATH}:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/sharnik/Code/brains-and-beards/APIMocker/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/sharnik/Code/brains-and-beards/APIMocker/node_modules/tabtab/.completions/electron-forge.zsh

# OPAM configuration
. /Users/sharnik/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#Visual Studio Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
