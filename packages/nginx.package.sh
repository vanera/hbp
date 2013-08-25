#!/bin/bash
function nginx_package(){
    
    PCRE_TAR="pcre-8.33.tar.gz"

    OPENRESTY_VERSION="1.2.8.6"
    OPENRESTY_FILE="ngx_openresty-$OPENRESTY_VERSION"
    OPENRESTY_URL="http://openresty.org/download/$OPENRESTY_FILE.tar.gz"

    echo -e "-----> Packaging NGINX OpenResty Build"
    echo -e "Preparing PCRE" | indent

    cd $ROCK_DIR/support
    curl -O -L "http://downloads.sourceforge.net/sourceforge/pcre/$PCRE_TAR"
    tar -xzf $PCRE_TAR
    pcre_dir="$ROCK_DIR/support/$(ls -d pcre*/ | head -n 1)"

    echo -e "1. Preparing NGINX" | indent

    mkdir -p /app/vendor/nginx
    cd /app/vendor/nginx
    

    echo -e "2. Fetching NGINX" | indent

    curl $OPENRESTY_URL > ngx.tar.gz
    tar -xzf ngx.tar.gz
    

    cd $OPENRESTY_FILE

    echo -e "3. Configuring NGINX" | indent

    ./configure --prefix=/app/vendor \
        --with-pcre=$pcre_dir \
        --with-luajit \
        --with-http_postgres_module \
        2>&1 >/dev/null


    echo -e "4. Building NGINX" | indent
    make -j4 -s


    echo -e "5. Installing NGINX" | indent
    make install -s -j4

    cd ..

    # cleanup
    rm ngx.tar.gz
    rm -rf $OPENRESTY_FILE
}