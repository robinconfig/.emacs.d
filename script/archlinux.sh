#!/bin/bash

function install_menlo_font() {
    MENLO_FONT_DIR="/usr/share/fonts/menlo/"
    sudo mkdir $MENLO_FONT_DIR

    cd /tmp || return
    git clone https://github.com/ueaner/fonts
    cd fonts || return
    sudo cp *.ttf $MENLO_FONT_DIR

    cd $MENLO_FONT_DIR || return
    sudo mkfontscale
    sudo mkfontdir
    fc-cache -f
}

function main() {
    install_menlo_font
    pacman -S shellcheck
    # install ag:
    pacman -S the_silver_searcher
    npm i -g bash-language-server
    pip install python-lsp-server
}

main


