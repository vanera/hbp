#!/bin/bash
function bundle_package(){
    
    PHP_VERSION="5.4.14"
    
    echo -e "-----> Unbundling binary package"
    
    mkdir -p /app/vendor
    mkdir -p /app/vendor/php

    7z=/app/vendor/p7zip/bin/7z
    ex="e"
    # package.tar.gz contains lua, lua-jit and nginx and friends
    $7z e $ROCK_DIR/packages/dist/php.7z
    $7z e $ROCK_DIR/packages/dist/lua.7z
    $7z e $ROCK_DIR/packages/dist/luajit.7z
    $7z e $ROCK_DIR/packages/dist/lualib.7z
    $7z e $ROCK_DIR/packages/dist/nginx.7z

    echo -e "Finished installing the binary bundle" | indent
}