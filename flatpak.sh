#!/bin/bash -i

if ! command flatpak >/dev/null 2>&1; then

    #apt install
    if command -v apt >/dev/null 2>&1; then
        sudo apt install flatpak -y
    fi

    #dnf install
    if command -v dnf >/dev/nul 2>&1; then
        sudo dnf install flatpak -y
    fi
fi

#flathub repository install
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install Discord
flatpak install --user -y --noninteractive flathub com.discordapp.Discord

#Insall Obsidian
flatpak install --user -y --noninteractive flathub md.obsidian.Obsidian

#Install Spotify
flatpak install --user -y --noninteractive flathub com.spotify.Client

#Install Zen Browser
flatpak install --user -y --noninteractive flathub app.zen_browser.zen
