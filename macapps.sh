#!/bin/bash

#PROGRAMS="atom postbox slack basictex firefox evernote iterm2 steam google-chrome caffeine gimp xquartz carbon-copy-cloner gimp github-desktop grandperspective inkscape limechat mendeley-desktop microsoft-office papers shiori skype sonos sourcetree textmate things vlc kensington-trackball-works dropbox"
PROGRAMS=

for prog in `echo $PROGRAMS`
do
  brew cask install $prog
done

exit 0

# Not in Cask:
# Firefox add-ons (installed via sync)
# ARRIRAWConverter
# ARC_CMD
# Blackmagic utils
# CKAN
# dzc-ffor
# Pages, Numbers, Keynote
# MS Remote Desktop?? (part of office?)
# Xcode (+ cmd line)
# Rapport

# Don't want to install via cask:
# 1password (Not from Mac App store either!)

# Steam:
# YNAB
# KSP

# Failed December 2015
# github-desktop



# Once installed, no longer needed:
# Juno, Lighttable
# LightPaper
# LibreOffice
# matlab
# Loose Leaves
# MacDown
# Monodraw
# Mou
# Handbrake
# MPEG Streamclip
# MPlayerX
# VirtualBox
# VMWare Fusion
# fuse-ext2 & OSXFUSE
# Flash Player
# miniconda
