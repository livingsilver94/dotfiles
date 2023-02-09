#!/bin/sh

if [ $# -ne 1 ]; then
    echo 'You must pass the system variant' > /dev/stderr
    exit 1
fi
variant="$1"

installer() {
    sudo -E HOME="$HOME" /home/fabio/Development/backee/build/backee --variant "$variant"
}

baseInstalled=$(grep base installed.txt)
if [ -z "$baseInstalled" ]; then
    installer base
    echo 'Reboot before continuing'
    exit 0
else
    installer
fi
