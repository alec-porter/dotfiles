<h1>task3.sh Script Readme</h1>

This script installs Ansible. [Ansible Hompage](https://www.redhat.com/en/ansible-collaborative)

The script checks to see if you are running as root. If you are not running as root (EUID is 0) it exits. <br>
Next, the script checks to see if the apt package manager is installed. If apt is not installed it exits. <br>
Finally, script checks to see if Ansible is already installed on the system. If Ansible is installed it exits. <br>
You will be prompted if you want to install Ansible. Enter "Y" or "y" to install Ansible or any other key to exit without installing.<br>
<br>
If you want to remove Ansible, use the following commands:<br>
```sudo apt-get remove --purge ansible```<br>
```sudo apt-get autoremove```<br>
```sudo apt-get update```<br>
