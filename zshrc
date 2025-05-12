# Load homebrew paths
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh-my-zsh configuration:
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(jj)

export PATH="$PATH:$HOME/Applications"
export PATH="/usr/local/bin:$PATH" # make /usr/local/bin preced /usr/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export REPORTTIME=10 # reports time of long-running commands
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export PAGER=less

source ~/Code/open-source/dotfiles/secret-vars

# JS stuff
export NODE_PATH="/usr/local/lib/node_modules"

# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

alias g='git'
alias j='jj'
alias grep='grep --color=auto'
alias v='vim'
alias vim='nvim'
alias m='mux'
alias t='tmux'
alias tx='tmuxinator'
alias tmk='tmux kill-session -t'
alias x='exit'
alias spoof-nsa='sudo spoof set 00:20:91:34:56:78 en0'
alias yt='yt-dlp -o "%(title)s.%(ext)s" -S "res:1080,ext,codec"'
alias yta='yt-dlp -o "%(title)s.%(ext)s" --extract-audio --audio-quality 0 --audio-format mp3'
alias android-emulator='/Users/sharnik/Library/Android/sdk/emulator/emulator -avd '
alias cat='bat'
alias ping='prettyping'
alias httpstat='httpstat.py'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop" # alias top and fix high sierra bug
alias du="dust"
alias help='tldr'

alias l='eza -G  --color auto --icons -a -s type'
alias ll='eza -l --color always --icons -a -s type'

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

# Android SDK paths for React Native
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools

#Visual Studio Code
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

source <(fzf --zsh)

# jj autocompletion
source <(jj util completion zsh)

# ASDF (versioning system tools per project, used for Ruby)
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

eval "$(zoxide init --cmd z zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Allow switching directories using `yazi`
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

setopt PROMPT_SUBST
_my_theme_vcs_info() {
  jj log --no-graph -r @ --ignore-working-copy -T 'self.change_id().shortest(3) ++ " " ++ description.first_line()' \
  || git_prompt_info
}
export PROMPT='$(_my_theme_vcs_info) ❯ '
