#!/bin/bash


function install_p7zip(){

    cd $ROCK_DIR/3rdparty/p7zip
    echo -e "Compiling p7zip" | indent
    make -j4 -s
    echo -e "Installing p7zip" | indent
    make install -s
}