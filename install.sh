#!/bin/bash

# If not running interactively, don't do anything

# [ -z "$PS1" ] && exit

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

if [ $OS = "OSX" ]; then
  cd /Users/andrewg
  if [ "${?}" = "1" ]; then
    cd /Users/andrew
  fi
else
  cd /home/andrewg
fi
# Replace all of the above with `cd`, or `cd $HOME`?

installhome=`pwd`

source .dotfiles/.dots

# Uncomment these lines to install everything in the homebrew Brewfile
#if [ $OS = "OSX" ]; then
#  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#  source maccli.sh
#fi

# Go home to finish
cd $installhome
