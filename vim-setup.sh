#!/bin/bash

# Make sure you want to continue
echo "Warning: This will REPLACE the .vimrc file in home dir"
read -p "Are you sure you want to continue? (y/n): " check

# Make sure you enter the correct response
values=("y" "Y" "n" "N")
while [[ ! ${values[@]} =~ $check ]]; do
    read -p "Are you sure you want to continue? (y/n): " check
done

# What to do when correct reponse entered
if [[ $check = "y" || $check = "Y" ]]; then
	# Make sure curl is installed. If not, install it
	if [[ ! -x $(command -v wget) ]]; then
		apt-get update
		apt-get install wget -y
	fi

	# Check if vim-plug is installed. If not, install it
	if [[ ! -d "${HOME}/.vim/autoload" ]]; then
		mkdir -p "${HOME}/.vim/autoload"

		pluginUrl="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
		wget $pluginUrl -O "${HOME}/.vim/autoload/plug.vim"
	fi

	# Make the .vimrc file in ${HOME}
    if [[ -f "${HOME}/.vimrc" ]]; then
        rm -rf "${HOME}/.vimrc"
        cp ".vimrc" "${HOME}"
    else
		cp ".vimrc" "${HOME}"
    fi

    echo -e "\n.vimrc file has been overwritten."
    exit 0
elif [[ $check = "n" || $check = "N" ]]; then
    echo "Okay, bye!"
    exit -1
fi
