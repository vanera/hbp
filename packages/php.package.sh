#!/bin/bash

function php_package(){
    tmp=$(mktmpdir php)
    cd $tmp
    
    php_version="5.5.3"
    zlib_version="1.2.8"

    echo "-----> Downloading dependency zlib ${zlib_version}"

    curl -LO "http://zlib.net/zlib-${zlib_version}.tar.gz"
    tar -xzf "zlib-${zlib_version}.tar.gz"

    echo "-----> Downloading PHP $php_version"
    curl -LO "http://php.net/distributions/php-${php_version}.tar.gz"
    tar -xzf "php-${php_version}.tar.gz"

    echo "-----> Preparing Build Command"

    mkdir -p "/app/vendor/php/zlib"
    
    cd zlib-${zlib_version};
    
    echo "-----> Configuring Zlib"
    ./configure --prefix=/app/vendor/php/zlib 2>&1 >/dev/null
    
    echo "-----> Compiling Zlib"
    make -s -j4
    make install -s -j4
    
    cd ../php-${php_version};

    echo "-----> Configuring PHP"
     ./configure --prefix=/app/vendor/php \
        --with-config-file-path=/app/vendor/php/etc \
        --with-config-file-scan-dir=/app/vendor/php/etc/conf.d \
        --with-gd \
        --with-mysql \
        --with-mysqli \
        --with-pdo-mysql \
        --with-pdo-sqlite \
        --with-pdo-pgsql=/usr/bin/pg_config \
        --with-pgsql=/usr/lib/postgresql/8.4/bin \
        --enable-shmop \
        --enable-zip \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
        --with-zlib=/app/vendor/php/zlib \
        --with-openssl \
        --enable-soap \
        --enable-xmlreader \
        --with-xmlrpc \
        --with-curl=/usr \
        --with-xsl \
        --enable-fpm \
        --enable-mbstring \
        --enable-pcntl \
        --disable-debug 2>&1 >/dev/null

    echo "-----> Compiling PHP"
    make -s -j4
    make install -s -j4
    cd ..
    
    rm -rf php-${php_version}.tar.gz

    echo "-----> Executing PHP Pear"
    /app/vendor/php/bin/pear config-set php_dir /app/vendor/php \
        && yes '' | /app/vendor/php/bin/pecl install apc-beta \
        && yes '' | /app/vendor/php/bin/pecl install memcache 
    

    echo "-----> PHP Build finished and installed to /app/vendor"

}