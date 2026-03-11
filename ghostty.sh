if ! command ghostty; then 
    sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
    sudo apt update
    sudo apt install ghostty

fi
