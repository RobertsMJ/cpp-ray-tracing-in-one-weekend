#!/bin/bash

install_if_missing() {
    if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
        echo "installing $1"
        apt-get install gcc
    else
        echo "$1 already installed"
    fi
}

apt-get -qq update
install_if_missing make
install_if_missing g++
install_if_missing netpbm
