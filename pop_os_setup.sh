#Set shell to interactive because certain things won't work otherwise
#!/bin/bash -i

#Update system
sudo apt update 
sudo apt upgrade -y
sudo apt-get update
sudo apt-get upgrade -y

#some system installation stuff

#install zoxide which is used to replace cd
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

#install ranger a cli file manager
sudo apt install ranger -y

#Install Go
curl -O https://raw.githubusercontent.com/edickens09/New-system-setup/master/goSetup.sh | sh

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

#Setup development filestructure
cd ~ && mkdir Workspace && mkdir ./Workspace/Github  && mkdir ./Workspace/Github/edickens09
mkdir ./Workspace/Gitea && mkdir ./Workspace/Gitea/eric

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

#install from scripts
cd Downloads
# install and setup docker
curl -O https://raw.githubusercontent.com/edickens09/New-system-setup/master/docker-install-pop.sh | sh
# install and setup git
curl -O https://raw.githubusercontent.com/edickens09/New-system-setup/master/gitSetup.sh | sh
# Install flathub and flatpak apps
curl -O https://raw.githubusercontent.com/edickens09/New-system-setup/master/flatpak.sh | sh
#Install neovim from github release
curl -O https://raw.githubusercontent.com/edickens09/New-system-setup/master/nvim.sh | sh

#Cleanup
sudo apt autoremove -y

