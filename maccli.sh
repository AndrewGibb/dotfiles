#!/bin/bash

CLIPROGS="gcc pkg-config ghostscript imagemagick tmux netpbm homebrew/science/hdf5 htop-osx ilmbase openexr cmake"

# Possible others:
# protobuf241
# python
# cmake
# freetype
# glew
# gnuplot
# graphicsmagick
# libtool
# osctave

for prog in `echo $CLIPROGS`
do
  brew install $prog
done

exit 0
