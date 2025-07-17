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

#Install Go
curl -O https://raw.githubusercontent.com/edickens09/New-system-setup/master/goSetup.sh | sh

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

#Removal of the snap packaging as I don't like snap
sudo systemctl stop snapd
sudo systemctl disable snapd
sudo systemctl mask snapd
sudo apt purge snapd -y
sudo apt-mark hold snapd

#remove snap directories
rm -rf ~/snap/

#Prevent installation of snap with apt
sudo cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

#remove leftover snap directories
$ rm -rf ~/snap
$ sudo rm -rf /snap
$ sudo rm -rf /var/snap
$ sudo rm -rf /var/lib/snapd

#Download and install Docker Script
cd Downloads
curl -O https://raw.githubusercontent.com/edickens09/docker-install/master/docker-install-pop.sh | sh

#Setup development filestructure
cd ~ && mkdir Workspace && cd Workspace && mkdir Github && cd Github && mkdir edickens09
cd ~ && cd Workspace && mkdir Gitea && cd Gitea && mkdir eric

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

curl https://raw.githubusercontent.com/edickens09/New-system-setup/master/gitSetup.sh | sh
#Cleanup
sudo apt autoremove -y
