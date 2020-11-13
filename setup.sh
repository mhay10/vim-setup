#!/bin/bash

if [[ $EUID > 0 ]]; then
	echo 'Please run script as root'
	exit -1
fi

echo 'Warning: This will REPLACE the .vimrc file in home dir'
read -p "Are you sure you want to continue? (y/n): " check

values=('y' 'Y' 'n' 'N')
while [[ ! ${values[@]} =~ $check ]]; do
    read -p 'Are you sure you want to continue? (y/n): ' check
done

if [[ $check = 'y' || $check = 'Y' ]]; then
    cp '.vimrc' '~'

elif [[ $check = 'n' || $check = 'N' ]]; then
    echo 'Okay, bye'
    exit -1
fi
