#!/bin/bash -i

if ! command -v zoxide >/dev/null 2>&1; then

    #apt install
    if command -v apt >/dev/null 2>&1; then
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
        echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
        source ~/.bashrc

        sudo apt install fzf -y 
    fi

    #dnf install
    if command -v dnf >/dev/null 2>&1; then
        sudo dnf install zoxide -y

        sudo dnf install fzf -y 
    fi

fi
