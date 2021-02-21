# oh-my-zsh configuration:
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/Applications"
export PATH="/usr/local/bin:$PATH" # make /usr/local/bin preced /usr/bin
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

export REPORTTIME=10 # reports time of long-running commands
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export PAGER=less

source ~/Code/open-source/dotfiles/secret-vars

# JS stuff
export NODE_PATH="/usr/local/lib/node_modules"
eval `fnm env`
export PATH="$PATH:$(yarn global bin)"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

alias g='git'
alias ls='ls -FG'
alias ll='ls -lFG'
alias grep='grep --color=auto'
alias v='vim'
alias vim='nvim'
alias m='mux'
alias t='tmux'
alias tx='tmuxinator'
alias tmk='tmux kill-session -t'
alias j='fasd_cd -d'
alias x='exit'
alias spoof-nsa='sudo spoof set 00:20:91:34:56:78 en0'
alias yt='youtube-dl -o "%(title)s.%(ext)s" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
alias yta='youtube-dl -o "%(title)s.%(ext)s" -f "bestaudio[ext=m4a]"'
alias android-emulator='/Users/sharnik/Library/Android/sdk/tools/emulator -avd '
alias cat='bat'
alias ping='prettyping'
alias httpstat='httpstat.py'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
alias du="dust"
alias help='tldr'

# Notifies when a terminal command finishes in the background
function f_notifyme {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notifyme "$CMD" "$LAST_EXIT_CODE" &
}
# Temporarily disable notifications from CLI
# export PS1='$(f_notifyme)'$PS1

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
export PATH=${PATH}:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/sharnik/Code/brains-and-beards/APIMocker/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/sharnik/Code/brains-and-beards/APIMocker/node_modules/tabtab/.completions/electron-forge.zsh

# OPAM configuration
. /Users/sharnik/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#Visual Studio Code
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# Flutter SDK
export PATH=$PATH:~/Applications/flutter/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
