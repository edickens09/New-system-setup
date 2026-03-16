#!/bin/bash -i

if ! command -v ranger >/dev/null 2>&1; then

    #apt install
    if command -v apt >/dev/null 2>&1; then
        sudo apt install ranger -y
    fi

   #dnf install 
    if command -v dnf >/dev/null 2>&1; then
        sudo dnf install ranger -y
    fi
fi
