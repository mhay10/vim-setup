#!/bin/bash

echo 'Warning: This will REPLACE the init.vim file in ~/.config/nvim'
read -p 'Are you sure you want to continue? (y/n): ' check

values=('y' 'Y' 'n' 'N')
while [[ ! ${values[@]} =~ $check ]]; do
	read -p 'Are you sure you want to continue? (y/n): ' check
done

if [[ $check = 'y' || $check = 'Y' ]]; then
	if [[ ! -x $(command -v wget) ]]; then
		apt-get update
		apt-get install wget -y
	fi

	if [[ ! -d "/home/${USER}/.config/nvim/autoload" ]]; then
		mkdir -p "/home/${USER}/.config/nvim/autoload"

		pluginUrl='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		wget $pluginUrl -O "/home/${USER}/.config/nvim/autoload/plug.vim"
	fi

	if [[ -f "/home/${USER}/.config/nvim/init.vim" ]]; then
		rm -rf "/home/${USER}/.config/nvim/init.vim"
		cp "init.vim" "/home/${USER}/.config/nvim/"
	else
		cp "init.vim" "/home/${USER}/.config/nvim"
	fi

	echo -e "\n'init.vim' file has been overwrittern"
	exit 0
elif [[ $check = 'n' || $check = 'N' ]]; then
	echo 'Okay, bye!'
	exit -1
fi
