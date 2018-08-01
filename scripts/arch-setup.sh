#! /bin/env sh

sudo timedatectl set-timezone America/Sao_Paulo
sudo timedatectl set-ntp true
cat ~/dotfiles/scripts/pacman-list | \
	sed '/^$/d' | 
	sed '/^\#.*$/d' | 
	sudo pacman -S - 

~/dotfiles/scripts/install/install-firacode.sh
~/dotfiles/scripts/install/install-st.sh

