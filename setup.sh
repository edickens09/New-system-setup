#Set shell to interactive because certain things won't work otherwise
#!/bin/bash -i

#Update system
sudo apt update 
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

# Setup "non-Free" and "contrib" repositories
sudo apt install software-properties-common -y
sudo apt-add-repository contrib non-free -y

#some system installation stuff
sudo apt install i3 -y
sudo apt install dmenu -y
sudo apt install zoxide -y
sudo apt install kitty -y
sudo apt install ranger -y

#Uninstall XFCE
sudo apt remove 'xfce4*' -y
sudo apt purge xfconf xfce4-session xfce4-panel xfce4-utils exo-utils thunar -y

#Install Microsoft fonts
sudo apt install ttf-mscorefonts-installer -y

#Firefox install
sudo apt purge firefox-esr
#Import Mozilla Repo’s Key
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
#Add Firefox Repo
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
#Prioritize Mozilla Repo
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
#Install Firefox
sudo apt update && sudo apt install firefox -y

#Install Go with Webi
curl -sS https://webi.sh/golang | sh
source ~/.config/envman/PATH.env

#remove base Vim in debian
sudo apt purge vim-tiny
#install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# Add to .bashrc
echo 'export PATH=$PATH:/opt/nvim-linux64/bin' >> ~/.bashrc
source ~/.bashrc

#install and setup flatpak
sudo apt install flatpak -y
#add flatpak repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#restart system afterwards

#install discord flatpak
flatpak install flathub com.discordapp.Discord
#Resize flatpak cursor
sudo flatpak override --env=XCURSOR_THEME=Adwaita md.obsidian.Obsidian
sudo flatpak override --env=XCURSOR_SIZE=64 md.obsidian.Obsidian

#install Obsidian flatpak
flatpak install flathub md.obsidian.Obsidian
#Resize flatpak cursor
sudo flatpak override --env=XCURSOR_THEME=Adwaita md.obsidian.Obsidian
sudo flatpak override --env=XCURSOR_SIZE=64 md.obsidian.Obsidian

#Download and install Docker Script
curl -O https://raw.githubusercontent.com/edickens09/docker-install/master/docker-install.sh
sudo sh docker-install.sh

#Setup development filestructure
cd ~ && mkdir Workspace && cd Workspace && mkdir Github && cd Github && mkdir edickens09 && cd edickens09

#Editing .bashrc
echo 'alias vim="nvim"' >> ~/.bashrc
echo 'alias cd-"z"' >> ~/.bashrc
echo 'EDITOR "opt/nvim-linux64/bin/nvim"' >> ~/.bashrc

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
docker --version
nvim --version
flatpak --version
i3 --version
dmenu --version

#Reboot
sudo systemctl reboot
