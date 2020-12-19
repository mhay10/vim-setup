#!/bin/bash

# Run the script as root
 if [[ $EUID > 0 ]]; then
	echo 'Please run script as root'
	exit -1
fi

# Make sure you want to continue
echo 'Warning: This will REPLACE the .vimrc file in home dir'
read -p "Are you sure you want to continue? (y/n): " check

# Make sure you enter the correct response
values=('y' 'Y' 'n' 'N')
while [[ ! ${values[@]} =~ $check ]]; do
    read -p 'Are you sure you want to continue? (y/n): ' check
done

# What to do when correct reponse entered
if [[ $check = 'y' || $check = 'Y' ]]; then
	# Make sure curl is installed. If not, install it
	if [[ ! -x $(command -v wget) ]]; then
		apt-get update
		apt-get install wget -y
	fi

	# Check if vim-plug is installed. If not, install it
	if [[ ! -d '/home/maxh/.vim/autoload' ]]; then
		mkdir '/home/maxh/.vim/autoload'

		pluginUrl='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		wget $pluginUrl -O '/home/maxh/.vim/autoload/plug.vim'
	fi

	# Make the .vimrc file in /home/maxh
    if [[ -f '/home/maxh/.vimrc' ]]; then
        rm -rf '/home/maxh/.vimrc'
        cp '.vimrc' '/home/maxh'
    else
		cp '.vimrc' '/home/maxh'
    fi

    echo -e '\n.vimrc file has been overwritten.'
    exit 0
elif [[ $check = 'n' || $check = 'N' ]]; then
    echo 'Okay, bye!'
    exit -1
fi
