#!/bin/bash -i

if ! command git >/dev/null 2>&1; then

    #apt install
    if command -v apt >/dev/null 2>&1; then
     
        #install git
        sudo apt-get install git-all -y

        #This doens't work on PopOS currently
        #install git credential manager
        #curl -L https://aka.ms/gcm/linux-install-source.sh | sh
        #git-credential-manager configure
    fi

    #dnf install
    if command -v dnf >/dev/null 2>&1; then

        sudo dnf install git-all -y
        #add some credential manager installation for fedora
    fi
fi


