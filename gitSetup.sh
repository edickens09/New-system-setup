if command -v apt >/dev/null 2>&1; then
 
    if ! command git; then 
        #install git
        sudo apt-get install git-all

        #This doens't work on PopOS currently
        #install git credential manager
        #curl -L https://aka.ms/gcm/linux-install-source.sh | sh
        #git-credential-manager configure
    fi
fi

if command -v dnf >/dev/null 2>&1; then

    if ! command git; then
        sudo dnf install git-all
        #add some credential manager installation for fedora
    fi
fi


