if command -v apt >/dev/null 2>&1; then
    if ! command flatpak; then
        sudo apt install flatpak
    fi
fi

if command -v dnf >/dev/nul 2&1; then
    if ! command flatpak; then
        sudo dnf install flatpak
    fi
fi

#flathub repository install
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install Discord
flatpak install flathub com.discordapp.Discord

#Insall Obsidian
flatpak install flathub md.obsidian.Obsidian

#Install Spotify
flatpak install flathub com.spotify.Client

#Install Zen Browser
flatpak install flathub app.zen_browser.zen
