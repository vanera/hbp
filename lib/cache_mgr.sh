#!/bin/bash


function cache_check(){
    local cache_key=$1

    if [ -f "$CACHE_DIR/$cache_key.tar.gz" ]; then;
        echo -e "CACHE HIT : $cache_key"
    else;
        echo -e "CACHE MISS : $cache_key"
    fi;
}

function cache_write(){
    tmp=$(mktmpdir php)
    cd $tmp

    local cache_key=$1
    local cache_file="$cache_key.tar.gz"
    local folder=$2

    tar -czf $cache_file /app/vendor/$folder
    mv $cache_file $CACHE_DIR/
}