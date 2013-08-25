#!/bin/bash
function lua_package(){

    export LUA_INSTALL_DIR=/app/vendor/lua

    LUA_VERSION="5.2.2"
    LUA_NAME="lua-$LUA_VERSION"

    cd $ROCK_DIR/3rdparty/lua 
    echo -e "Building $LUA_NAME" | indent
    make linux -s -j4

    echo -e "LUA: Finished Compiling" | indent | indent
    make install -s -j4
    echo -e "LUA: Finished Installing" | indent | indent
}