#!/bin/bash -i

if ! command nvim >/dev/null 2>&1; then

    #apt install
    if command -v apt >/dev/null 2>&1; then
        #fresh install download and load neovim into apps
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        sudo rm -rf /opt/nvim-linux-x86_64/
        sudo tar -C /opt/ -xzf nvim-linux-x86_64.tar.gz

        #add to .bashrc
        echo 'export PATH=$PATH:/opt/nvim-linux-x86_64/bin' >> ~/.bashrc
        echo 'alias vim="nvim"' >> ~/.bashrc
        echo 'export EDITOR=/opt/nvm-linux-x86_64/bin/nvim' >> ~/.bashrc
    fi

    #dnf install
    if command -v dnf >/dev/null 2>&1; then
        sudo dnf install nvim -y
        echo 'alias vim="nvim"' >> ~/.bashrc
        echo 'export EDITOR=nvim' >> ~/.bashrc
    fi
fi
