# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# source the files (order matters)
if $OS = "OSX"
  for DOTFILE in `/Users/andrewg/.dotfiles/.{.env}`
  do
    [ -f “$DOTFILE” ] && source “$DOTFILE”
  done
else
  for DOTFILE in `find /home/andrewg/.dotfiles.{.env}`
  do
    [ -f “$DOTFILE” ] && source “$DOTFILE”
  done
fi
