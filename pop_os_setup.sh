#Set shell to interactive because certain things won't work otherwise
#!/bin/bash -i

#Update system
sudo apt update 
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

#some system installation stuff
sudo apt install zoxide -y

sudo apt install ranger -y

#Install Go with Webi
curl -sS https://webi.sh/golang | sh
source ~/.config/envman/PATH.env

#install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# Add to .bashrc
echo 'export PATH=$PATH:/opt/nvim-linux64/bin' >> ~/.bashrc
source ~/.bashrc

#add flathub repository to flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#restart system afterwards

#install discord flatpak
flatpak install flathub com.discordapp.Discord

#install Obsidian flatpak
flatpak install flathub md.obsidian.Obsidian

#install Spotify
flatpak install flathub com.spotify.Client

#Download and install Docker Script
curl -O https://raw.githubusercontent.com/edickens09/docker-install/master/docker-install.sh
sudo sh docker-install.sh

#Setup development filestructure
cd ~ && mkdir Workspace && cd Workspace && mkdir Github && cd Github && mkdir edickens09 && cd edickens09

#setup Neovim config
cd ~ && cd .config && mkdir nvim && cd nvim && touch init.lua && mkdir lua
cd lua && mkdir config && mkdir plugins && cd config && touch lazy.lua

#Editing .bashrc
echo 'alias vim="nvim"' >> ~/.bashrc
echo 'alias cd="z"' >> ~/.bashrc
echo 'export EDITOR=/opt/nvim-linux64/bin/nvim' >> ~/.bashrc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc

sudo apt install git
curl -sS https://webi.sh/gh | sh
source ~/.config/envman/PATH.env
gh auth login
git config --global user.email "edickens09@gmail.com"
git config --global user.name "edickens09"

#Cleanup
sudo apt autoremove -y

#Test installs
git --version
go --version
nvim --version
flatpak --version

#Reboot
sudo systemctl reboot
