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
  for DOTFILE in /home/andrewg/.dotfiles.{env,bashrc}
  do
    [ -f $DOTFILE ] && source $DOTFILE
  done
fi

