# If not running interactively, don't do anything

#[ -z "$PS1" ] && exit

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# source the files (order matters)
if [ "$OS" = "OSX" ]; then
#  for DOTFILE in ${HOME}/.dotfiles/.{bashrc,env}; do
#   [ -f $DOTFILE ] && source $DOTFILE
#  done
  [ -f ${HOME}/.dotfiles/.env ] && source ${HOME}/.dotfiles/.env
else
  [ -f "/home/andrewg/.dotfiles/.env" ] && source "/home/andrewg/.dotfiles/.env"
#  for DOTFILE in `find /home/andrewg/.dotfiles/{.env}`
#  do
#    [ -f “$DOTFILE” ] && source “$DOTFILE”
#  done
fi

# Auto-set network proxies:
export NETWORK_LOCATION="$(/usr/sbin/scselect 2>&1 | egrep '^ \*' | sed 's:.*(\(.*\):\1:')"
if [[ "$NETWORK_LOCATION" =~ BBCRD ]]; then
    export http_proxy="http://www-cache.rd.bbc.co.uk:8080"
    export https_proxy="http://www-cache.rd.bbc.co.uk:8080"
fi

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

eval "$(starship init bash)"

# make tmux vim solarized colours behave
#alias tmux="TERM=screen-256color tmux"
