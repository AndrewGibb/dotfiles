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
else
  cd /home/andrewg
fi

source .dotfiles/.dots
# Install homebrew
if [ $OS = OSX ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew install brew-cask
  brew tap caskroom/versions
fi


if [ $OS = "OSX" ]; then
  cd /Users/andrewg
else
  cd /home/andrewg
fi

#source .dotfiles/.dots
if [ $OS = "OSX" ]; then
  source .dotfiles/macapps.sh
  source .dotfiles/maccli.sh
fi
