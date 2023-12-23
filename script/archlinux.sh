#!/bin/bash

function install_menlo_font() {
    MENLO_FONT_DIR="/usr/share/fonts/menlo/"
    sudo mkdir $MENLO_FONT_DIR

    cd /tmp
    git clone https://github.com/ueaner/fonts
    cd fonts
    sudo cp *.ttf $MENLO_FONT_DIR

    cd $MENLO_FONT_DIR
    sudo mkfontscale
    sudo mkfontdir
    fc-cache -f
}

function main() {
    install_menlo_font
    pacman -S shellcheck
    npm i -g bash-language-server
}

main


