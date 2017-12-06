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
  for DOTFILE in /Users/andrewg/.dotfiles/.{bashrc,env}; do
   [ -f $DOTFILE ] && source $DOTFILE
  done
else
  [ -f "/home/andrewg/.dotfile/.env" ] && source "/home/andrewg/.dotfile/.env"
#  for DOTFILE in `find /home/andrewg/.dotfiles/{.env}`
#  do
#    [ -f “$DOTFILE” ] && source “$DOTFILE”
#  done
fi


# make tmux vim solarized colours behave
#alias tmux="TERM=screen-256color tmux"
