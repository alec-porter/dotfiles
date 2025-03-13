#!/bin/bash
#
# create alternative directory for bashrc files
echo "This will create a new directoy, backup your current bashrc file, and download an enhanced bashrc file for you to use.  If you want to continue enter Y/y. If you already ran this script and want to revert back to your bashrc file enter R/r. Enter any other key to exit."

read input

if [[ "$input" == "Y" || "$input" == "y" ]]
then
	# check if bashrc file was already downloaded
	if [[ -f $HOME/altbashrc/.alecsultimatebashrc ]]
	then
		echo "I looks like you already ran this script. Terminating."
	else
		mkdir $HOME/altbashrc

		# download bashrc to new directory
		wget https://raw.githubusercontent.com/alec-porter/dotfiles/refs/heads/main/homefiles/.bashrc -O $HOME/altbashrc/.alecsultimatebashrc

		# move bashrc to backup, create symbolic link and enable new bashrc file
		mv $HOME/.bashrc $HOME/.bashrc.bak.revert
		ln -s $HOME/altbashrc/.alecsultimatebashrc $HOME/.bashrc
	
		echo "Your new bashrc file has been downloaded and enabled.  Log out and back in for changes to take effect."
		exec bash
		source $HOME/.bashrc
	fi

elif [[ "$input" == "R" || "$input" == "r" ]]
then
	# check if bashrc backup file exists to revert back to
	if [[ ! -f $HOME/.bashrc.bak.revert ]]
	then
		echo "You do not have a bachrc backup file to revert back to.  It is possible you did not run this script.  Exiting without making changes."
	else
		# remove symbolic link and directory, move backup bashrc file to primary bashrc file 
		echo "Reverting"
		rm $HOME/.bashrc
		mv $HOME/.bashrc.bak.revert $HOME/.bashrc
		rm -r $HOME/altbashrc
		exec bash
		source $HOME/.bashrc
		echo "Original bashrc file restored. Log out and back in for changes to take effect."
	fi

else
	echo "No changes were made."
fi

