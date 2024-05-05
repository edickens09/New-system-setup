#Install git and setup Github
sudo apt install git
curl -sS https://webi.sh/gh | sh
gh auth login
git config --global user.email "you@example.com"
git config --global user.name "username"

#Setup development filestructure
cd ~
mkdir workspace
cd workspace
mkdir Github
cd Github
mkdir edickens09
cd edickens09

# install pyenv dependants
sudo apt update
sudo apt install -y build-essential zlib1g-dev libssl-dev
sudo apt install -y libreadline-dev libbz2-dev libsqlite3-dev libffi-dev
#install pyenv with Webi. These will be steps in comments with some commands
code ~/.bashrc
#add to the bottom line of the document
# xport PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
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

#remove base Vim in debian
sudo apt purge vim-tiny
#install neovim
sudo apt-get install neovim
#install python3 neovim
sudo apt-get install python3-neovim
