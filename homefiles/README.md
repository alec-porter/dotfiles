<h2>.bashrc File Overview</h2>
The .bashrc file contains five custom alias:<br>

1. ```alias aws='ssh -i /home/alec/keys/aws-ceg2410.pem ubuntu@54.243.178.91'```<br>
2. ```alias update='sudo apt update; sudo apt upgrade'```<br>
3. ```alias 744='chmod -R 744'```<br>
4. ```alias 777='chmod -R 777'```<br>
5. ```alias lt='ls --human-readable --size -1 -S --classify'```
6. ```alias cpv='rsync -ah --info=progress2'```

The first one connects to my CEG2410 Amazon Web Service instance (not useful to anyone without my key :wink:).<br>
The second one makes updating and upgrading packages slightly easier.<br>
The thrid one sets commonly used file permissions ([reference link](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)).<br>
The fourth one is the "go to" permission setting when you just need something to work ([reference link](https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)).<br>
The fifth one displays the size of each item, and then sorts it by size, in a single column ([reference link](https://opensource.com/article/19/7/bash-aliases)).<br>
The sixth one copies a file and adds a progress bar ([reference link](https://opensource.com/article/19/7/bash-aliases)).<br>

<h2>Script Overview</h2>

The script task2.sh gives you the option to download and enable a new bashrc file or restore your old bashrc file if you previously ran the script.<br>
Entering "Y" or "y" will download and enable the new bashrc file.  For the best results, log out and back in after running the script.<br>
Entering "R" or "r" will revert your old bashrc file and remove the bashrc download from this repo.  For the best results, log out and back in after running the script.<br>
Entering any other key will quit the script without making any changes.<br>
Note: running the script moves your current bashrc file to ```.bashrc.bak.revert```. DO NOT remove this file from your home directory.  Doing so will disable the script's ability to restore your old bashrc file.
