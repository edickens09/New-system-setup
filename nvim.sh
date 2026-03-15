if command -v apt >/dev/null 2>&1; then
#fresh install download and load neovim into apps
    if ! command nvim; then
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
            sudo rm -rf /opt/nvim-linux-x86_64/
            sudo tar -C /opt/ -xzf nvim-linux-x86_64.tar.gz

            #add to .bashrc
            echo 'export PATH-$PATH:/opt/nvim-linux-x86_64/bin' >> ~/.bashrc
            echo 'alias vim = "nvim"' >> ~/.bashrc
            echo 'export EDITOR=/opt/nvm-linux-x86_64/bin/nvim' >> ~/.bashrc
    fi
fi

if command -v dnf >/dev/null 2>&1; then

    if ! command nvim; then
        sudo dnf install nvim
    fi
fi
