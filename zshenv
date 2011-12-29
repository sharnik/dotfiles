export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH
export PATH=/usr/local/ruby187pl329patched/bin:$PATH
export PATH=~/bin:$PATH
export DISPLAY=:0.0
export INPUTRC=~/.inputrc

# Fixes MySQL configuration:
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Fixes rmagick configuration:
export MAGICK_HOME="/usr/local/lib/ImageMagick-6.7.3"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/:$DYLD_LIBRARY_PATH"

# RVM stuff:
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

