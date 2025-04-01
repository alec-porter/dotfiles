#!/bin/bash


# check is user is root
echo "This script will install Ansible and requires root privileges to run."
read -n 1 -s -r -p "Press any key to continue..."

if [[ $EUID -ne 0 ]]
then
	echo "You are not root or using sudo, exiting script."
	exit # exit script if user is not root
fi
echo "proceeding with installation check."

# check if apt is installed
echo "This script requires the apt package manager, checking if apt is installed."
if ! dpkg-query -l apt >/dev/null
then
	echo "apt not installed, exiting script."
	exit # exit script if apt is not installed
else
	echo "apt is installed"
fi

# check if ansible is installed
echo "Checking if Ansible is installed."
if ! dpkg-query -l ansible >/dev/null
then
	echo "Do you want to install Ansible?  Enter Y/y to install Ansible or any other key to exit."
	read input
	if [[ "$input" == "Y" || "$input" == "y" ]]
	then
		apt update
		apt install software-properties-common
		apt add-apt-repository --yes --update ppa:ansible/ansible
		apt install ansible -y
		echo ""
		echo "The following version of Ansible  was installed"
		ansible --version
		echo "Type 'man ansible' to review the manual"

	else
		echo "Ansible not installed, exiting script."
		exit
	fi
else
	echo "Ansible is already installed."
fi
