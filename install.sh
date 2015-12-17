#!/bin/bash

# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# Install homebrew
if $OS = OSX
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew install brew-cask
  brew tap caskroom/versions
end

if $OS = "OSX"
  cd /Users/andrewg
else
  cd /home/andrewg
end

# source the files (order matters)
if $OS = "OSX"
  for DOTFILE in `/Users/andrewg/.dotfiles/.{.env,.dots,macapps.sh}`
  do
    [ -f “$DOTFILE” ] && source “$DOTFILE”
  done
else
  for DOTFILE in `find /home/andrewg/.dotfiles.{.env,.dots}`
  do
    [ -f “$DOTFILE” ] && source “$DOTFILE”
  done
fi
