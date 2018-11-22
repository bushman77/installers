#!/bin/bash

#uncomment deb-src http://au.archive.ubuntu.com/ubuntu/ bionic main restricted

sudo apt update
sudo apt build-dep imagemagick

wget https://www.imagemagick.org/download/ImageMagick.tar.gz
tar xf ImageMagick.tar.gz
cd ImageMagick-7*

./configure

make

sudo make install

sudo ldconfig /usr/local/lib
