#!/bin/bash


function composer_package(){
    
    cd $BUILD_DIR

    # run composer locally before deploy
    composer="$BUILD_DIR/vendor/php/bin/php $BUILD_DIR/bin/composer";
    gs
    
    $composer install --no-interaction
        # --prefer-dist \
        # --optimize-autoloader \
}