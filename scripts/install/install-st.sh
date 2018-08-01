#!/bin/env sh

INSTALL_DIR=~/Projects

mkdir $INSTALL_DIR

git clone https://github.com/e-trindade/st.git $INSTALL_DIR/st

cd $INSTALL_DIR/st

make
sudo make install

