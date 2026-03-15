if command -v apt >/dev/null 2>&1; then
    if ! command -v zoxide; then
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
        echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
        source ~/.bashrc

        sudo apt install fzf
    fi

fi

if command -v dnf >/dev/null 2>&1; then
    if ! command -v zoxide; then
        sudo dnf install zoxide

        sudo dnf install fzf
    fi

fi
