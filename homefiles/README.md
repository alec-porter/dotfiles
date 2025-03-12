The .bashrc file contains five custom alias:<br>

1. ```alias aws='ssh -i /home/alec/keys/aws-ceg2410.pem ubuntu@54.243.178.91'```<br>
2. ```alias saud='sudo apt update'```<br>
3. ```alias saug='sudo apt upgrade'```<br>
4. ```alias 744='chmod -R 744'```<br>
5. ```alias 777='chmod -R 777'```<br>

The first one connects to my CEG2410 Amazon Web Service instance.<br>
The second and thrid ones make updating and upgrading packages slightly easier.<br>
The forth one sets commonly used file permissions.<br>
(ref: https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)<br>
The fifth one is the "go to" permission setting when you just need something to work.<br>
(ref: https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c)<br>
