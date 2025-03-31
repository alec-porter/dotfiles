#!/bin/bash


# check is user is root
if [[ $EUID -ne 0 ]]
then
	echo "You are not root, exiting script."
	exit # exit script if user is not root
fi
echo "You are root, proceeding with install."

# check if apt is installed
echo "Checking if apt is installed."
if ! dpkg-query -l apt
then
	echo "apt not installed, exiting script."
	exit # exit script if apt is not installed
fi

# check if ansible is installed
echo "Checking if Ansible is installed."
if ! dpkg-query -l ansible
then
	echo "Do you want to install Ansible?  Enter Y/y to install Ansible of any other key to exit."
	read input
	if [[ "$input" == "Y" || "$input" == "y" ]]
	then
		apt update
		apt install software-properties-common
		apt add-apt-repository --yes --update ppa:ansible/ansible
		apt install ansible -y
	else
		echo "Ansible not installed, exiting script."
		exit
	fi
fi
