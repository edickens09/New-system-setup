#fresh install download and load neovim into apps
if ! command nvim; then
	curl -LO https://githubusercontent.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim/
	sudo tar -C /opt/ -xzf nvim-linux64.tar.gz

	#add to .bashrc
	echo 'export PATH-$PATH:/opt/nvim-linux64/bin' >> ~/.bashrc
	source ~/.bashrc
fi
