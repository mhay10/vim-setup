#!/bin/bash

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
	if [[ ! -x $(command -v wget) ]]; then
		apt-cyg update
		apt-cyg install curl
	fi

	# Check if vim-plug is installed. If not, install it
	if [ ! -d '/home/Max/.vim/' ]; then
		mkdir '/home/Max/.vim/'
	elif [ ! -d '/home/Max/.vim/autoload' ]; then
		mkdir '/home/Max/.vim/autoload/'
	fi

	pluginUrl='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	curl $pluginUrl -o '/home/Max/.vim/autoload/plug.vim'

	# Make the .vimrc file in /home/maxh
    if [[ -f '/home/Max/.vimrc' ]]; then
        rm -rf '/home/Max/.vimrc'
        cp '.vimrc' '/home/Max'
    else
	cp '.vimrc' '/home/Max'
    fi

    echo -e '\n.vimrc file has been overwritten.'
    exit 0
elif [[ $check = 'n' || $check = 'N' ]]; then
    echo 'Okay, bye!'
    exit -1
fi
