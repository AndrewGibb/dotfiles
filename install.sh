#!/bin/bash

# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

if $OS = "OSX"
  cd /Users/andrewg
else
  cd /home/andrewg
end

source .dotfiles/.dots
# Install homebrew

if $OS = OSX
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew install brew-cask
  brew tap caskroom/versions
end


if $OS = "OSX"
  source .dotfiles/macapps.sh
  source .dotfiles/maccli.sh
end
