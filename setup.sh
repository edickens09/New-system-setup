#Install git and setup Github
sudo apt install git
curl -sS https://webi.sh/gh | sh
gh auth login
git config --global user.email "edickens09@gmail.com"
git config --global user.name "edickens09"

#Setup development filestructure
cd ~ && mkdir Workspace && cd Workspace && mkdir Github && cd Github && mkdir edickens09 && cd edickens09

# install pyenv dependants
sudo apt update
sudo apt install -y build-essential zlib1g-dev libssl-dev
sudo apt install -y libreadline-dev libbz2-dev libsqlite3-dev libffi-dev
#install pyenv with Webi
#add to the bottom line of .bashrc
echo 'xport PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
#Webi install
curl -sS https://webi.sh/pyenv | sh
#Close terminal and reopen
pyenv install

# Setup "non-Free" and "contrib" repositories
sudo apt install software-properties-common -y
sudo apt-add-repository contrib non-free -y

#Install Microsoft fonts
sudo apt install ttf-mscorefonts-installer

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
sudo apt update && sudo apt install firefox

#Install Go with Webi
curl -sS https://webi.sh/golang | sh

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
sudo apt install flatpak
#install gnome flatpak
sudo apt install gnome-software-plugin-flatpak
#add flatpak repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#restart system afterwards

#install discord flatpak
flatpak install flathub com.discordapp.Discord
#Resize flatpak cursor
sudo flatpak override --env=XCURSOR_THEME=Adwaita md.obsidian.Obsidian
sudo flatpak override --env=XCURSOR_SIZE=64 md.obsidian.Obsidian
#run discord flatpak in background
flatpak run com.discordapp.Discord &

#install Obsidian flatpak
flatpak install flathub md.obsidian.Obsidian
#Resize flatpak cursor
sudo flatpak override --env=XCURSOR_THEME=Adwaita md.obsidian.Obsidian
sudo flatpak override --env=XCURSOR_SIZE=64 md.obsidian.Obsidian
#Run Obsidian flatpak
flatpak run md.obsidian.Obsidian &

#Download and install Docker Script
curl -O https://raw.githubusercontent.com/edickens09/docker-install/master/docker-install.sh
sudo sh docker-install.sh
