sudo apt install git
curl -sS https://webi.sh/gh | sh
gh auth login
git config --global user.email "you@example.com"
git config --global user.name "username"

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

