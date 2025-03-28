#Set shell to interactive because certain things won't work otherwise
#!/bin/bash -i

#Update system
sudo apt update 
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

#some system installation stuff
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

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

#install Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

#unistall Firefox Browswer
sudo apt-get purge firefox
sudo rm -Rf /etc/firefox/

#Download and install Docker Script
cd Downloads
curl -O https://raw.githubusercontent.com/edickens09/docker-install/master/docker-install-pop.sh | sh

#Setup development filestructure
cd ~ && mkdir Workspace && cd Workspace && mkdir Github && cd Github && mkdir edickens09

#setup Neovim config
cd ~ && cd .config && mkdir nvim && cd nvim && touch init.lua && mkdir lua
cd lua && mkdir config && mkdir plugins && cd config && touch lazy.lua

#Editing .bashrc
echo 'alias vim="nvim"' >> ~/.bashrc
echo 'export EDITOR=/opt/nvim-linux64/bin/nvim' >> ~/.bashrc
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
source ~/.bashrc

echo 'alias cd="z"' >> ~/.bashrc
source ~/.bashrc

sudo apt install git -y
curl -sS https://webi.sh/gh | sh
source ~/.config/envman/PATH.env
gh auth login
git config --global user.email "edickens09@gmail.com"
git config --global user.name "edickens09"

#Cleanup
sudo apt autoremove -y
