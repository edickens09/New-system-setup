#Set shell to interactive because certain things won't work otherwise
#!/bin/bash -i

tempDir = $(mktemp -d)
trap 'rm -rf "$tempDir"' EXIT

#Update system
sudo apt update 
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

#some system installation stuff

#install zoxide which is used to replace cd
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
echo 'alias cd "z"' >> ~/.bashrc
source ~/.bashrc

#install ranger a cli file manager
sudo apt install ranger -y

#Install Go
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/goSetup.sh -o "$tempDir/goSetup.sh"

if [ -s "$tempDir/goSetup.sh" ]; then
	source "$tempDir/goSetup.sh"
else
	echo "Download failed"
	exit 1
fi

#unistall Firefox Browswer
sudo apt-get purge firefox
sudo rm -Rf /etc/firefox/

#removal of snap
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/snapRemove.sh -o "$tempDir/snapRemove.sh"

if [ -s "$tempDir/snapRemove.sh"]; then
	source "$tempDir/snapRemove.sh"
else
	echo "Download failed"
	exit 1
fi

#Setup development filestructure
mkdir -p ~/Workspace/Github/edickens09
mkdir -p ~/Workspace/Gitea/eric

#setup Neovim config
cd ~ && cd .config && mkdir nvim && cd nvim && touch init.lua && mkdir lua
cd lua && mkdir config && mkdir plugins && cd config && touch lazy.lua

#Editing .bashrc
echo 'export EDITOR=/opt/nvim-linux64/bin/nvim' >> ~/.bashrc

# install and setup docker
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/docker-install-pop.sh | sh
# install and setup git
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/gitSetup.sh -o "$tempDir/gitSetup.sh"

if [-s "$tempDir/gitSetup.sh"]; then
	source "$tempDir/gitSetup.sh"
else
	echo "Download failed"
	exit 1
fi

# Install flathub and flatpak apps
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/flatpak.sh | sh
#Install neovim from github release
curl -sSfL https://raw.githubusercontent.com/edickens09/New-system-setup/main/nvim.sh | sh

#sourceing the new .bashrc to have new command take effect
source ~/.bashrc

#Cleanup
sudo apt autoremove -y

