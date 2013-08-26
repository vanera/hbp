#!/bin/bash
function bundle_install(){
    
    PHP_VERSION="5.4.14"
    
    echo -e "-----> Unbundling binary package"
    
    mkdir -p /app/vendor
    base=/app/vendor
    
    echo -e ""
    ls /app/vendor/p7zip
    echo -e ""
    ls /app/vendor/p7zip/bin
    echo -e ""
    echo -e ""

    7z="/app/vendor/p7zip/bin/7za"
    
    # package.tar.gz contains lua, lua-jit and nginx and friends
    $7z e $ROCK_DIR/packages/dist/php.7z -o$base/php
    $7z e $ROCK_DIR/packages/dist/lua.7z -o$base/lua
    $7z e $ROCK_DIR/packages/dist/luajit.7z -o$base/luajit
    $7z e $ROCK_DIR/packages/dist/lualib.7z -o$base/lualib
    $7z e $ROCK_DIR/packages/dist/nginx.7z -o$base/nginx

    echo -e "Finished installing the binary bundle" | indent
}