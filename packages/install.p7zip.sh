#!/bin/bash


function install_p7zip(){

    # cd $ROCK_DIR/3rdparty/p7zip
    # echo -e "Compiling p7zip" | indent
    # make -j4 -s
    # echo -e "Installing p7zip" | indent
    # make install -s
    proot=/app/vendor/p7zip/bin

    mkdir -p $proot
    cd $proot

    cp $ROCK_DIR/packages/dist/7za.tar.gz ./
    tar -xf 7za.tar.gz
}