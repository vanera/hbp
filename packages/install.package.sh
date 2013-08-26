#!/bin/bash



function install_packages(){


    
    echo -e "Extracting Libraries" | indent
    
    ROCK_DIR=/app
    base=/app/vendor
    mkdir -p $base
    
    echo -e ""
    ls /app/vendor/p7zip
    echo -e ""
    ls /app/vendor/p7zip/bin
    echo -e ""
    echo -e ""

    7z="/app/vendor/p7zip/bin/7za"
    
    # package.tar.gz contains lua, lua-jit and nginx and friends
    $7z e $ROCK_DIR/packages/dist/php.7z -o$base/php -y > /dev/null
    $7z e $ROCK_DIR/packages/dist/lua.7z -o$base/lua -y > /dev/null
    $7z e $ROCK_DIR/packages/dist/luajit.7z -o$base/luajit -y > /dev/null
    $7z e $ROCK_DIR/packages/dist/lualib.7z -o$base/lualib -y > /dev/null
    $7z e $ROCK_DIR/packages/dist/nginx.7z -o$base/nginx -y > /dev/null

    echo -e "Finished installing the binary bundle" | indent
}