#!/bin/bash


function install_pz7ip(){
    cd $ROCK_DIR/3rdparty/p7zip

    make -j4
    make install

}