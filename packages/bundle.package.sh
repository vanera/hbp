#!/bin/bash
function bundle_package(){
    
    PHP_VERSION="5.4.14"
    
    echo -e "-----> Unbundling binary package"
    
    mkdir -p /app/vendor
    mkdir -p /app/vendor/php
    
    # package.tar.gz contains lua, lua-jit and nginx and friends
    tar -xzf $ROCK_DIR/packages/dist/php.tar.gz  -C /app/vendor/
    tar -xzf $ROCK_DIR/packages/dist/lua.tar.gz  -C /app/vendor/
    tar -xzf $ROCK_DIR/packages/dist/luajit.tar.gz  -C /app/vendor/
    tar -xzf $ROCK_DIR/packages/dist/lualib.tar.gz  -C /app/vendor/
    tar -xzf $ROCK_DIR/packages/dist/nginx.tar.gz  -C /app/vendor/

    echo -e "Finished installing the binary bundle" | indent
}