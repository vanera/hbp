#!/bin/bash


function install_p7zip(){
    cd $ROCK_DIR/3rdparty/p7zip

    make -j4
    make install

}