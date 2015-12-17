#!/bin/bash

CLIPROGS="gfortran pkg-config ghostscript imagemagick tmux netpbm hdf5 htop-osx ilmbase openexr "

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
