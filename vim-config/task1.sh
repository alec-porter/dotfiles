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
	echo "Enter Y/y to install it, any other key to exit"
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

echo "Install colors and plugins (Y/y), any other key to exit"
read input
if [[ "$input" == "Y" || "$input" == "y" ]]
then
	if [[ -e ~/.vim/colors ]]
	then
		wget https://raw.githubusercontent.com/jaredgorski/SpaceCamp/refs/heads/master/colors/spacecamp.vim -O ~/.vim/colors/spacecamp.vim
	else
		mkdir -p ~/.vim/colors
		wget https://raw.githubusercontent.com/jaredgorski/SpaceCamp/refs/heads/master/colors/spacecamp.vim -O ~/.vim/colors/spacecamp.vim
	fi

	if [[ -e ~/.vim/bundle/nerdtree ]]
	then
		echo "You already have NERDTree"
	else
		git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
	fi
	
	if [[ -e ~/.vim/bundle/vim-indent-guides ]]
	then
		echo "You already have Indent Guides"
	else
		git clone https://github.com/preservim/vim-indent-guides.git ~/.vim/bundle/vim-indent-guides
	fi
else
	echo "No colors or plugins installed"
fi
