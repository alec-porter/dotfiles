#!/bin/bash

echo "Alec Porter Task 1"

# download my .vimrc file to user's home directory
wget -P ~/ https://raw.githubusercontent.com/alec-porter/dotfiles/refs/heads/main/vim-config/.vimrc

# check if Vundle.vim is installed
if [[ -e ~/.vim/bundle/Vundle.vim ]]
then
	echo "Great, Vundle already exists!"
else
	# if Vundle.vim is not installed, ask user to install
	echo "Vundle does not exist"
	echo "Enter y/Y to install it, any other key to exit"
	read input
	# if user enters y or Y then clone the repo
	if [[ "$input" == "Y" || "$input" == "y" ]]
	then
		echo "Installing"
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	else
		echo "Exiting"
	fi
fi
