#!/bin/bash -i
#Set shell to interactive because certain things won't work otherwise

tempDir = $(mktemp -d)
trap 'rm -rf "$tempDir"' EXIT

if command -v apt >/dev/null 2>&1; then 
    #Update system
    sudo apt update 
    sudo apt upgrade -y
    sudo apt-get update
    sudo apt-get upgrade -y

#unistall Firefox Browswer
    sudo apt-get purge firefox
    sudo rm -Rf /etc/firefox/
    sudo rm -rf ~/.mozilla/firefox

    #removal of snap
    curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/snapRemove.sh -o "$tempDir/snapRemove.sh"

    if [ -s "$tempDir/snapRemove.sh"]; then
        source "$tempDir/snapRemove.sh"
    else
        echo "Download failed"
	exit 1
    fi

fi

if command -v dnf >/dev/null 2>&1; then 
   #update system 
    sudo dnf upgrade -y

    #uninstall Firefox Browser
    sudo dnf remove firefox
    sudo dnf -Rf /etc/firefox
    rm -rf ~/.mozilla/firefox

    curl --sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/cosmicSetup.sh -o "$tempDir/cosmicSetup.sh" 

    if [ -s "$tempDir/cosmicSetup.sh" ]; then
        source "$tempDir/zoxide.sh"

    else
        echo "Download failed"
        exit 1
    fi
fi

#install ranger cli file mangaer
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/ranger.sh -o "$tempDir/ranger.sh"

if [ -s "$tempDir/ranger.sh" ]; then
    source "$tempDir/ranger.sh"

else
    echo "Download failed"
fi

#install zoxide which is used to replace cd
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/zoxide.sh -o "$tempDir/zoxide.sh"

if [ -s "$tempDir/zoxide.sh" ]; then
    source "$tempDir/zoxide.sh"

else
    echo "Download failed"

fi

#Install Go
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/goSetup.sh -o "$tempDir/goSetup.sh"

if [ -s "$tempDir/goSetup.sh" ]; then
    source "$tempDir/goSetup.sh"
else
    echo "Download failed"
fi

# install and setup docker
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/dockerInstallPop.sh -o "$tempDir/dockerInstall.sh"
if [ -s "$tempDir/dockerInstall.sh" ]; then
    source "$tempDir/dockerInstall.sh"
else
    echo "Download failed"
fi

# install and setup git
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/gitSetup.sh -o "$tempDir/gitSetup.sh"

if [ -s "$tempDir/gitSetup.sh" ]; then
    source "$tempDir/gitSetup.sh"
else
    echo "Download failed"
fi

# Install flathub and flatpak apps
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/flatpak.sh -o "$tempDir/flatpak.sh"

if [ -s "$tempDir/flatpak.sh" ]; then
    source "$tempDir/flatpak.sh"
else
    echo "Download failed flatpak"
fi

#Install neovim from github release
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/nvim.sh -o "$tempDir/nvim.sh"

if [ -s "$tempDir/nvim.sh" ]; then
    source "$tempDir/nvim.sh"
else
    echo "Download failed nvim"
fi

#Install 1password
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/1password.sh -o "$tempDir/1password.sh"

if [ -s "$tempDir/1password.sh" ]; then
    source "$tempDir/1password.sh"
else
    echo "Download failed 1password"
fi

#Setup development filestructure
mkdir -p ~/Workspace/Github/edickens09
mkdir -p ~/Workspace/Gitea/eric

#sourceing the new .bashrc to have new command take effect
source ~/.bashrc

if command -v apt >/dev/null 2>&1; then
    #Cleanup
    sudo apt autoremove -y
fi

echo "Don't forget to install zig haven't scripted that yet"
echo "Don't forget you have an SSH key for github that needs added"

echo "Please close shell"
