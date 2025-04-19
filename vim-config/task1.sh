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
  		# clone vundle.vim to the user's home directory in the .vim directory
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	else
		echo "Vundle not installed"
	fi
fi

# check if the user wants to install the vim colors and plugins
echo "Install colors and plugins (Y/y), any other key to exit"
read input
if [[ "$input" == "Y" || "$input" == "y" ]]
then
	# check if colors directory exists
	if [[ -e ~/.vim/colors ]]
	then	
 		# download spacecamp colors to directory
		wget -P ~/.vim/colors https://raw.githubusercontent.com/jaredgorski/SpaceCamp/refs/heads/master/colors/spacecamp.vim
	else
 		# create colors directory and download spacecamp colors
		mkdir -p ~/.vim/colors
		wget -P ~/.vim/colors https://raw.githubusercontent.com/jaredgorski/SpaceCamp/refs/heads/master/colors/spacecamp.vim
	fi

	# check if user has nerdtree vim plugin already installed
	if [[ -e ~/.vim/bundle/nerdtree ]]
	then
		echo "You already have NERDTree"
	else
 		# clone nerdtree to .vim directory
		git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
	fi

 	# check if user has indent-guides vim plugin already installed
	if [[ -e ~/.vim/bundle/vim-indent-guides ]]
	then
		echo "You already have Indent Guides"
	else
 		# clone vim-indent-guides to .vim directory
		git clone https://github.com/preservim/vim-indent-guides.git ~/.vim/bundle/vim-indent-guides
	fi
else
	# print message when user declines to install colors or plugins 
	echo "No colors or plugins installed"
fi
